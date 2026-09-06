import hashlib
from typing import Dict, List, Set, Optional
from pydantic import BaseModel, Field
from app.ir.models import Function, CFG
from app.ir.enums import InstructionType
from app.cfg.builder import CFGBuilder
from app.analysis.references import extract_references
from app.analysis.loops import analyze_loops

CATEGORY_MAP = {
    # Control flow
    "je": "CONTROL_FLOW", "jne": "CONTROL_FLOW", "jl": "CONTROL_FLOW", "jle": "CONTROL_FLOW",
    "jg": "CONTROL_FLOW", "jge": "CONTROL_FLOW", "ja": "CONTROL_FLOW", "jae": "CONTROL_FLOW",
    "jb": "CONTROL_FLOW", "jbe": "CONTROL_FLOW", "js": "CONTROL_FLOW", "jns": "CONTROL_FLOW",
    "jz": "CONTROL_FLOW", "jnz": "CONTROL_FLOW", "jo": "CONTROL_FLOW", "jno": "CONTROL_FLOW",
    "jp": "CONTROL_FLOW", "jnp": "CONTROL_FLOW", "jmp": "CONTROL_FLOW", "jmpq": "CONTROL_FLOW",
    "call": "CONTROL_FLOW", "callq": "CONTROL_FLOW", "ret": "CONTROL_FLOW", "retq": "CONTROL_FLOW",
    "loop": "CONTROL_FLOW", "loope": "CONTROL_FLOW", "loopne": "CONTROL_FLOW",

    # Stack
    "push": "STACK", "pop": "STACK", "enter": "STACK", "leave": "STACK",

    # Data Transfer
    "mov": "DATA_TRANSFER", "movl": "DATA_TRANSFER", "movq": "DATA_TRANSFER",
    "movzbq": "DATA_TRANSFER", "movsbl": "DATA_TRANSFER", "movzwl": "DATA_TRANSFER",
    "lea": "DATA_TRANSFER", "leaq": "DATA_TRANSFER", "xchg": "DATA_TRANSFER",
    "cmov": "DATA_TRANSFER", "cmove": "DATA_TRANSFER", "cmovne": "DATA_TRANSFER",

    # Arithmetic
    "add": "ARITHMETIC", "sub": "ARITHMETIC", "imul": "ARITHMETIC", "idiv": "ARITHMETIC",
    "mul": "ARITHMETIC", "div": "ARITHMETIC", "inc": "ARITHMETIC", "dec": "ARITHMETIC",
    "neg": "ARITHMETIC", "shl": "ARITHMETIC", "shr": "ARITHMETIC", "sar": "ARITHMETIC",

    # Logic
    "and": "LOGIC", "or": "LOGIC", "xor": "LOGIC", "not": "LOGIC",

    # Comparison
    "cmp": "COMPARISON", "cmpl": "COMPARISON", "cmpq": "COMPARISON",
    "test": "COMPARISON", "testl": "COMPARISON", "testq": "COMPARISON",

    # System & Special
    "syscall": "SYSTEM", "sysenter": "SYSTEM", "hlt": "SYSTEM", "ud2": "SYSTEM",
    "cpuid": "SYSTEM", "endbr64": "SYSTEM",

    # Nop
    "nop": "NOP", "nopl": "NOP", "nopw": "NOP"
}

class FunctionFingerprint(BaseModel):
    """Deterministic structural and semantic fingerprint for a recovered function."""
    function_name: str
    start_address: int
    instruction_count: int
    basic_block_count: int
    edge_count: int
    branch_count: int
    call_count: int
    return_count: int
    loop_count: int
    cyclomatic_complexity: int
    called_functions: List[str] = Field(default_factory=list)
    imported_apis: List[str] = Field(default_factory=list)
    string_references: List[str] = Field(default_factory=list)
    constants: List[int] = Field(default_factory=list)
    instruction_category_frequencies: Dict[str, int] = Field(default_factory=dict)
    cfg_hash: str
    feature_vector: Dict[str, float] = Field(default_factory=dict)

def compute_cfg_hash(cfg: CFG) -> str:
    """Compute a deterministic canonical hash representation of CFG graph topology."""
    if not cfg.nodes:
        return hashlib.sha256(b"empty").hexdigest()[:16]

    # Canonical edge list format: "source->target:type"
    canonical_edges = sorted([f"{e.source}->{e.target}:{e.type}" for e in cfg.edges])
    nodes_representation = [f"{b.id}:{len(b.instructions)}" for b in cfg.nodes]
    
    raw = f"{cfg.function}|{','.join(nodes_representation)}|{','.join(canonical_edges)}"
    return hashlib.sha256(raw.encode("utf-8")).hexdigest()[:16]

def generate_fingerprint(function: Function, cfg: Optional[CFG] = None) -> FunctionFingerprint:
    """Generate structural and semantic FunctionFingerprint for a recovered function."""
    if not cfg:
        builder = CFGBuilder()
        cfg = builder.build_cfg(function)

    refs = extract_references(function)
    loop_res = analyze_loops(cfg)

    # Calculate category frequencies
    category_counts: Dict[str, int] = {
        "CONTROL_FLOW": 0, "DATA_TRANSFER": 0, "ARITHMETIC": 0,
        "LOGIC": 0, "COMPARISON": 0, "STACK": 0, "SYSTEM": 0, "NOP": 0, "OTHER": 0
    }

    branch_count = 0
    call_count = 0
    return_count = 0

    for inst in function.instructions:
        mn = inst.mnemonic.lower()
        cat = CATEGORY_MAP.get(mn, "OTHER")
        category_counts[cat] = category_counts.get(cat, 0) + 1

        if inst.is_branch:
            branch_count += 1
        if inst.is_call:
            call_count += 1
        if inst.is_return:
            return_count += 1

    cfg_h = compute_cfg_hash(cfg)

    # Compute normalized feature vector
    total_insts = max(1, len(function.instructions))
    feature_vector = {
        "norm_blocks": float(len(cfg.nodes)),
        "norm_edges": float(len(cfg.edges)),
        "norm_complexity": float(cfg.cyclomatic_complexity),
        "norm_loops": float(len(loop_res.loops)),
        "ratio_control_flow": category_counts["CONTROL_FLOW"] / total_insts,
        "ratio_data_transfer": category_counts["DATA_TRANSFER"] / total_insts,
        "ratio_arithmetic": category_counts["ARITHMETIC"] / total_insts,
        "ratio_comparison": category_counts["COMPARISON"] / total_insts,
    }

    return FunctionFingerprint(
        function_name=function.name,
        start_address=function.start_address,
        instruction_count=len(function.instructions),
        basic_block_count=len(cfg.nodes),
        edge_count=len(cfg.edges),
        branch_count=branch_count,
        call_count=call_count,
        return_count=return_count,
        loop_count=len(loop_res.loops),
        cyclomatic_complexity=cfg.cyclomatic_complexity,
        called_functions=refs.called_functions,
        imported_apis=refs.imported_apis,
        string_references=refs.strings,
        constants=refs.constants,
        instruction_category_frequencies=category_counts,
        cfg_hash=cfg_h,
        feature_vector=feature_vector
    )
