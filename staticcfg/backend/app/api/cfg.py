import urllib.parse
from fastapi import APIRouter, HTTPException
from app.ir.models import CFG
from app.analysis.callgraph import CallGraph
from app.analysis.dominators import compute_dominators
from app.analysis.loops import analyze_loops
from app.analysis.fingerprint import generate_fingerprint, FunctionFingerprint
from app.api.session import SessionStore

router = APIRouter()

@router.get("/cfg/{function_name:path}", response_model=CFG)
def get_function_cfg(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    cfg = analysis.cfgs.get(decoded_name)
    if not cfg:
        cleaned = decoded_name.strip("<>")
        cfg = analysis.cfgs.get(cleaned)

    if not cfg:
        raise HTTPException(status_code=404, detail=f"CFG for function '{decoded_name}' not found.")

    return cfg

@router.get("/callgraph", response_model=CallGraph)
def get_call_graph():
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    return analysis.callgraph

@router.get("/fingerprint/{function_name:path}", response_model=FunctionFingerprint)
def get_function_fingerprint(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    fp = analysis.fingerprints.get(decoded_name)
    if not fp:
        cleaned = decoded_name.strip("<>")
        fp = analysis.fingerprints.get(cleaned)

    if not fp:
        raise HTTPException(status_code=404, detail=f"Fingerprint for function '{decoded_name}' not found.")

    return fp

@router.get("/analysis/{function_name:path}")
def get_function_analysis(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    cfg = analysis.cfgs.get(decoded_name)
    if not cfg:
        cleaned = decoded_name.strip("<>")
        cfg = analysis.cfgs.get(cleaned)

    if not cfg:
        raise HTTPException(status_code=404, detail=f"Function '{decoded_name}' not found.")

    summary = next((f for f in analysis.functions if f.name == decoded_name or f.name == cleaned), None)
    fp = analysis.fingerprints.get(decoded_name) or analysis.fingerprints.get(cleaned)

    # Dominator analysis
    dom_info = compute_dominators(cfg)
    # Loop analysis
    loop_info = analyze_loops(cfg)
    # Caller/Callee relationships
    rel_info = analysis.callgraph.relationships.get(decoded_name) or analysis.callgraph.relationships.get(cleaned)

    return {
        "function": cfg.function,
        "start_address": summary.address if summary else None,
        "end_address": f"0x{summary.end_address:x}" if summary and summary.end_address else None,
        "instruction_count": summary.instruction_count if summary else 0,
        "basic_block_count": len(cfg.nodes),
        "edge_count": len(cfg.edges),
        "cyclomatic_complexity": cfg.cyclomatic_complexity,
        "unreachable_blocks": cfg.unreachable_blocks,
        "dominators": dom_info.model_dump(),
        "loops": loop_info.model_dump(),
        "callers": rel_info.callers if rel_info else [],
        "callees": rel_info.callees if rel_info else [],
        "fingerprint": fp.model_dump() if fp else None
    }
