from typing import List, Dict, Set
from pydantic import BaseModel, Field
from app.ir.models import Function

class CallSite(BaseModel):
    function_name: str
    address: int

class CallGraphEdge(BaseModel):
    caller: str
    callee: str
    address: int

class FunctionCallInfo(BaseModel):
    function_name: str
    callers: List[CallSite] = Field(default_factory=list)
    callees: List[CallSite] = Field(default_factory=list)

class CallGraph(BaseModel):
    nodes: List[str]
    edges: List[CallGraphEdge] = Field(default_factory=list)
    relationships: Dict[str, FunctionCallInfo] = Field(default_factory=dict)

def build_call_graph(functions: List[Function]) -> CallGraph:
    """Extract direct function calls and compute caller/callee relationships."""
    addr_to_func: Dict[int, str] = {f.start_address: f.name for f in functions}
    func_names = [f.name for f in functions]
    edges: List[CallGraphEdge] = []
    seen_edges = set()

    relationships: Dict[str, FunctionCallInfo] = {
        f.name: FunctionCallInfo(function_name=f.name) for f in functions
    }

    for func in functions:
        caller_info = relationships[func.name]
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

                    # Update callees of caller
                    caller_info.callees.append(CallSite(function_name=callee_name, address=inst.address))

                    # Update callers of callee if inside known functions
                    if callee_name in relationships:
                        relationships[callee_name].callers.append(CallSite(function_name=func.name, address=inst.address))

    return CallGraph(nodes=func_names, edges=edges, relationships=relationships)
