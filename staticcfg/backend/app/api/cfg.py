import urllib.parse
from fastapi import APIRouter, HTTPException
from app.models.schemas import CFG, CallGraph
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
        # Try finding by stripping angle brackets if present
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

@router.get("/analysis/{function_name:path}")
def get_function_analysis(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    cfg = analysis.cfgs.get(decoded_name)
    if not cfg:
        raise HTTPException(status_code=404, detail=f"Function '{decoded_name}' not found.")

    # Find matching summary for instruction count
    summary = next((f for f in analysis.functions if f.name == decoded_name), None)

    return {
        "function": cfg.function,
        "start_address": summary.address if summary else None,
        "end_address": f"0x{summary.end_address:x}" if summary and summary.end_address else None,
        "instruction_count": summary.instruction_count if summary else 0,
        "basic_block_count": len(cfg.nodes),
        "edge_count": len(cfg.edges),
        "cyclomatic_complexity": cfg.cyclomatic_complexity,
        "unreachable_blocks": cfg.unreachable_blocks
    }
