from typing import Dict, Any, List, Optional, Union
from app.ir.models import Function, CFG
from app.analysis.fingerprint import FunctionFingerprint
from app.function_id.models import (
    SemanticCategory,
    CandidatePrediction,
    IdentificationResult,
)
from app.function_id.database import SignatureDatabase, KnownFunctionSignature
from app.function_id.semantic_classifier import RuleBasedSemanticClassifier
from app.function_id.ml_interface import BaseMLClassifier

class FunctionIdentificationPipeline:
    """
    Multi-stage explainable function identification pipeline for stripped binaries.
    """

    def __init__(
        self,
        database: Optional[SignatureDatabase] = None,
        semantic_classifier: Optional[RuleBasedSemanticClassifier] = None,
        ml_classifier: Optional[BaseMLClassifier] = None,
    ) -> None:
        self.db = database or SignatureDatabase()
        self.semantic_classifier = semantic_classifier or RuleBasedSemanticClassifier()
        self.ml_classifier = ml_classifier

    def identify_function(
        self,
        func_or_name: Union[Function, str],
        cfg_or_dict: Union[CFG, Dict[str, Any]],
        fp_or_dict: Union[FunctionFingerprint, Dict[str, Any]],
        call_graph_callers: Optional[List[str]] = None,
    ) -> IdentificationResult:
        """
        Run multi-stage identification pipeline for a single function.
        Supports both Pydantic IR objects and dictionaries.
        """
        # Extract function metadata
        if isinstance(func_or_name, Function):
            func_name = func_or_name.name
            func_addr = func_or_name.start_address
        else:
            func_name = str(func_or_name)
            func_addr = 0

        # Convert Fingerprint to dict if needed
        if isinstance(fp_or_dict, FunctionFingerprint):
            fingerprint = fp_or_dict.model_dump()
            func_addr = fp_or_dict.start_address
            loop_cnt = fp_or_dict.loop_count
        else:
            fingerprint = fp_or_dict
            loop_cnt = fingerprint.get("loop_count", 0)
            if "start_address" in fingerprint and isinstance(fingerprint["start_address"], int):
                func_addr = fingerprint["start_address"]
            elif "address" in fingerprint and isinstance(fingerprint["address"], int):
                func_addr = fingerprint["address"]

        # Convert CFG to dict if needed
        if isinstance(cfg_or_dict, CFG):
            cfg_dict = {
                "block_count": len(cfg_or_dict.nodes),
                "edge_count": len(cfg_or_dict.edges),
                "cyclomatic_complexity": cfg_or_dict.cyclomatic_complexity,
                "loop_count": loop_cnt,
            }
        else:
            cfg_dict = cfg_or_dict

        if call_graph_callers:
            fingerprint["callers"] = call_graph_callers

        formatted_addr = f"0x{func_addr:x}"

        # 1. Semantic Category & Rule Evidence
        classifier_res = self.semantic_classifier.classify(fingerprint)
        category = classifier_res[0]
        rule_evidence = classifier_res[1]

        # 2. Check Exact Library Match (if explicit symbol exists)
        exact_match_names = {"strlen", "strcmp", "strcpy", "memcpy", "memset", "malloc", "free", "fopen", "fread", "fwrite", "fclose"}
        clean_name = func_name.strip("<>")
        is_exact_match = clean_name.lower() in exact_match_names

        candidates: List[CandidatePrediction] = []

        if is_exact_match:
            cand = CandidatePrediction(
                predicted_name=clean_name.lower(),
                confidence=1.0,
                category=category if category != SemanticCategory.UNKNOWN else SemanticCategory.STRING_PROCESSING,
                evidence=[f"+ Explicit symbol table export matches known C library routine '{clean_name}'"] + rule_evidence,
            )
            candidates.append(cand)

        # 3. Match against Signature Database
        for sig in self.db.signatures:
            conf, sig_evidence = self._score_signature(sig, fingerprint, cfg_dict)
            if conf >= 0.30:
                combined_ev = list(dict.fromkeys(sig_evidence + rule_evidence))
                candidates.append(
                    CandidatePrediction(
                        predicted_name=sig.name,
                        confidence=min(0.99, conf),
                        category=sig.category,
                        evidence=combined_ev,
                    )
                )

        # 4. Optional ML Classifier
        if self.ml_classifier and self.ml_classifier.is_available():
            try:
                ml_cands = self.ml_classifier.predict(fingerprint, cfg_dict)
                candidates.extend(ml_cands)
            except Exception:
                pass

        # Sort candidates by confidence descending
        candidates.sort(key=lambda c: c.confidence, reverse=True)

        # Deduplicate candidate names keeping highest confidence
        unique_candidates: List[CandidatePrediction] = []
        seen_names = set()
        for c in candidates:
            if c.predicted_name not in seen_names:
                seen_names.add(c.predicted_name)
                unique_candidates.append(c)

        top_pred: Optional[CandidatePrediction] = None
        alternatives: List[CandidatePrediction] = []

        if unique_candidates:
            top_pred = unique_candidates[0]
            alternatives = unique_candidates[1:4]
        else:
            is_stripped = clean_name.startswith("sub_") or clean_name.startswith("0x")
            fallback_name = clean_name if not is_stripped else f"anon_{category.value.lower()}_{formatted_addr}"
            conf = 0.50 if category != SemanticCategory.UNKNOWN else 0.20
            top_pred = CandidatePrediction(
                predicted_name=fallback_name,
                confidence=conf,
                category=category,
                evidence=rule_evidence if rule_evidence else ["+ Default structural baseline fallback"],
            )

        final_category = top_pred.category if top_pred else category
        summary_ev = top_pred.evidence if top_pred else rule_evidence

        return IdentificationResult(
            recovered_name=func_name,
            address=func_addr,
            formatted_address=formatted_addr,
            semantic_category=final_category,
            is_exact_library_match=is_exact_match,
            top_prediction=top_pred,
            alternative_candidates=alternatives,
            evidence_summary=summary_ev,
        )

    def _score_signature(
        self,
        sig: KnownFunctionSignature,
        fp: Dict[str, Any],
        cfg_dict: Dict[str, Any],
    ) -> tuple[float, List[str]]:
        score = 0.0
        evidence: List[str] = []

        calls = [c.lower() for c in fp.get("called_functions", [])]
        strings = [s.lower() for s in fp.get("string_references", [])]
        constants = set(fp.get("constants", []))
        mnemonics = fp.get("mnemonic_counts", {})
        inst_count = fp.get("instruction_count", 0)

        # API Call matching
        if sig.expected_api_calls:
            matched_apis = set(calls).intersection({c.lower() for c in sig.expected_api_calls})
            if matched_apis:
                score += 0.30 + 0.10 * (len(matched_apis) - 1)
                evidence.append(f"+ Matches expected API calls: {', '.join(matched_apis)}")

        # String Keyword matching
        if sig.expected_string_keywords:
            matched_kw = []
            for kw in sig.expected_string_keywords:
                if any(kw in s for s in strings):
                    matched_kw.append(kw)
            if matched_kw:
                score += 0.30 + 0.05 * (len(matched_kw) - 1)
                evidence.append(f"+ String reference matches keywords: {', '.join(matched_kw)}")

        # Constant matching
        if sig.expected_constants:
            matched_c = constants.intersection(set(sig.expected_constants))
            if matched_c:
                score += 0.40
                hex_c = [hex(c) for c in matched_c]
                evidence.append(f"+ Exact match on signature constants: {', '.join(hex_c)}")

        # Mnemonic pattern matching
        if sig.mnemonic_patterns:
            matched_p = [p for p in sig.mnemonic_patterns if p in mnemonics]
            if matched_p:
                score += 0.30
                evidence.append(f"+ Contains characteristic instruction pattern: {', '.join(matched_p)}")

        # Instruction count sanity check
        if sig.min_instructions <= inst_count <= sig.max_instructions:
            score += 0.05
        else:
            score -= 0.10

        return min(0.99, max(0.0, score)), evidence

IdentificationPipeline = FunctionIdentificationPipeline
