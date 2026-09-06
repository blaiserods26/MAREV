import os
from app.parser.asm_parser import ASMParser
from app.parser.instruction import classify_instruction, extract_target_and_references
from app.ir.enums import InstructionType, ArchitectureType
from app.ir.models import BinaryProject

def test_instruction_classification_all_types():
    assert classify_instruction("je", "401020 <main+0x10>") == InstructionType.COND_BRANCH
    assert classify_instruction("jne", "401000") == InstructionType.COND_BRANCH
    assert classify_instruction("jmp", "401030") == InstructionType.UNCOND_BRANCH
    assert classify_instruction("jmpq", "401030") == InstructionType.UNCOND_BRANCH
    assert classify_instruction("jmp", "*%rax") == InstructionType.INDIRECT_JUMP
    assert classify_instruction("jmp", "*0x200a(%rip)") == InstructionType.INDIRECT_JUMP
    assert classify_instruction("call", "401000 <func>") == InstructionType.CALL
    assert classify_instruction("callq", "401000 <func>") == InstructionType.CALL
    assert classify_instruction("call", "*%rax") == InstructionType.INDIRECT_CALL
    assert classify_instruction("call", "*0x200a(%rip)") == InstructionType.INDIRECT_CALL
    assert classify_instruction("ret", "") == InstructionType.RET
    assert classify_instruction("retq", "") == InstructionType.RET
    assert classify_instruction("nop", "") == InstructionType.NOP
    assert classify_instruction("mov", "%rax, %rbx") == InstructionType.NORMAL

def test_extract_target_and_references():
    target_addr, target_sym, is_indirect, refs = extract_target_and_references(0x401000, "call", "401020 <my_func>")
    assert target_addr == 0x401020
    assert target_sym == "my_func"
    assert is_indirect is False
    assert len(refs) == 1
    assert refs[0].source_address == 0x401000

    target_addr_ind, target_sym_ind, is_indirect_ind, refs_ind = extract_target_and_references(0x401005, "jmp", "*%rax")
    assert target_addr_ind is None
    assert is_indirect_ind is True

def test_parse_architecture_and_sections():
    asm = """
test.o:     file format elf64-x86-64

Disassembly of section .text:

0000000000401000 <_start>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm, filename="test.o")

    assert project.architecture == ArchitectureType.X86_64
    assert project.format == "elf64-x86-64"
    assert len(project.sections) == 1
    assert project.sections[0].name == ".text"
    assert "_start" in project.functions
    assert project.functions["_start"].instructions[0].mnemonic == "endbr64"

def test_parse_validator_asm_fixture(validator_asm_path):
    if os.path.exists(validator_asm_path):
        parser = ASMParser()
        project = parser.parse_file(validator_asm_path)
        assert isinstance(project, BinaryProject)
        assert project.function_count > 100
        assert len(project.sections) > 0
