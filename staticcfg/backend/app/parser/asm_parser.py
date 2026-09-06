import re
import os
from typing import List, Optional, Dict
from app.parser.base import BaseDisassemblyParser
from app.ir.enums import ArchitectureType
from app.ir.models import BinaryProject, Section, Function, Instruction, Reference
from app.parser.instruction import extract_target_and_references, classify_instruction
from app.parser.function import FunctionBuilder
from app.parser.section import SectionBuilder

SECTION_PATTERN = re.compile(r'^Disassembly of section\s+([^:]+):')
FUNCTION_PATTERN = re.compile(r'^([0-9a-fA-F]+)\s+<([^>]+)>:')
HEX_BYTE_PATTERN = re.compile(r'^[0-9a-fA-F]{2}$')
FORMAT_PATTERN = re.compile(r'file format\s+([^\s]+)')

class ASMParser(BaseDisassemblyParser):
    """x86-64 objdump disassembly file stream parser."""

    def parse_file(self, filepath: str) -> BinaryProject:
        filename = os.path.basename(filepath)
        with open(filepath, "r", encoding="utf-8", errors="replace") as f:
            content = f.read()
        return self.parse_content(content, filename=filename)

    def parse_content(self, content: str, filename: str = "uploaded.asm") -> BinaryProject:
        lines = content.splitlines()
        return self.parse_lines(lines, filename)

    @classmethod
    def parse_lines(cls, lines: List[str], filename: str = "uploaded.asm") -> BinaryProject:
        sections_map: Dict[str, SectionBuilder] = {}
        functions_map: Dict[str, Function] = {}
        global_references: List[Reference] = []
        
        current_section: Optional[str] = None
        current_builder: Optional[FunctionBuilder] = None
        detected_arch = ArchitectureType.X86_64
        detected_format = "objdump"
        
        for line_idx, line in enumerate(lines, start=1):
            stripped = line.strip()
            if not stripped:
                continue

            # Check format metadata: file format elf64-x86-64
            fmt_match = FORMAT_PATTERN.search(stripped)
            if fmt_match:
                detected_format = fmt_match.group(1)
                if "x86-64" in detected_format or "elf64" in detected_format:
                    detected_arch = ArchitectureType.X86_64
                elif "i386" in detected_format or "elf32" in detected_format:
                    detected_arch = ArchitectureType.X86
                continue

            # Check Section Header: Disassembly of section .text:
            sec_match = SECTION_PATTERN.match(stripped)
            if sec_match:
                if current_builder:
                    func = current_builder.build()
                    functions_map[func.name] = func
                    current_builder = None
                
                current_section = sec_match.group(1).strip()
                if current_section not in sections_map:
                    sections_map[current_section] = SectionBuilder(current_section)
                continue

            # Check Function Header: 0000000000400294 <_init>:
            func_match = FUNCTION_PATTERN.match(stripped)
            if func_match:
                if current_builder:
                    func = current_builder.build()
                    functions_map[func.name] = func
                    current_builder = None
                
                start_addr = int(func_match.group(1), 16)
                func_name = func_match.group(2).strip()
                current_builder = FunctionBuilder(name=func_name, start_address=start_addr, section=current_section)
                continue

            # Check Instruction Line:   400294:	f3 0f 1e fa          	endbr64
            if current_builder and ':' in line:
                parts = line.split(':', 1)
                addr_part = parts[0].strip()
                
                try:
                    address = int(addr_part, 16)
                except ValueError:
                    continue

                rest = parts[1]
                comment: Optional[str] = None
                if '#' in rest:
                    rest_code, rest_comment = rest.split('#', 1)
                    comment = rest_comment.strip()
                else:
                    rest_code = rest

                tokens = rest_code.strip().split()
                if not tokens:
                    continue

                raw_bytes: List[str] = []
                idx = 0
                while idx < len(tokens) and HEX_BYTE_PATTERN.match(tokens[idx]):
                    raw_bytes.append(tokens[idx])
                    idx += 1

                if idx >= len(tokens):
                    mnemonic = "nop"
                    operands = ""
                else:
                    mnemonic = tokens[idx]
                    idx += 1
                    operands = " ".join(tokens[idx:])

                inst_type = classify_instruction(mnemonic, operands)
                target_addr, target_symbol, is_indirect, refs = extract_target_and_references(address, mnemonic, operands)
                global_references.extend(refs)

                inst = Instruction(
                    address=address,
                    raw_bytes=raw_bytes,
                    mnemonic=mnemonic,
                    operands=operands,
                    target=target_addr,
                    target_symbol=target_symbol,
                    instruction_type=inst_type,
                    section=current_section,
                    function_name=current_builder.name,
                    function=current_builder.name,
                    line_number=line_idx,
                    comment=comment,
                    is_indirect=is_indirect,
                    references=refs
                )
                current_builder.add_instruction(inst)
                if current_section and current_section in sections_map:
                    sections_map[current_section].add_instruction(inst)

        # Flush last function
        if current_builder:
            func = current_builder.build()
            functions_map[func.name] = func

        built_sections: List[Section] = [sb.build() for sb in sections_map.values()]

        return BinaryProject(
            filename=filename,
            architecture=detected_arch,
            format=detected_format,
            sections=built_sections,
            functions=functions_map,
            global_references=global_references,
            metadata={"line_count": str(len(lines))}
        )
