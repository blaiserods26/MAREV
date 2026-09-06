from abc import ABC, abstractmethod
from typing import List, Dict, Optional
from app.ir.models import Function, Instruction, BinaryProject

class BaseFunctionRecovery(ABC):
    """Abstract interface for recovering functions from disassembly/binary instruction streams."""

    @abstractmethod
    def recover_functions(self, project: BinaryProject) -> Dict[str, Function]:
        """Recover or refine function boundaries, symbols, and entry points within a BinaryProject."""
        pass
