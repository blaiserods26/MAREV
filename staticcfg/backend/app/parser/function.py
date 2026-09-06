from typing import List, Optional
from app.ir.models import Function, Instruction

class FunctionBuilder:
    def __init__(self, name: str, start_address: int, section: Optional[str] = None):
        self.name: str = name
        self.start_address: int = start_address
        self.section: Optional[str] = section
        self.instructions: List[Instruction] = []

    def add_instruction(self, inst: Instruction) -> None:
        inst.function_name = self.name
        inst.section = self.section
        self.instructions.append(inst)

    def build(self) -> Function:
        end_addr = self.instructions[-1].address if self.instructions else self.start_address
        return Function(
            name=self.name,
            start_address=self.start_address,
            end_address=end_addr,
            section_name=self.section,
            instructions=self.instructions
        )
