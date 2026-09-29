from typing import List, Optional
from pydantic import BaseModel, Field
from app.ir.models import (
    Instruction,
    Function,
    BasicBlock,
    CFG,
    CFGEdge,
)

class FunctionSummary(BaseModel):
    name: str
    address: str  # formatted hex e.g. "0x400294"
    start_address: int
    end_address: Optional[int] = None
    instruction_count: int
    section: Optional[str] = None
    predicted_name: Optional[str] = None
    confidence: Optional[float] = None
    semantic_category: Optional[str] = None

class AnalysisResponse(BaseModel):
    file: str
    architecture: str = "x86-64"
    sections: List[str] = Field(default_factory=list)
    function_count: int

__all__ = [
    "FunctionSummary",
    "AnalysisResponse",
    "Instruction",
    "Function",
    "BasicBlock",
    "CFG",
    "CFGEdge",
]
