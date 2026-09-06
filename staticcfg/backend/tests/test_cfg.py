import os
from app.parser.asm_parser import ASMParser
from app.cfg.builder import CFGBuilder
from app.ir.enums import EdgeType, InstructionType

def test_cfg_forward_branch_if_else():
    asm = """
Disassembly of section .text:

0000000000401000 <func_ifelse>:
  401000:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  401004:	74 05                	je     40100b <func_ifelse+0xb>
  401006:	b8 01 00 00 00       	mov    $0x1,%eax
  40100b:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_ifelse"]
    
    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    assert len(cfg.nodes) == 3
    # B0 (je), B1 (mov), B2 (ret)
    b0 = cfg.nodes[0]
    b1 = cfg.nodes[1]
    b2 = cfg.nodes[2]

    # Verify B0 edges: TRUE to B2, FALSE to B1
    b0_edges = [e for e in cfg.edges if e.source == b0.id]
    assert len(b0_edges) == 2
    true_edge = next(e for e in b0_edges if e.type == EdgeType.TRUE_BRANCH)
    false_edge = next(e for e in b0_edges if e.type == EdgeType.FALSE_BRANCH)
    assert true_edge.target == b2.id
    assert false_edge.target == b1.id

def test_cfg_backward_branch_loop():
    asm = """
Disassembly of section .text:

0000000000401000 <func_loop>:
  401000:	31 c0                	xor    %eax,%eax
  401002:	83 c0 01             	add    $0x1,%eax
  401005:	83 f8 0a             	cmp    $0xa,%eax
  401008:	75 f8                	jne    401002 <func_loop+0x2>
  40100a:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_loop"]

    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    # Leaders at 401000 (start), 401002 (target of jne), 40100a (after jne)
    assert len(cfg.nodes) == 3
    b1_loop_body = cfg.nodes[1]
    b2_exit = cfg.nodes[2]

    # jne in B1 has true edge back to B1 and false edge to B2
    b1_edges = [e for e in cfg.edges if e.source == b1_loop_body.id]
    back_edge = next(e for e in b1_edges if e.type == EdgeType.TRUE_BRANCH)
    fallthrough_edge = next(e for e in b1_edges if e.type == EdgeType.FALSE_BRANCH)

    assert back_edge.target == b1_loop_body.id
    assert fallthrough_edge.target == b2_exit.id

def test_cfg_unconditional_jump_no_fallthrough():
    asm = """
Disassembly of section .text:

0000000000401000 <func_uncond>:
  401000:	b8 01 00 00 00       	mov    $0x1,%eax
  401005:	eb 05                	jmp    40100c <func_uncond+0xc>
  401007:	b8 02 00 00 00       	mov    $0x2,%eax
  40100c:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_uncond"]

    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    b0 = cfg.nodes[0]
    b1 = cfg.nodes[1] # 401007 (unreachable)
    b2 = cfg.nodes[2] # 40100c

    b0_edges = [e for e in cfg.edges if e.source == b0.id]
    assert len(b0_edges) == 1
    assert b0_edges[0].type == EdgeType.UNCOND_JUMP
    assert b0_edges[0].target == b2.id
    # Ensure NO fallthrough edge to B1 from B0
    assert not any(e.source == b0.id and e.target == b1.id for e in cfg.edges)
    # Ensure B1 is marked unreachable
    assert b1.id in cfg.unreachable_blocks

def test_cfg_call_does_not_terminate_flow():
    asm = """
Disassembly of section .text:

0000000000401000 <func_call>:
  401000:	e8 10 00 00 00       	call   401015 <other_func>
  401005:	b8 00 00 00 00       	mov    $0x0,%eax
  40100a:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_call"]

    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    # Call does not split block or terminate flow
    assert len(cfg.nodes) == 1
    assert cfg.nodes[0].instructions[0].mnemonic == "call"
    assert cfg.nodes[0].instructions[1].mnemonic == "mov"
    assert cfg.edges[0].type == EdgeType.RETURN

def test_cfg_indirect_jump_unknown_node():
    asm = """
Disassembly of section .text:

0000000000401000 <func_indirect>:
  401000:	ff 20                	jmp    *(%rax)
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_indirect"]

    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    assert len(cfg.nodes) == 1
    assert len(cfg.edges) == 1
    assert cfg.edges[0].type == EdgeType.INDIRECT
    assert cfg.edges[0].target == "UNKNOWN"

def test_cfg_multiple_returns():
    asm = """
Disassembly of section .text:

0000000000401000 <func_multiret>:
  401000:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  401004:	74 03                	je     401009 <func_multiret+0x9>
  401006:	c3                   	ret    
  401009:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_multiret"]

    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    ret_edges = [e for e in cfg.edges if e.type == EdgeType.RETURN]
    assert len(ret_edges) == 2
    assert all(e.target == "EXIT" for e in ret_edges)
    assert len(cfg.exit_block_ids) == 2

def test_cfg_validator_asm_fixture(validator_asm_path):
    if os.path.exists(validator_asm_path):
        parser = ASMParser()
        project = parser.parse_file(validator_asm_path)
        builder = CFGBuilder()

        for func in list(project.functions.values())[:20]:
            cfg = builder.build_cfg(func)
            assert cfg.function_name == func.name
            assert len(cfg.nodes) > 0
            assert cfg.cyclomatic_complexity >= 1
            # Verify no self-referential unhandled edges or corrupted block IDs
            node_ids = {n.id for n in cfg.nodes}
            for edge in cfg.edges:
                assert edge.source in node_ids
                assert edge.target in node_ids or edge.target in ("EXIT", "UNKNOWN")
