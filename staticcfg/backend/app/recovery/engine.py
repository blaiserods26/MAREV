from typing import Dict, List, Optional, Set
from app.recovery.base import BaseFunctionRecovery
from app.ir.models import BinaryProject, Function, Instruction
from app.ir.enums import InstructionType

class FunctionRecoveryEngine(BaseFunctionRecovery):
    """Function recovery engine supporting function boundary refinement,
    symbol recovery, and entry point detection from symbol-less instruction streams.
    """

    @staticmethod
    def is_prologue(inst: Instruction) -> bool:
        """Check if instruction is a standard x86-64 function prologue pattern."""
        mn = inst.mnemonic.lower()
        op = inst.operands.lower()
        if mn == "endbr64":
            return True
        if mn == "push" and any(r in op for r in ("rbp", "ebp", "%rbp", "%ebp")):
            return True
        return False

    @staticmethod
    def is_epilogue(inst: Instruction) -> bool:
        """Check if instruction is a standard x86-64 function epilogue pattern."""
        mn = inst.mnemonic.lower()
        op = inst.operands.lower()
        if mn in ("ret", "retq", "retn"):
            return True
        if mn == "pop" and any(r in op for r in ("rbp", "ebp", "%rbp", "%ebp")):
            return True
        return False

    @staticmethod
    def is_terminator(inst: Instruction) -> bool:
        """Check if instruction unconditionally terminates sequential control flow."""
        mn = inst.mnemonic.lower()
        if mn in ("ret", "retq", "retn", "hlt", "ud2"):
            return True
        if inst.instruction_type in (InstructionType.RET,):
            return True
        return False

    @staticmethod
    def is_nop(inst: Instruction) -> bool:
        """Check if instruction is alignment nop / padding."""
        mn = inst.mnemonic.lower()
        if mn in ("nop", "nopw", "nopl", "fnop", "data16", "cs") or "nop" in mn:
            return True
        if inst.instruction_type == InstructionType.NOP:
            return True
        return False

    def recover_from_instructions(self, instructions: List[Instruction]) -> Dict[str, Function]:
        """Partitions raw instruction stream into synthetic functions (sub_<hex>) using
        boundary heuristics (call targets, prologues, terminators, alignment nops).
        """
        if not instructions:
            return {}

        sorted_insts = sorted(instructions, key=lambda x: x.address)
        inst_by_addr = {inst.address: (idx, inst) for idx, inst in enumerate(sorted_insts)}

        entries: Set[int] = set()
        entries.add(sorted_insts[0].address)

        # 1. Harvest explicit call targets
        for inst in sorted_insts:
            mn = inst.mnemonic.lower()
            if (mn in ("call", "callq") or inst.instruction_type == InstructionType.CALL) and inst.target:
                if inst.target in inst_by_addr:
                    entries.add(inst.target)

        # 2. Sequential scanning for boundaries
        in_padding = False
        for i, inst in enumerate(sorted_insts):
            prev_inst = sorted_insts[i - 1] if i > 0 else None
            mn = inst.mnemonic.lower()

            if self.is_terminator(inst):
                in_padding = True
                continue

            if self.is_nop(inst):
                continue

            # First non-nop instruction after a terminator begins a new function
            if in_padding:
                entries.add(inst.address)
                in_padding = False
                continue

            # Explicit prologue detection (e.g. endbr64, or push rbp after return/nop)
            if mn == "endbr64":
                entries.add(inst.address)
            elif self.is_prologue(inst):
                if prev_inst is None or self.is_terminator(prev_inst) or self.is_nop(prev_inst):
                    entries.add(inst.address)

        sorted_entries = sorted(list(entries))
        recovered_functions: Dict[str, Function] = {}

        for e_idx, start_addr in enumerate(sorted_entries):
            next_start_addr = sorted_entries[e_idx + 1] if e_idx + 1 < len(sorted_entries) else None

            func_insts: List[Instruction] = []
            for inst in sorted_insts:
                if inst.address >= start_addr:
                    if next_start_addr is not None and inst.address >= next_start_addr:
                        break
                    func_insts.append(inst)

            # Strip trailing nop padding from function body
            while len(func_insts) > 1 and self.is_nop(func_insts[-1]):
                func_insts.pop()

            if not func_insts:
                continue

            func_name = f"sub_{start_addr:x}"
            for inst in func_insts:
                inst.function_name = func_name
                inst.function = func_name

            func = Function(
                name=func_name,
                start_address=start_addr,
                end_address=func_insts[-1].address,
                section_name=func_insts[0].section or ".text",
                instructions=func_insts,
                is_stripped=True,
            )
            recovered_functions[func_name] = func

        return recovered_functions

    def recover_functions(self, project: BinaryProject) -> Dict[str, Function]:
        """Refines existing functions or recovers synthetic functions if none exist."""
        if project.functions:
            functions = dict(project.functions)
            for name, func in functions.items():
                if not func.instructions:
                    continue
                func.end_address = func.instructions[-1].address
                if name.startswith("sub_") or name.startswith("func_"):
                    func.is_stripped = True
            return functions

        # Fallback: recover from all section instructions
        all_instructions: List[Instruction] = []
        for sec in project.sections:
            all_instructions.extend(sec.instructions)

        recovered = self.recover_from_instructions(all_instructions)
        project.functions = recovered
        return recovered
