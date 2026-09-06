from abc import ABC, abstractmethod
from typing import List, Optional, Dict
from pydantic import BaseModel, Field
from app.ir.models import Function, BinaryProject

class FunctionSignature(BaseModel):
    """Function feature signature representation for identity prediction/matching."""
    function_name: str
    instruction_count: int
    basic_block_count: int
    cyclomatic_complexity: int
    mnemonic_histogram: Dict[str, int] = Field(default_factory=dict)
    call_out_symbols: List[str] = Field(default_factory=list)
    hash_signature: Optional[str] = None

class MatchResult(BaseModel):
    """Result of function identity matching strategy."""
    function_name: str
    predicted_identity: Optional[str] = None
    confidence: float = 0.0
    strategy: str = "none"
    matched_features: List[str] = Field(default_factory=list)

class BaseFunctionMatcher(ABC):
    """Abstract interface for function identity prediction and library function matching.

    To be extended in future development phases with opcode n-gram, CFG isomorphism,
    and ML fingerprinting strategies. No fake/placeholder results are returned.
    """

    @abstractmethod
    def compute_signature(self, function: Function) -> FunctionSignature:
        """Compute structural feature signature for a function."""
        pass

    @abstractmethod
    def predict_identity(self, function: Function, project: BinaryProject) -> MatchResult:
        """Match function against known signatures or library patterns."""
        pass
