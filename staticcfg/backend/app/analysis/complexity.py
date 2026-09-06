from typing import Union, List
from app.ir.models import BasicBlock, CFGEdge

def calculate_cyclomatic_complexity(nodes: Union[int, List[BasicBlock]], edges: Union[int, List[CFGEdge]]) -> int:
    """Calculate Cyclomatic Complexity metric M = E - N + 2P
    For a single function CFG (connected component P=1): M = E - N + 2
    """
    num_nodes = nodes if isinstance(nodes, int) else len(nodes)
    num_edges = edges if isinstance(edges, int) else len(edges)
    if num_nodes == 0:
        return 1
    
    complexity = num_edges - num_nodes + 2
    return max(1, complexity)
