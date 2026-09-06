from abc import ABC, abstractmethod
from app.ir.models import BinaryProject

class BaseDisassemblyParser(ABC):
    """Abstract base interface for disassembly parsers.
    
    Isolates architecture-specific and format-specific string parsing logic
    from downstream basic block construction, CFG engine, and static analysis.
    """

    @abstractmethod
    def parse_content(self, content: str, filename: str = "") -> BinaryProject:
        """Parse raw disassembly content string into a structured BinaryProject IR model."""
        pass

    @abstractmethod
    def parse_file(self, filepath: str) -> BinaryProject:
        """Parse a disassembly file from disk into a structured BinaryProject IR model."""
        pass
