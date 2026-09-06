import os
from app.parser.asm_parser import ASMParser
from app.cfg.builder import CFGBuilder
from app.analysis.dominators import compute_dominators
from app.analysis.loops import analyze_loops, detect_back_edges, compute_natural_loops, compute_scc
from app.analysis.references import extract_references
from app.analysis.fingerprint import generate_fingerprint, compute_cfg_hash
from app.analysis.callgraph import build_call_graph

def test_dominator_analysis():
    asm = """
Disassembly of section .text:

0000000000401000 <func_branch>:
  401000:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  401004:	74 05                	je     40100b <func_branch+0xb>
  401006:	b8 01 00 00 00       	mov    $0x1,%eax
  40100b:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_branch"]

    builder = CFGBuilder()
    cfg = builder.build_cfg(func)

    dom_info = compute_dominators(cfg)
    assert dom_info.entry_block_id == "B0"
    # Entry B0 dominates all blocks B0, B1, B2
    assert "B0" in dom_info.dominators["B1"]
    assert "B0" in dom_info.dominators["B2"]
    # idom of B1 is B0, idom of B2 is B0
    assert dom_info.immediate_dominators["B1"] == "B0"
    assert dom_info.immediate_dominators["B2"] == "B0"

def test_loop_and_back_edge_detection():
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

    loop_res = analyze_loops(cfg)
    assert len(loop_res.back_edges) == 1
    assert loop_res.back_edges[0].source == "B1"
    assert loop_res.back_edges[0].target == "B1"

    assert len(loop_res.loops) == 1
    assert loop_res.loops[0].header == "B1"
    assert "B1" in loop_res.loops[0].blocks

def test_reference_extraction():
    asm = """
Disassembly of section .text:

0000000000401000 <func_refs>:
  401000:	48 8d 3d 00 10 00 00 	lea    0x1000(%rip),%rdi # "Hello World"
  401007:	b8 40 00 00 00       	mov    $0x40,%eax
  40100c:	e8 10 00 00 00       	call   401021 <puts@plt>
  401011:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_refs"]

    refs = extract_references(func)
    assert "puts@plt" in refs.called_functions
    assert "puts@plt" in refs.imported_apis
    assert 64 in refs.constants # $0x40 = 64
    assert len(refs.strings) > 0 or len(refs.addresses) > 0

def test_function_fingerprint_generation():
    asm = """
Disassembly of section .text:

0000000000401000 <func_fp>:
  401000:	55                   	push   %rbp
  401001:	48 89 e5             	mov    %rsp,%rbp
  401004:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  401008:	74 05                	je     40100f <func_fp+0xf>
  40100a:	e8 10 00 00 00       	call   40101f <puts@plt>
  40100f:	5d                   	pop    %rbp
  401010:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    func = project.functions["func_fp"]

    fp = generate_fingerprint(func)
    assert fp.function_name == "func_fp"
    assert fp.instruction_count == 7
    assert fp.basic_block_count >= 3
    assert fp.branch_count >= 1
    assert fp.call_count == 1
    assert fp.return_count == 1
    assert "puts@plt" in fp.imported_apis
    assert len(fp.cfg_hash) == 16
    assert fp.instruction_category_frequencies["STACK"] >= 2 # push, pop
    assert fp.instruction_category_frequencies["CONTROL_FLOW"] >= 3 # je, call, ret

def test_caller_callee_relationships():
    asm = """
Disassembly of section .text:

0000000000401000 <caller_func>:
  401000:	e8 10 00 00 00       	call   401015 <callee_func>
  401005:	c3                   	ret    

0000000000401015 <callee_func>:
  401015:	c3                   	ret    
"""
    parser = ASMParser()
    project = parser.parse_content(asm)
    funcs = list(project.functions.values())

    cg = build_call_graph(funcs)
    assert len(cg.edges) == 1
    assert cg.edges[0].caller == "caller_func"
    assert cg.edges[0].callee == "callee_func"

    caller_rel = cg.relationships["caller_func"]
    callee_rel = cg.relationships["callee_func"]

    assert len(caller_rel.callees) == 1
    assert caller_rel.callees[0].function_name == "callee_func"
    assert len(callee_rel.callers) == 1
    assert callee_rel.callers[0].function_name == "caller_func"
