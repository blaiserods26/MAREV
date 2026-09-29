from typing import List, Dict
from pydantic import BaseModel, Field
from app.ir.models import CFG
from app.models.schemas import FunctionSummary
from app.analysis.callgraph import CallGraph
from app.analysis.fingerprint import FunctionFingerprint
from app.function_id.models import IdentificationResult

class CachedAnalysis(BaseModel):
    """Complete analyzed project result containing CFGs, fingerprints, callgraph, and identifications."""
    file: str
    file_hash: str
    architecture: str = "x86-64"
    sections: List[str] = Field(default_factory=list)
    function_count: int
    functions: List[FunctionSummary] = Field(default_factory=list)
    cfgs: Dict[str, CFG] = Field(default_factory=dict)
    fingerprints: Dict[str, FunctionFingerprint] = Field(default_factory=dict)
    identifications: Dict[str, IdentificationResult] = Field(default_factory=dict)
    callgraph: CallGraph

AnalysisResult = CachedAnalysis
