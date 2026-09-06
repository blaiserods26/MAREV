from typing import List, Dict, Set, Optional
from collections import deque
from pydantic import BaseModel, Field
from app.ir.models import CFG, CFGEdge
from app.analysis.dominators import compute_dominators, DominatorTreeInfo

class BackEdge(BaseModel):
    """Back-edge in CFG where target header dominates source tail."""
    source: str
    target: str

class NaturalLoop(BaseModel):
    """Natural loop in CFG with header, back-edge, and member basic block IDs."""
    header: str
    tail: str
    blocks: List[str] = Field(default_factory=list)

class LoopAnalysisResult(BaseModel):
    """Loop Analysis results for a Function CFG."""
    back_edges: List[BackEdge] = Field(default_factory=list)
    loops: List[NaturalLoop] = Field(default_factory=list)
    strongly_connected_components: List[List[str]] = Field(default_factory=list)

def detect_back_edges(cfg: CFG, dom_info: Optional[DominatorTreeInfo] = None) -> List[BackEdge]:
    """Detect back-edges u -> v in CFG where target v dominates source u."""
    if not dom_info:
        dom_info = compute_dominators(cfg)

    back_edges: List[BackEdge] = []
    dom_map = {k: set(v) for k, v in dom_info.dominators.items()}

    for edge in cfg.edges:
        if edge.target in dom_map.get(edge.source, set()):
            back_edges.append(BackEdge(source=edge.source, target=edge.target))

    return back_edges

def compute_natural_loops(cfg: CFG, dom_info: Optional[DominatorTreeInfo] = None) -> List[NaturalLoop]:
    """Compute natural loop basic block sets for all detected back-edges."""
    if not dom_info:
        dom_info = compute_dominators(cfg)

    back_edges = detect_back_edges(cfg, dom_info)
    node_ids = {n.id for n in cfg.nodes}

    preds: Dict[str, List[str]] = {nid: [] for nid in node_ids}
    for edge in cfg.edges:
        if edge.source in preds and edge.target in preds:
            preds[edge.target].append(edge.source)

    loops: List[NaturalLoop] = []

    for be in back_edges:
        header = be.target
        tail = be.source
        
        loop_blocks: Set[str] = {header, tail}
        stack = deque([tail])

        while stack:
            curr = stack.pop()
            for p in preds.get(curr, []):
                if p not in loop_blocks:
                    loop_blocks.add(p)
                    stack.append(p)

        loops.append(
            NaturalLoop(
                header=header,
                tail=tail,
                blocks=sorted(list(loop_blocks))
            )
        )

    return loops

def compute_scc(cfg: CFG) -> List[List[str]]:
    """Compute Strongly Connected Components (SCC) using Tarjan's algorithm."""
    node_ids = [n.id for n in cfg.nodes]
    adj: Dict[str, List[str]] = {nid: [] for nid in node_ids}
    for edge in cfg.edges:
        if edge.source in adj and edge.target in node_ids:
            adj[edge.source].append(edge.target)

    index = 0
    indices: Dict[str, int] = {}
    lowlink: Dict[str, int] = {}
    stack: List[str] = []
    on_stack: Set[str] = set()
    sccs: List[List[str]] = []

    def strongconnect(node: str):
        nonlocal index
        indices[node] = index
        lowlink[node] = index
        index += 1
        stack.append(node)
        on_stack.add(node)

        for neighbor in adj.get(node, []):
            if neighbor not in indices:
                strongconnect(neighbor)
                lowlink[node] = min(lowlink[node], lowlink[neighbor])
            elif neighbor in on_stack:
                lowlink[node] = min(lowlink[node], indices[neighbor])

        if lowlink[node] == indices[node]:
            scc: List[str] = []
            while True:
                w = stack.pop()
                on_stack.remove(w)
                scc.append(w)
                if w == node:
                    break
            if len(scc) > 1 or (scc and node in adj.get(node, [])):
                sccs.append(sorted(scc))

    for nid in node_ids:
        if nid not in indices:
            strongconnect(nid)

    return sccs

def analyze_loops(cfg: CFG) -> LoopAnalysisResult:
    """Run complete loop, back-edge, and SCC analysis for a CFG."""
    dom_info = compute_dominators(cfg)
    back_edges = detect_back_edges(cfg, dom_info)
    natural_loops = compute_natural_loops(cfg, dom_info)
    sccs = compute_scc(cfg)

    return LoopAnalysisResult(
        back_edges=back_edges,
        loops=natural_loops,
        strongly_connected_components=sccs
    )
