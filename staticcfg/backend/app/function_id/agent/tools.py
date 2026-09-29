from typing import Dict, Any, List, Optional
from app.analysis.models import CachedAnalysis
from app.ir.models import CFG, BasicBlock, Instruction
from app.analysis.fingerprint import FunctionFingerprint
from app.function_id.models import IdentificationResult

class FunctionInspectionToolset:
    """
    Deterministic reverse engineering inspection tools for the Agentic Function Identifier.
    Extracts grounded facts from CFGs, instruction sequences, call graphs, and fingerprints.
    """

    def __init__(self, analysis: CachedAnalysis) -> None:
        self.analysis = analysis

    def _resolve_function_name(self, name: str) -> Optional[str]:
        """Resolves function name handling optional angle brackets."""
        if name in self.analysis.cfgs:
            return name
        cleaned = name.strip("<>")
        if cleaned in self.analysis.cfgs:
            return cleaned
        bracketed = f"<{cleaned}>"
        if bracketed in self.analysis.cfgs:
            return bracketed
        return None

    def get_function_cfg(self, func_name: str) -> Optional[CFG]:
        resolved = self._resolve_function_name(func_name)
        return self.analysis.cfgs.get(resolved) if resolved else None

    def get_function_fingerprint(self, func_name: str) -> Optional[FunctionFingerprint]:
        resolved = self._resolve_function_name(func_name)
        return self.analysis.fingerprints.get(resolved) if resolved else None

    def get_function_identification(self, func_name: str) -> Optional[IdentificationResult]:
        resolved = self._resolve_function_name(func_name)
        return self.analysis.identifications.get(resolved) if resolved else None

    def get_callers(self, func_name: str) -> List[str]:
        resolved = self._resolve_function_name(func_name) or func_name
        cleaned = resolved.strip("<>")
        callgraph = self.analysis.callgraph
        rel = callgraph.relationships.get(resolved) or callgraph.relationships.get(cleaned)
        if not rel and "<" + cleaned + ">" in callgraph.relationships:
            rel = callgraph.relationships.get("<" + cleaned + ">")

        if not rel:
            return []
        return [c.function_name for c in rel.callers]

    def get_callees(self, func_name: str) -> List[Dict[str, Any]]:
        resolved = self._resolve_function_name(func_name) or func_name
        cleaned = resolved.strip("<>")
        callgraph = self.analysis.callgraph
        rel = callgraph.relationships.get(resolved) or callgraph.relationships.get(cleaned)
        if not rel and "<" + cleaned + ">" in callgraph.relationships:
            rel = callgraph.relationships.get("<" + cleaned + ">")

        if not rel:
            return []

        callees: List[Dict[str, Any]] = []
        for c in rel.callees:
            callee_ident = self.get_function_identification(c.function_name)
            predicted_name = callee_ident.top_prediction.predicted_name if (callee_ident and callee_ident.top_prediction) else None
            callees.append({
                "function_name": c.function_name,
                "address": hex(c.address),
                "call_type": "direct",
                "predicted_identity": predicted_name,
            })
        return callees


    def fetch_nested_or_callee_code(
        self,
        callee_name: str,
        max_instructions: int = 50,
        current_depth: int = 0,
        max_depth: int = 2
    ) -> Dict[str, Any]:
        """
        Retrieves the instruction stream, CFG metrics, and child calls of a nested subroutine / callee.
        Supports recursive exploration up to max_depth for deep bottom-up semantic composition.
        """
        resolved = self._resolve_function_name(callee_name)
        if not resolved or resolved not in self.analysis.cfgs:
            return {"error": f"Nested subroutine '{callee_name}' not found or external"}

        cfg = self.analysis.cfgs[resolved]
        fp = self.get_function_fingerprint(resolved)
        ident = self.get_function_identification(resolved)

        blocks_summary = []
        total_insts = 0
        sorted_blocks = sorted(cfg.nodes, key=lambda b: b.start_address) if isinstance(cfg.nodes, list) else sorted(cfg.nodes.values(), key=lambda b: b.start_address)

        for block in sorted_blocks:
            block_lines = []
            for inst in block.instructions:
                total_insts += 1
                if total_insts <= max_instructions:
                    block_lines.append(f"  {inst.formatted_address}: {inst.mnemonic} {inst.operands}".rstrip())
            blocks_summary.append({
                "block_id": block.id,
                "instructions": block_lines,
                "successors": block.successors,
            })
            if total_insts > max_instructions:
                break

        # Recursive exploration of nested child callees if depth permits
        nested_children = []
        if current_depth < max_depth:
            child_callees = self.get_callees(resolved)
            for cc in child_callees[:2]:  # Check up to 2 second-level child calls
                child_name = cc["function_name"]
                if child_name != resolved:  # Prevent direct recursive loop
                    nested_res = self.fetch_nested_or_callee_code(
                        child_name,
                        max_instructions=25,
                        current_depth=current_depth + 1,
                        max_depth=max_depth
                    )
                    if "error" not in nested_res:
                        nested_children.append(nested_res)

        return {
            "function_name": resolved,
            "block_count": len(cfg.nodes),
            "cyclomatic_complexity": cfg.cyclomatic_complexity,
            "loop_count": fp.loop_count if fp else 0,
            "strings": fp.string_references if fp else [],
            "constants": [hex(c) for c in (fp.constants if fp else [])],
            "known_identity": ident.top_prediction.predicted_name if (ident and ident.top_prediction) else None,
            "recovered_signature": ident.recovered_signature.c_prototype if (ident and ident.recovered_signature) else None,
            "blocks": blocks_summary,
            "nested_children": nested_children,
            "truncated": total_insts > max_instructions,
        }


    def inspect_function(self, func_name: str) -> Dict[str, Any]:
        """
        Builds a comprehensive inspection report for the target function.
        """
        resolved = self._resolve_function_name(func_name)
        if not resolved or resolved not in self.analysis.cfgs:
            raise ValueError(f"Function '{func_name}' not found in active analysis CFGs.")

        cfg = self.analysis.cfgs[resolved]
        fp = self.get_function_fingerprint(resolved)
        ident = self.get_function_identification(resolved)

        # Detect register arguments used based on System V AMD64 ABI
        arg_registers = {"rdi", "edi", "rsi", "esi", "rdx", "edx", "rcx", "ecx", "r8", "r8d", "r9", "r9d"}
        observed_arg_regs = set()
        returns_value = False

        blocks_repr = []
        sorted_blocks = sorted(cfg.nodes, key=lambda b: b.start_address) if isinstance(cfg.nodes, list) else sorted(cfg.nodes.values(), key=lambda b: b.start_address)

        for block in sorted_blocks:
            insts = []
            for inst in block.instructions:
                op_lower = inst.operands.lower()
                mn_lower = inst.mnemonic.lower()

                # Check argument registers
                for reg in arg_registers:
                    if reg in op_lower:
                        observed_arg_regs.add(reg)

                # Check return value register
                if ("rax" in op_lower or "eax" in op_lower) and mn_lower in ("mov", "xor", "lea", "add", "sub", "movzbl"):
                    returns_value = True

                insts.append(f"{inst.formatted_address}: {inst.mnemonic} {inst.operands}".rstrip())

            blocks_repr.append({
                "block_id": block.id,
                "address_range": f"0x{block.start_address:x} - 0x{block.end_address:x}",
                "instructions": insts,
                "successors": block.successors,
                "predecessors": block.predecessors,
                "terminator": block.terminator_type.value if block.terminator_type else None,
            })

        # Get callers and callees
        callers = self.get_callers(resolved)
        callees = self.get_callees(resolved)

        # Heuristic argument count estimation from observed System V registers
        estimated_arg_count = 0
        if any(r in observed_arg_regs for r in ("rdi", "edi")):
            estimated_arg_count = max(estimated_arg_count, 1)
        if any(r in observed_arg_regs for r in ("rsi", "esi")):
            estimated_arg_count = max(estimated_arg_count, 2)
        if any(r in observed_arg_regs for r in ("rdx", "edx")):
            estimated_arg_count = max(estimated_arg_count, 3)
        if any(r in observed_arg_regs for r in ("rcx", "ecx")):
            estimated_arg_count = max(estimated_arg_count, 4)
        if any(r in observed_arg_regs for r in ("r8", "r8d")):
            estimated_arg_count = max(estimated_arg_count, 5)
        if any(r in observed_arg_regs for r in ("r9", "r9d")):
            estimated_arg_count = max(estimated_arg_count, 6)

        entry_block = next((b for b in sorted_blocks if b.id == cfg.entry_block_id or b.id == cfg.entry), sorted_blocks[0] if sorted_blocks else None)
        entry_addr = hex(entry_block.start_address) if entry_block else "0x0"

        back_edge_count = len([e for e in cfg.edges if getattr(e, 'is_back_edge', False)])

        return {
            "function_name": resolved,
            "address": entry_addr,
            "block_count": len(cfg.nodes),
            "edge_count": len(cfg.edges),
            "cyclomatic_complexity": cfg.cyclomatic_complexity,
            "loop_count": fp.loop_count if fp else back_edge_count,
            "back_edge_count": back_edge_count,
            "strings": fp.string_references if fp else [],
            "constants": [hex(c) for c in (fp.constants if fp else [])],
            "heuristic_category": ident.semantic_category.value if ident else "UNKNOWN",
            "callers": callers,
            "callees": callees,
            "observed_arg_registers": sorted(list(observed_arg_regs)),
            "estimated_arg_count": estimated_arg_count,
            "returns_value": returns_value,
            "blocks": blocks_repr,
        }

    def format_llm_prompt(self, func_name: str) -> str:
        """
        Formats an inspection report into a structured markdown prompt for LLM reverse engineering.
        """
        data = self.inspect_function(func_name)

        callees_text = "None"
        if data["callees"]:
            lines = []
            for c in data["callees"]:
                pred = f" (predicted: {c['predicted_identity']})" if c['predicted_identity'] else ""
                lines.append(f"- {c['function_name']}{pred} via {c['call_type']}")
            callees_text = "\n".join(lines)

        callers_text = ", ".join(data["callers"]) if data["callers"] else "None"
        strings_text = ", ".join([f'"{s}"' for s in data["strings"]]) if data["strings"] else "None"
        constants_text = ", ".join(data["constants"]) if data["constants"] else "None"

        blocks_text = []
        for b in data["blocks"]:
            inst_list = "\n  ".join(b["instructions"])
            succs = ", ".join(b["successors"]) if b["successors"] else "EXIT"
            blocks_text.append(f"Block {b['block_id']} ({b['address_range']}) -> [{succs}]:\n  {inst_list}")
        blocks_formatted = "\n\n".join(blocks_text)

        return f"""### Target Function Disassembly & CFG Analysis
- Function: `{data['function_name']}`
- Address: {data['address']}
- Basic Blocks: {data['block_count']} | Flow Edges: {data['edge_count']}
- Cyclomatic Complexity: {data['cyclomatic_complexity']} | Loops: {data['loop_count']}
- String References: {strings_text}
- Magic Constants: {constants_text}
- Observed Argument Registers: {', '.join(data['observed_arg_registers']) or 'None'} (Estimated args: {data['estimated_arg_count']})
- Returns Value: {'Yes (%rax)' if data['returns_value'] else 'Likely void / undetermined'}
- Inbound Callers: {callers_text}
- Outbound Callees:
{callees_text}

### Basic Block Control Flow Graph:
{blocks_formatted}
"""
