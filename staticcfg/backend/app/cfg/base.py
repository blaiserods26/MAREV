from abc import ABC, abstractmethod
from app.ir.models import Function, CFG

class BaseCFGBuilder(ABC):
    """Abstract interface for constructing a Control Flow Graph for a Function."""

    @abstractmethod
    def build_cfg(self, function: Function) -> CFG:
        """Construct a CFG from a Function and its BasicBlocks."""
        pass
