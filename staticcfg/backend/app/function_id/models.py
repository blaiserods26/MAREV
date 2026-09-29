from enum import Enum
from typing import List, Dict, Optional
from pydantic import BaseModel, Field

class SemanticCategory(str, Enum):
    STRING_PROCESSING = "STRING_PROCESSING"
    MEMORY_MANAGEMENT = "MEMORY_MANAGEMENT"
    FILE_IO = "FILE_IO"
    NETWORKING = "NETWORKING"
    CRYPTOGRAPHY = "CRYPTOGRAPHY"
    VALIDATION = "VALIDATION"
    PARSING = "PARSING"
    ERROR_HANDLING = "ERROR_HANDLING"
    DISPATCHING = "DISPATCHING"
    UTILITY = "UTILITY"
    UNKNOWN = "UNKNOWN"

class CandidatePrediction(BaseModel):
    """Candidate function name prediction with confidence and evidence."""
    predicted_name: str
    confidence: float = Field(..., ge=0.0, le=1.0)
    category: SemanticCategory = SemanticCategory.UNKNOWN
    evidence: List[str] = Field(default_factory=list)

    @property
    def confidence_percentage(self) -> int:
        return int(round(self.confidence * 100))

class ParameterSignature(BaseModel):
    """Deduced parameter in a recovered function signature."""
    name: str
    type_name: str
    register_or_location: Optional[str] = None  # e.g. "%rdi", "%rsi", "stack+8"
    description: Optional[str] = None

class RecoveredSignature(BaseModel):
    """Deduced C-style function signature, parameter bindings, and semantic explanation."""
    name: str
    return_type: str
    parameters: List[ParameterSignature] = Field(default_factory=list)
    calling_convention: str = "System V AMD64"
    c_prototype: str
    summary: str
    confidence: float = Field(..., ge=0.0, le=1.0)
    reasoning: List[str] = Field(default_factory=list)
    nested_callees_analyzed: List[str] = Field(default_factory=list)

class IdentificationResult(BaseModel):
    """Multi-stage identification result for a recovered function."""
    recovered_name: str
    address: int
    formatted_address: str
    semantic_category: SemanticCategory = SemanticCategory.UNKNOWN
    is_exact_library_match: bool = False
    top_prediction: Optional[CandidatePrediction] = None
    alternative_candidates: List[CandidatePrediction] = Field(default_factory=list)
    evidence_summary: List[str] = Field(default_factory=list)
    recovered_signature: Optional[RecoveredSignature] = None

