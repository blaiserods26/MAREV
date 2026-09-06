from typing import List, Set
from collections import deque
from app.ir.models import BasicBlock, CFGEdge

def find_unreachable_blocks(entry_id: str, nodes: List[BasicBlock], edges: List[CFGEdge]) -> List[str]:
    """Perform BFS/DFS traversal from entry block to identify unreachable basic block IDs."""
    if not nodes:
        return []

    node_ids = {node.id for node in nodes}
    if entry_id not in node_ids:
        return list(node_ids)

    adj: dict[str, List[str]] = {nid: [] for nid in node_ids}
    for edge in edges:
        if edge.source in adj:
            adj[edge.source].append(edge.target)

    visited: Set[str] = set()
    queue = deque([entry_id])
    visited.add(entry_id)

    while queue:
        curr = queue.popleft()
        for neighbor in adj.get(curr, []):
            if neighbor in node_ids and neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

    unreachable = [nid for nid in node_ids if nid not in visited]
    return sorted(unreachable)
