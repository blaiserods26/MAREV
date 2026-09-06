from app.ir.enums import ArchitectureType, InstructionType, EdgeType, RefType
from app.ir.models import (
    BinaryProject, Section, Function, Instruction,
    BasicBlock, CFG, CFGEdge, Reference
)

def test_instruction_ir_properties():
    inst = Instruction(
        address=0x401023,
        raw_bytes=["83", "7d", "fc", "00"],
        mnemonic="je",
        operands="40102e <main+0x13>",
        target=0x40102e,
        instruction_type=InstructionType.COND_BRANCH,
        line_number=10
    )
    assert inst.formatted_address == "0x401023"
    assert inst.is_branch is True
    assert inst.is_conditional is True
    assert inst.is_call is False
    assert inst.is_return is False

def test_basic_block_and_cfg_ir():
    inst1 = Instruction(address=0x40101b, mnemonic="push", operands="%rbp", line_number=1)
    inst2 = Instruction(address=0x40101c, mnemonic="ret", instruction_type=InstructionType.RET, line_number=2)
    
    block = BasicBlock(
        id="B0",
        start_address=0x40101b,
        end_address=0x40101c,
        instructions=[inst1, inst2],
        terminator_type=InstructionType.RET
    )
    assert block.instruction_count == 2
    assert block.formatted_range == "0x40101b - 0x40101c"

    edge = CFGEdge(source="B0", target="EXIT", type=EdgeType.RETURN)
    cfg = CFG(
        function_name="main",
        entry_block_id="B0",
        exit_block_ids=["B0"],
        nodes=[block],
        edges=[edge],
        cyclomatic_complexity=1
    )
    assert cfg.function_name == "main"
    assert len(cfg.nodes) == 1
    assert len(cfg.edges) == 1

def test_binary_project_ir():
    func = Function(name="main", start_address=0x401000, end_address=0x401020)
    sec = Section(name=".text", start_address=0x401000, end_address=0x401020, size_bytes=33)
    project = BinaryProject(
        filename="test.asm",
        architecture=ArchitectureType.X86_64,
        sections=[sec],
        functions={"main": func}
    )
    assert project.function_count == 1
    assert project.get_function("main") is not None
    assert project.get_function_by_address(0x401000) == func
