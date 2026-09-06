from typing import List
from app.ir.models import Section, Function, Instruction

class SectionBuilder:
    def __init__(self, name: str):
        self.name: str = name
        self.instructions: List[Instruction] = []

    def add_instruction(self, inst: Instruction) -> None:
        self.instructions.append(inst)

    def build(self) -> Section:
        start_addr = self.instructions[0].address if self.instructions else 0
        end_addr = self.instructions[-1].address if self.instructions else 0
        size_bytes = (end_addr - start_addr + 1) if end_addr >= start_addr else 0
        return Section(
            name=self.name,
            start_address=start_addr,
            end_address=end_addr,
            size_bytes=size_bytes,
            instructions=self.instructions
        )
