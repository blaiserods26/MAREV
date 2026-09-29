from typing import List, Dict, Set, Optional
import networkx as nx
from pydantic import BaseModel, Field
from app.ir.models import BasicBlock, CFGEdge, CFG

class DominatorTreeInfo(BaseModel):
    """Dominator Tree Analysis results for a Function CFG."""
    entry_block_id: str
    dominators: Dict[str, List[str]] = Field(default_factory=dict)
    immediate_dominators: Dict[str, Optional[str]] = Field(default_factory=dict)
    dominance_frontiers: Dict[str, List[str]] = Field(default_factory=dict)

def compute_dominators(cfg: CFG) -> DominatorTreeInfo:
    """Compute Dominators, Immediate Dominators (idom), and Dominance Frontiers (df)

    for a Control Flow Graph using memory-efficient NetworkX / Lengauer-Tarjan.
    """
    if not cfg.nodes:
        return DominatorTreeInfo(entry_block_id="")

    nodes = cfg.nodes
    node_ids = [n.id for n in nodes]
    entry_id = cfg.entry if cfg.entry in node_ids else node_ids[0]

    # Build NetworkX Directed Graph
    G = nx.DiGraph()
    for nid in node_ids:
        G.add_node(nid)

    preds: Dict[str, List[str]] = {nid: [] for nid in node_ids}
    for edge in cfg.edges:
        if edge.source in preds and edge.target in preds:
            G.add_edge(edge.source, edge.target)
            preds[edge.target].append(edge.source)

    # 1. Compute Immediate Dominators (idom) via Lengauer-Tarjan (O(V) memory)
    try:
        raw_idom = nx.immediate_dominators(G, entry_id)
        idom: Dict[str, Optional[str]] = {
            nid: raw_idom.get(nid) if raw_idom.get(nid) != nid else None for nid in node_ids
        }
    except Exception:
        idom = {nid: None for nid in node_ids}

    # 2. Compute Dominator sets for each node by traversing idom chain (O(V) memory)
    dom: Dict[str, List[str]] = {}
    for nid in node_ids:
        curr: Optional[str] = nid
        visited = set()
        dom_list = []
        while curr is not None and curr not in visited:
            visited.add(curr)
            dom_list.append(curr)
            if curr == entry_id:
                break
            curr = idom.get(curr)
        dom[nid] = sorted(dom_list)

    # 3. Compute Dominance Frontiers (df)
    df: Dict[str, Set[str]] = {nid: set() for nid in node_ids}
    for y in node_ids:
        p_list = preds[y]
        if len(p_list) >= 2:
            for p in p_list:
                runner: Optional[str] = p
                while runner is not None and runner != idom.get(y):
                    df[runner].add(y)
                    runner = idom.get(runner)

    return DominatorTreeInfo(
        entry_block_id=entry_id,
        dominators=dom,
        immediate_dominators=idom,
        dominance_frontiers={k: sorted(list(v)) for k, v in df.items()}
    )
