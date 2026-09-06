from typing import List, Dict
from pydantic import BaseModel, Field
from app.ir.models import Function

class CallGraphEdge(BaseModel):
    caller: str
    callee: str
    address: int

class CallGraph(BaseModel):
    nodes: List[str]
    edges: List[CallGraphEdge] = Field(default_factory=list)

def build_call_graph(functions: List[Function]) -> CallGraph:
    """Extract direct function-to-function calls across all functions in binary project."""
    addr_to_func: Dict[int, str] = {f.start_address: f.name for f in functions}
    func_names = [f.name for f in functions]
    edges: List[CallGraphEdge] = []
    seen_edges = set()

    for func in functions:
        for inst in func.instructions:
            if inst.is_call:
                callee_name = inst.target_symbol
                if not callee_name and inst.target is not None:
                    callee_name = addr_to_func.get(inst.target, f"0x{inst.target:x}")
                if callee_name:
                    edge_key = (func.name, callee_name, inst.address)
                    if edge_key not in seen_edges:
                        seen_edges.add(edge_key)
                        edges.append(CallGraphEdge(
                            caller=func.name,
                            callee=callee_name,
                            address=inst.address
                        ))

    return CallGraph(nodes=func_names, edges=edges)
