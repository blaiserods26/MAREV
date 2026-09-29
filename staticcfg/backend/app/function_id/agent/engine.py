import logging
from typing import Dict, Any, List, Optional
from app.analysis.models import CachedAnalysis
from app.function_id.models import (
    SemanticCategory,
    CandidatePrediction,
    IdentificationResult,
    RecoveredSignature,
    ParameterSignature,
)
from app.function_id.agent.tools import FunctionInspectionToolset
from app.function_id.agent.providers import BaseLLMProvider, get_default_provider

logger = logging.getLogger(__name__)

class AgenticFunctionIdentifier:
    """
    Agentic AI function identification and signature recovery engine for x86-64 binaries.
    Replaces static/unimplemented ML models with interactive LLM-driven reverse engineering.
    """

    def __init__(
        self,
        analysis: CachedAnalysis,
        provider: Optional[BaseLLMProvider] = None,
    ) -> None:
        self.analysis = analysis
        self.provider = provider or get_default_provider()
        self.toolset = FunctionInspectionToolset(analysis)

    def identify_function(self, func_name: str) -> IdentificationResult:
        """
        Executes on-demand agentic reverse engineering for a specific function.
        Gathers CFG metrics, basic blocks, callers, callees, and nested subroutines,
        invokes the LLM provider, and produces a typed RecoveredSignature.
        """
        resolved_name = self.toolset._resolve_function_name(func_name)
        if not resolved_name:
            raise ValueError(f"Function '{func_name}' not found in active analysis CFGs.")

        # 1. Gather Ground-Truth Context from Inspection Toolset
        prompt = self.toolset.format_llm_prompt(resolved_name)

        # 2. Check and fetch nested callee subroutines (Bottom-Up semantic composition)
        callees = self.toolset.get_callees(resolved_name)
        callee_contexts = []
        nested_callees_analyzed = []

        for c in callees[:3]:  # Inspect up to 3 child subroutines
            callee_name = c["function_name"]
            callee_data = self.toolset.fetch_nested_or_callee_code(callee_name)
            if "error" not in callee_data:
                nested_callees_analyzed.append(callee_name)
                strings_str = ", ".join([f'"{s}"' for s in callee_data.get("strings", [])]) or "None"
                inst_lines = []
                for b in callee_data.get("blocks", [])[:3]:
                    inst_lines.extend(b.get("instructions", [])[:5])
                callee_contexts.append(
                    f"Subroutine `{callee_name}` (blocks: {callee_data['block_count']}, complexity: {callee_data['cyclomatic_complexity']}):\n"
                    f"  Strings: {strings_str}\n"
                    f"  Instructions:\n    " + "\n    ".join(inst_lines)
                )

        callee_context_str = "\n\n".join(callee_contexts) if callee_contexts else None

        # 3. Invoke LLM Provider
        try:
            raw_sig = self.provider.generate_signature(prompt, callee_context=callee_context_str)
        except Exception as e:
            logger.error(f"Agent provider inference failed: {e}")
            raise RuntimeError(f"Agentic identification failed: {str(e)}")

        # 4. Parse Parameters & RecoveredSignature
        params: List[ParameterSignature] = []
        for p in raw_sig.get("parameters", []):
            params.append(
                ParameterSignature(
                    name=p.get("name", "arg"),
                    type_name=p.get("type_name", "void*"),
                    register_or_location=p.get("register_or_location"),
                    description=p.get("description"),
                )
            )

        name = raw_sig.get("name", resolved_name)
        ret_type = raw_sig.get("return_type", "void")
        calling_conv = raw_sig.get("calling_convention", "System V AMD64")
        summary = raw_sig.get("summary", "Function recovered via agentic reverse engineering.")
        confidence = float(raw_sig.get("confidence", 0.80))
        reasoning = raw_sig.get("reasoning", ["Deduced from CFG and assembly analysis."])
        c_prototype = raw_sig.get("c_prototype", f"{ret_type} {name}()")

        # Map to SemanticCategory
        category = SemanticCategory.UNKNOWN
        name_lower = name.lower()
        if any(w in name_lower for w in ("str", "parse", "format")):
            category = SemanticCategory.STRING_PROCESSING
        elif any(w in name_lower for w in ("alloc", "free", "mem", "buf")):
            category = SemanticCategory.MEMORY_MANAGEMENT
        elif any(w in name_lower for w in ("hash", "sha", "crypto", "cipher", "aes", "crc")):
            category = SemanticCategory.CRYPTOGRAPHY
        elif any(w in name_lower for w in ("validate", "verify", "check", "auth")):
            category = SemanticCategory.VALIDATION
        elif any(w in name_lower for w in ("sock", "net", "http", "packet")):
            category = SemanticCategory.NETWORKING
        elif any(w in name_lower for w in ("file", "read", "write", "open")):
            category = SemanticCategory.FILE_IO

        recovered_sig = RecoveredSignature(
            name=name,
            return_type=ret_type,
            parameters=params,
            calling_convention=calling_conv,
            c_prototype=c_prototype,
            summary=summary,
            confidence=min(0.99, max(0.01, confidence)),
            reasoning=reasoning,
            nested_callees_analyzed=nested_callees_analyzed,
        )

        candidate = CandidatePrediction(
            predicted_name=name,
            confidence=recovered_sig.confidence,
            category=category,
            evidence=[f"+ Agentic Reverse Engineering: {r}" for r in reasoning],
        )

        # 5. Assemble Result and Update Analysis Session
        existing_ident = self.analysis.identifications.get(resolved_name)
        func_addr = existing_ident.address if existing_ident else 0
        formatted_addr = existing_ident.formatted_address if existing_ident else "0x0"

        updated_ident = IdentificationResult(
            recovered_name=resolved_name,
            address=func_addr,
            formatted_address=formatted_addr,
            semantic_category=category,
            is_exact_library_match=False,
            top_prediction=candidate,
            alternative_candidates=existing_ident.alternative_candidates if existing_ident else [],
            evidence_summary=candidate.evidence,
            recovered_signature=recovered_sig,
        )

        # Cache in active analysis
        self.analysis.identifications[resolved_name] = updated_ident
        cleaned = resolved_name.strip("<>")
        self.analysis.identifications[cleaned] = updated_ident

        return updated_ident
