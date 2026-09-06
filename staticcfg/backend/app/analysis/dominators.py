from typing import List, Dict, Set, Optional
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

    for a Control Flow Graph using iterative fixed-point algorithm.
    """
    if not cfg.nodes:
        return DominatorTreeInfo(entry_block_id="")

    nodes = cfg.nodes
    node_ids = [n.id for n in nodes]
    entry_id = cfg.entry if cfg.entry in node_ids else node_ids[0]

    # Predecessors and Successors maps
    preds: Dict[str, List[str]] = {nid: [] for nid in node_ids}
    succs: Dict[str, List[str]] = {nid: [] for nid in node_ids}

    for edge in cfg.edges:
        if edge.source in preds and edge.target in preds:
            succs[edge.source].append(edge.target)
            preds[edge.target].append(edge.source)

    # 1. Compute Dominators set for each block: Dom(n)
    # Dom(entry) = {entry}
    # Dom(n) = {n} U (Intersection of Dom(p) for all predecessors p of n)
    all_nodes_set = set(node_ids)
    dom: Dict[str, Set[str]] = {}
    for nid in node_ids:
        if nid == entry_id:
            dom[nid] = {entry_id}
        else:
            dom[nid] = set(all_nodes_set)

    changed = True
    while changed:
        changed = False
        for nid in node_ids:
            if nid == entry_id:
                continue

            p_list = preds[nid]
            if p_list:
                new_dom = set(all_nodes_set)
                for p in p_list:
                    new_dom = new_dom.intersection(dom[p])
                new_dom.add(nid)
            else:
                new_dom = {nid}

            if new_dom != dom[nid]:
                dom[nid] = new_dom
                changed = True

    # 2. Compute Immediate Dominators (idom)
    # idom(n) is the unique strict dominator d of n that does not strictly dominate any other strict dominator of n.
    idom: Dict[str, Optional[str]] = {nid: None for nid in node_ids}
    for nid in node_ids:
        if nid == entry_id:
            continue
        strict_doms = dom[nid] - {nid}
        for d in strict_doms:
            # Check if d is dominated by any other strict dominator of nid
            is_immediate = True
            for other in strict_doms:
                if other != d and d in dom[other]:
                    is_immediate = False
                    break
            if is_immediate:
                idom[nid] = d
                break

    # 3. Compute Dominance Frontiers (df)
    # df(X) = { Y | exists predecessor P of Y s.t. X dominates P but X does not strictly dominate Y }
    df: Dict[str, Set[str]] = {nid: set() for nid in node_ids}
    for y in node_ids:
        p_list = preds[y]
        if len(p_list) >= 2:
            for p in p_list:
                runner: Optional[str] = p
                while runner is not None and runner != idom[y]:
                    df[runner].add(y)
                    runner = idom.get(runner)

    return DominatorTreeInfo(
        entry_block_id=entry_id,
        dominators={k: sorted(list(v)) for k, v in dom.items()},
        immediate_dominators=idom,
        dominance_frontiers={k: sorted(list(v)) for k, v in df.items()}
    )
