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

def test_symbol_less_function_recovery():
    """Test recovering functions from raw disassembly stream without any <symbol>: headers."""
    raw_asm = """
Disassembly of section .text:

  401000:	f3 0f 1e fa          	endbr64 
  401004:	31 ed                	xor    %ebp,%ebp
  401006:	e8 15 00 00 00       	call   401020
  40100b:	f4                   	hlt    
  40100c:	0f 1f 40 00          	nopl   0x0(%rax)

  401020:	55                   	push   %rbp
  401021:	48 89 e5             	mov    %rsp,%rbp
  401024:	89 f8                	mov    %edi,%eax
  401026:	5d                   	pop    %rbp
  401027:	c3                   	ret    
  401028:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)

  401030:	f3 0f 1e fa          	endbr64 
  401034:	b8 2a 00 00 00       	mov    $0x2a,%eax
  401039:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(raw_asm, filename="symbol_less.asm")

    assert len(project.functions) == 3
    assert "sub_401000" in project.functions
    assert "sub_401020" in project.functions
    assert "sub_401030" in project.functions

    f1 = project.functions["sub_401000"]
    assert f1.start_address == 0x401000
    assert f1.is_stripped is True
    assert any(i.mnemonic == "endbr64" for i in f1.instructions)
    assert any(i.mnemonic == "call" for i in f1.instructions)

    f2 = project.functions["sub_401020"]
    assert f2.start_address == 0x401020
    assert f2.is_stripped is True
    assert f2.instructions[0].mnemonic == "push"
    assert f2.instructions[-1].mnemonic == "ret"

    f3 = project.functions["sub_401030"]
    assert f3.start_address == 0x401030
    assert f3.is_stripped is True
    assert f3.instructions[0].mnemonic == "endbr64"

def test_symbol_less_pipeline_integration():
    """Verify that symbol-less recovered functions can be analyzed by AnalysisEngine into valid CFGs."""
    from app.analysis.engine import AnalysisEngine

    raw_asm = """
  401000:	55                   	push   %rbp
  401001:	48 89 e5             	mov    %rsp,%rbp
  401004:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  401008:	74 05                	je     40100f
  40100a:	b8 01 00 00 00       	mov    $0x1,%eax
  40100f:	5d                   	pop    %rbp
  401010:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(raw_asm, filename="no_symbols.asm")

    assert len(project.functions) == 1
    assert "sub_401000" in project.functions

    engine = AnalysisEngine()
    analysis = engine.analyze(project)

    assert "sub_401000" in analysis.cfgs
    cfg = analysis.cfgs["sub_401000"]
    assert len(cfg.nodes) >= 2
    assert cfg.cyclomatic_complexity >= 2

