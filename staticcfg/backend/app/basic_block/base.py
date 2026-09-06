from abc import ABC, abstractmethod
from typing import List
from app.ir.models import Function, BasicBlock

class BaseBasicBlockEngine(ABC):
    """Abstract interface for partitioning instructions into basic blocks."""

    @abstractmethod
    def partition(self, function: Function) -> List[BasicBlock]:
        """Partition function instructions into a list of BasicBlock instances."""
        pass
