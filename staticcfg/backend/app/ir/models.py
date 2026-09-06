from typing import List, Dict, Optional
from pydantic import BaseModel, Field, model_validator
from app.ir.enums import ArchitectureType, InstructionType, EdgeType, RefType

class Reference(BaseModel):
    """Cross-reference model representing code/data references."""
    source_address: int
    target_address: Optional[int] = None
    target_symbol: Optional[str] = None
    ref_type: RefType
    description: Optional[str] = None

class Instruction(BaseModel):
    """Unified Intermediate Representation for an assembly instruction."""
    address: int
    raw_bytes: List[str] = Field(default_factory=list)
    mnemonic: str
    operands: str = ""
    target: Optional[int] = None
    target_symbol: Optional[str] = None
    instruction_type: InstructionType = InstructionType.NORMAL
    section: Optional[str] = None
    function_name: Optional[str] = None
    function: Optional[str] = None
    line_number: int = 0
    comment: Optional[str] = None
    is_indirect: bool = False
    references: List[Reference] = Field(default_factory=list)

    @model_validator(mode="after")
    def sync_function_names(self):
        if self.function and not self.function_name:
            self.function_name = self.function
        elif self.function_name and not self.function:
            self.function = self.function_name
        return self

    @property
    def formatted_address(self) -> str:
        return f"0x{self.address:x}"

    @property
    def is_branch(self) -> bool:
        return self.instruction_type in (
            InstructionType.COND_BRANCH,
            InstructionType.UNCOND_BRANCH,
            InstructionType.INDIRECT_JUMP
        )

    @property
    def is_conditional(self) -> bool:
        return self.instruction_type == InstructionType.COND_BRANCH

    @property
    def is_unconditional(self) -> bool:
        return self.instruction_type == InstructionType.UNCOND_BRANCH

    @property
    def is_indirect_jump(self) -> bool:
        return self.instruction_type == InstructionType.INDIRECT_JUMP

    @property
    def is_call(self) -> bool:
        return self.instruction_type in (InstructionType.CALL, InstructionType.INDIRECT_CALL)

    @property
    def is_indirect_call(self) -> bool:
        return self.instruction_type == InstructionType.INDIRECT_CALL

    @property
    def is_return(self) -> bool:
        return self.instruction_type == InstructionType.RET

class Section(BaseModel):
    """Memory Section representation (.text, .rodata, .data, .bss, etc.)."""
    name: str
    start_address: int = 0
    end_address: int = 0
    size_bytes: int = 0
    flags: List[str] = Field(default_factory=list)
    instructions: List[Instruction] = Field(default_factory=list)

    @property
    def formatted_start(self) -> str:
        return f"0x{self.start_address:x}"

    @property
    def formatted_end(self) -> str:
        return f"0x{self.end_address:x}"

class BasicBlock(BaseModel):
    """Basic Block in a Control Flow Graph."""
    id: str
    start_address: int
    end_address: int
    instructions: List[Instruction] = Field(default_factory=list)
    predecessors: List[str] = Field(default_factory=list)
    successors: List[str] = Field(default_factory=list)
    terminator_type: Optional[InstructionType] = None

    @property
    def instruction_count(self) -> int:
        return len(self.instructions)

    @property
    def formatted_range(self) -> str:
        return f"0x{self.start_address:x} - 0x{self.end_address:x}"

class CFGEdge(BaseModel):
    """Control Flow Graph Edge."""
    source: str
    target: str
    type: EdgeType = EdgeType.FALLTHROUGH
    condition: Optional[str] = None

class CFG(BaseModel):
    """Control Flow Graph for a single function."""
    function: str = ""
    entry: str = ""
    function_name: Optional[str] = None
    entry_block_id: Optional[str] = None
    exit_block_ids: List[str] = Field(default_factory=list)
    nodes: List[BasicBlock] = Field(default_factory=list)
    edges: List[CFGEdge] = Field(default_factory=list)
    cyclomatic_complexity: int = 1
    unreachable_blocks: List[str] = Field(default_factory=list)

    @model_validator(mode="after")
    def sync_names(self):
        if self.function and not self.function_name:
            self.function_name = self.function
        elif self.function_name and not self.function:
            self.function = self.function_name
        if self.entry and not self.entry_block_id:
            self.entry_block_id = self.entry
        elif self.entry_block_id and not self.entry:
            self.entry = self.entry_block_id
        return self

class Function(BaseModel):
    """Recovered Function Representation."""
    name: str
    start_address: int
    end_address: Optional[int] = None
    section_name: Optional[str] = None
    instructions: List[Instruction] = Field(default_factory=list)
    basic_blocks: List[BasicBlock] = Field(default_factory=list)
    cfg: Optional[CFG] = None
    calling_convention: Optional[str] = None
    stack_frame_size: Optional[int] = None
    is_stripped: bool = False

    @property
    def instruction_count(self) -> int:
        return len(self.instructions)

    @property
    def formatted_address(self) -> str:
        return f"0x{self.start_address:x}"

class BinaryProject(BaseModel):
    """Top-level container for an analyzed disassembly project / binary file."""
    filename: str
    architecture: ArchitectureType = ArchitectureType.X86_64
    format: str = "objdump"
    sections: List[Section] = Field(default_factory=list)
    functions: Dict[str, Function] = Field(default_factory=dict)
    entry_point: Optional[int] = None
    global_references: List[Reference] = Field(default_factory=list)
    metadata: Dict[str, str] = Field(default_factory=dict)

    @property
    def function_count(self) -> int:
        return len(self.functions)

    def get_function(self, name: str) -> Optional[Function]:
        return self.functions.get(name)

    def get_function_by_address(self, address: int) -> Optional[Function]:
        for func in self.functions.values():
            if func.start_address == address:
                return func
            if func.end_address and func.start_address <= address <= func.end_address:
                return func
        return None
