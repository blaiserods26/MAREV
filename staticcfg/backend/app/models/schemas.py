from pydantic import BaseModel, Field
from typing import List, Optional

class Instruction(BaseModel):
    address: int
    raw_bytes: List[str] = Field(default_factory=list)
    mnemonic: str
    operands: str = ""
    target: Optional[int] = None
    section: Optional[str] = None
    function: Optional[str] = None
    line_number: int
    comment: Optional[str] = None
    is_indirect: bool = False

class Function(BaseModel):
    name: str
    start_address: int
    end_address: Optional[int] = None
    section: Optional[str] = None
    instructions: List[Instruction] = Field(default_factory=list)

    @property
    def instruction_count(self) -> int:
        return len(self.instructions)

class FunctionSummary(BaseModel):
    name: str
    address: str  # formatted hex e.g. "0x400294"
    start_address: int
    end_address: Optional[int] = None
    instruction_count: int
    section: Optional[str] = None

class BasicBlock(BaseModel):
    id: str
    start_address: int
    end_address: int
    instructions: List[Instruction] = Field(default_factory=list)

class CFGEdge(BaseModel):
    source: str
    target: str
    type: str  # fallthrough, true, false, jump, call, return, indirect, unknown

class CFG(BaseModel):
    function: str
    entry: str
    nodes: List[BasicBlock]
    edges: List[CFGEdge]
    cyclomatic_complexity: int = 1
    unreachable_blocks: List[str] = Field(default_factory=list)

class CallGraphEdge(BaseModel):
    caller: str
    callee: str
    address: int

class CallGraph(BaseModel):
    nodes: List[str]
    edges: List[CallGraphEdge]

class AnalysisResponse(BaseModel):
    file: str
    architecture: str = "x86-64"
    sections: List[str] = Field(default_factory=list)
    function_count: int
