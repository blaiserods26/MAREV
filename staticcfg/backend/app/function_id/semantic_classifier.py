from typing import Dict, Any, List, Tuple, Optional, Union
from app.function_id.models import SemanticCategory
from app.ir.models import Function
from app.analysis.fingerprint import FunctionFingerprint

class RuleBasedSemanticClassifier:
    """Classifies function semantic category based on explainable binary features."""

    def classify(
        self,
        func_or_fp: Union[Function, FunctionFingerprint, Dict[str, Any]],
        fp_or_none: Optional[Union[FunctionFingerprint, Dict[str, Any]]] = None,
    ) -> Tuple[SemanticCategory, List[str], Dict[SemanticCategory, float]]:
        """
        Classifies function into SemanticCategory, returning (category, evidence_lines, category_scores).
        """
        if fp_or_none is not None:
            fp_obj = fp_or_none
        else:
            fp_obj = func_or_fp

        if isinstance(fp_obj, FunctionFingerprint):
            fingerprint = fp_obj.model_dump()
        elif isinstance(fp_obj, dict):
            fingerprint = fp_obj
        elif isinstance(fp_obj, Function):
            fingerprint = {
                "string_references": fp_obj.string_references,
                "called_functions": list(fp_obj.call_targets),
                "constants": [inst.operands[0] for block in fp_obj.basic_blocks for inst in block.instructions if inst.operands and isinstance(inst.operands[0], int)],
                "loop_count": 0,
                "branch_count": sum(1 for block in fp_obj.basic_blocks for inst in block.instructions if inst.is_branch),
                "instruction_count": fp_obj.instruction_count,
                "mnemonic_counts": {},
            }
        else:
            fingerprint = {}

        strings = [s.lower() for s in fingerprint.get("string_references", [])]
        calls = [c.lower() for c in fingerprint.get("called_functions", [])]
        raw_consts = fingerprint.get("constants", [])
        constants = set(raw_consts) if isinstance(raw_consts, list) else set()
        loop_count = fingerprint.get("loop_count", 0)
        branch_count = fingerprint.get("branch_count", 0)
        inst_count = fingerprint.get("instruction_count", 0)
        mnemonics = fingerprint.get("mnemonic_counts", {})

        category_scores: Dict[SemanticCategory, float] = {cat: 0.0 for cat in SemanticCategory}
        evidence_map: Dict[SemanticCategory, List[str]] = {cat: [] for cat in SemanticCategory}

        # 1. STRING_PROCESSING
        string_apis = {"strlen", "strcmp", "strncmp", "strcpy", "strncpy", "strcat", "sprintf", "snprintf", "strstr", "strchr"}
        matched_string_apis = set(calls).intersection(string_apis)
        if matched_string_apis:
            category_scores[SemanticCategory.STRING_PROCESSING] += 0.4 * len(matched_string_apis)
            evidence_map[SemanticCategory.STRING_PROCESSING].append(
                f"+ Calls string manipulation API(s): {', '.join(matched_string_apis)}"
            )

        if "repne scasb" in mnemonics or "repe cmpsb" in mnemonics or "movsb" in mnemonics:
            category_scores[SemanticCategory.STRING_PROCESSING] += 0.5
            evidence_map[SemanticCategory.STRING_PROCESSING].append(
                "+ Contains string scan/compare instructions (scasb/cmpsb/movsb)"
            )

        # 2. MEMORY_MANAGEMENT
        mem_apis = {"malloc", "calloc", "realloc", "free", "memcpy", "memset", "memmove", "mmap", "munmap"}
        matched_mem_apis = set(calls).intersection(mem_apis)
        if matched_mem_apis:
            category_scores[SemanticCategory.MEMORY_MANAGEMENT] += 0.4 * len(matched_mem_apis)
            evidence_map[SemanticCategory.MEMORY_MANAGEMENT].append(
                f"+ Calls memory management API(s): {', '.join(matched_mem_apis)}"
            )

        if "rep movsb" in mnemonics or "rep stosb" in mnemonics:
            category_scores[SemanticCategory.MEMORY_MANAGEMENT] += 0.5
            evidence_map[SemanticCategory.MEMORY_MANAGEMENT].append(
                "+ Contains block copy/fill string instructions (rep movsb/stosb)"
            )

        # 3. FILE_IO
        io_apis = {"fopen", "fclose", "fread", "fwrite", "fseek", "open", "read", "write", "close", "printf", "puts", "scanf"}
        matched_io_apis = set(calls).intersection(io_apis)
        if matched_io_apis:
            category_scores[SemanticCategory.FILE_IO] += 0.4 * len(matched_io_apis)
            evidence_map[SemanticCategory.FILE_IO].append(
                f"+ Calls File/IO API(s): {', '.join(matched_io_apis)}"
            )

        io_keywords = {"file", "read", "write", "open", "stream", "path", "directory", "log"}
        for s in strings:
            if any(kw in s for kw in io_keywords):
                category_scores[SemanticCategory.FILE_IO] += 0.25
                evidence_map[SemanticCategory.FILE_IO].append(f"+ Contains I/O keyword string: '{s}'")

        # 4. NETWORKING
        net_apis = {"socket", "connect", "bind", "listen", "accept", "send", "recv", "htons", "htonl", "inet_addr"}
        matched_net_apis = set(calls).intersection(net_apis)
        if matched_net_apis:
            category_scores[SemanticCategory.NETWORKING] += 0.5 * len(matched_net_apis)
            evidence_map[SemanticCategory.NETWORKING].append(
                f"+ Calls socket/network API(s): {', '.join(matched_net_apis)}"
            )

        net_keywords = {"http", "https", "socket", "port", "host", "connect", "ip", "url", "tcp", "udp"}
        for s in strings:
            if any(kw in s for kw in net_keywords):
                category_scores[SemanticCategory.NETWORKING] += 0.3
                evidence_map[SemanticCategory.NETWORKING].append(f"+ Contains network keyword string: '{s}'")

        # 5. CRYPTOGRAPHY
        crypto_consts = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0xedb88320, 0x04c11db7, 0x106aa070}
        matched_consts = constants.intersection(crypto_consts)
        if matched_consts:
            category_scores[SemanticCategory.CRYPTOGRAPHY] += 0.6
            hex_consts = [hex(c) for c in matched_consts]
            evidence_map[SemanticCategory.CRYPTOGRAPHY].append(
                f"+ References cryptographic constant(s): {', '.join(hex_consts)}"
            )

        # 6. VALIDATION
        valid_keywords = {"password", "access", "login", "granted", "denied", "valid", "invalid", "auth", "secret", "token", "check", "verify", "correct"}
        for s in strings:
            if any(kw in s for kw in valid_keywords):
                category_scores[SemanticCategory.VALIDATION] += 0.45
                evidence_map[SemanticCategory.VALIDATION].append(f"+ Contains validation string keyword: '{s}'")

        if branch_count >= 1 and ("strcmp" in calls or "strncmp" in calls or "memcmp" in calls):
            category_scores[SemanticCategory.VALIDATION] += 0.55
            evidence_map[SemanticCategory.VALIDATION].append(
                "+ Combines string comparison API with conditional branch structure (validation pattern)"
            )

        # 7. PARSING
        parse_keywords = {"parse", "token", "syntax error", "unexpected", "delimiter", "json", "xml", "ast"}
        for s in strings:
            if any(kw in s for kw in parse_keywords):
                category_scores[SemanticCategory.PARSING] += 0.35
                evidence_map[SemanticCategory.PARSING].append(f"+ Contains parser keyword string: '{s}'")

        if loop_count >= 1 and branch_count >= 3 and inst_count > 30:
            category_scores[SemanticCategory.PARSING] += 0.25
            evidence_map[SemanticCategory.PARSING].append(
                "+ High cyclomatic complexity with loop and multi-way branch structure"
            )

        # 8. ERROR_HANDLING
        err_apis = {"exit", "abort", "perror", "err", "error"}
        matched_err_apis = set(calls).intersection(err_apis)
        if matched_err_apis:
            category_scores[SemanticCategory.ERROR_HANDLING] += 0.4
            evidence_map[SemanticCategory.ERROR_HANDLING].append(
                f"+ Calls error/termination API(s): {', '.join(matched_err_apis)}"
            )

        err_keywords = {"error", "fatal", "failed", "invalid", "exception", "panic", "usage:", "invalid argument"}
        for s in strings:
            if any(kw in s for kw in err_keywords):
                category_scores[SemanticCategory.ERROR_HANDLING] += 0.3
                evidence_map[SemanticCategory.ERROR_HANDLING].append(f"+ Contains error string: '{s}'")

        # Select top category
        best_cat = SemanticCategory.UNKNOWN
        best_score = 0.0
        for cat, score in category_scores.items():
            if cat == SemanticCategory.UNKNOWN:
                continue
            if score > best_score:
                best_score = score
                best_cat = cat

        if best_score < 0.2:
            return SemanticCategory.UNKNOWN, ["+ No strong domain-specific evidence detected; categorized as general function"], category_scores

        return best_cat, evidence_map[best_cat], category_scores

# Alias for backward compatibility
SemanticClassifier = RuleBasedSemanticClassifier
