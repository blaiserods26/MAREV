from typing import Dict, List, Optional
from app.recovery.base import BaseFunctionRecovery
from app.ir.models import BinaryProject, Function, Instruction
from app.ir.enums import InstructionType

class FunctionRecoveryEngine(BaseFunctionRecovery):
    """Function recovery engine supporting function boundary refinement,

    symbol recovery, and entry point detection.
    """

    def recover_functions(self, project: BinaryProject) -> Dict[str, Function]:
        """Refines functions in BinaryProject by verifying boundaries and instruction streams."""
        functions = dict(project.functions)
        for name, func in functions.items():
            if not func.instructions:
                continue
            # Calculate end address dynamically from instruction stream
            func.end_address = func.instructions[-1].address
            # Classify stripping state
            if name.startswith("sub_") or name.startswith("func_"):
                func.is_stripped = True
        return functions

    @staticmethod
    def is_prologue(inst: Instruction) -> bool:
        """Check if instruction is a standard x86-64 function prologue pattern."""
        mn = inst.mnemonic.lower()
        op = inst.operands.lower()
        if mn == "endbr64":
            return True
        if mn == "push" and ("rbp" in op or "ebp" in op):
            return True
        return False

    @staticmethod
    def is_epilogue(inst: Instruction) -> bool:
        """Check if instruction is a standard x86-64 function epilogue pattern."""
        mn = inst.mnemonic.lower()
        op = inst.operands.lower()
        if mn in ("ret", "retq"):
            return True
        if mn == "pop" and ("rbp" in op or "ebp" in op):
            return True
        return False
