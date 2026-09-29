import urllib.parse
from typing import Optional, Dict, Any, List
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
    cleaned = decoded_name.strip("<>")
    bracketed = f"<{cleaned}>"
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    cfg = (
        analysis.cfgs.get(decoded_name)
        or analysis.cfgs.get(cleaned)
        or analysis.cfgs.get(bracketed)
    )
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
    cleaned = decoded_name.strip("<>")
    bracketed = f"<{cleaned}>"
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    fp = (
        analysis.fingerprints.get(decoded_name)
        or analysis.fingerprints.get(cleaned)
        or analysis.fingerprints.get(bracketed)
    )
    if not fp:
        raise HTTPException(status_code=404, detail=f"Fingerprint for function '{decoded_name}' not found.")

    return fp

@router.get("/analysis/{function_name:path}")
def get_function_analysis(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    cleaned = decoded_name.strip("<>")
    bracketed = f"<{cleaned}>"
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    cfg = (
        analysis.cfgs.get(decoded_name)
        or analysis.cfgs.get(cleaned)
        or analysis.cfgs.get(bracketed)
    )
    if not cfg:
        raise HTTPException(status_code=404, detail=f"Function '{decoded_name}' not found.")

    summary = next(
        (f for f in analysis.functions if f.name in (decoded_name, cleaned, bracketed)),
        None
    )
    fp = (
        analysis.fingerprints.get(decoded_name)
        or analysis.fingerprints.get(cleaned)
        or analysis.fingerprints.get(bracketed)
    )
    ident = (
        analysis.identifications.get(decoded_name)
        or analysis.identifications.get(cleaned)
        or analysis.identifications.get(bracketed)
    )

    # Dominator analysis
    dom_info = compute_dominators(cfg)
    # Loop analysis
    loop_info = analyze_loops(cfg)
    # Caller/Callee relationships
    rel_info = (
        analysis.callgraph.relationships.get(decoded_name)
        or analysis.callgraph.relationships.get(cleaned)
        or analysis.callgraph.relationships.get(bracketed)
    )

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
        "fingerprint": fp.model_dump() if fp else None,
        "identification": ident.model_dump() if ident else None
    }

@router.get("/identification/{function_name:path}")
def get_function_identification(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    cleaned = decoded_name.strip("<>")
    bracketed = f"<{cleaned}>"
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    ident = (
        analysis.identifications.get(decoded_name)
        or analysis.identifications.get(cleaned)
        or analysis.identifications.get(bracketed)
    )
    if not ident:
        raise HTTPException(status_code=404, detail=f"Identification for function '{decoded_name}' not found.")

    return ident

@router.get("/identifications")
def get_all_identifications():
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    return analysis.identifications

@router.post("/functions/{function_name:path}/agent-identify")
@router.post("/identification/{function_name:path}/agent-identify")
def agent_identify_function(function_name: str):
    decoded_name = urllib.parse.unquote(function_name)
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")


    from app.function_id.agent import AgenticFunctionIdentifier
    try:
        identifier = AgenticFunctionIdentifier(analysis)
        result = identifier.identify_function(decoded_name)
        return result
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Agent identification failed: {str(e)}")

from pydantic import BaseModel

class AgentConfigRequest(BaseModel):
    provider: str
    model: Optional[str] = None
    base_url: Optional[str] = None
    api_key: Optional[str] = None
    save_to_env: Optional[bool] = False

class SaveKeyRequest(BaseModel):
    key: str
    value: str

@router.get("/agent/status")
def get_agent_status():
    from app.function_id.agent.providers import get_active_provider_info
    return get_active_provider_info()

@router.post("/agent/config")
def configure_agent_provider(req: AgentConfigRequest):
    from app.function_id.agent.providers import set_configured_provider, get_active_provider_info
    from app.config import save_env_variable
    try:
        if req.save_to_env and req.api_key:
            pt = req.provider.lower()
            if pt == "gemini":
                save_env_variable("GEMINI_API_KEY", req.api_key)
                if req.model:
                    save_env_variable("GEMINI_MODEL", req.model)
            elif pt in ("openai", "openai_compatible"):
                save_env_variable("OPENAI_API_KEY", req.api_key)
                if req.model:
                    save_env_variable("OPENAI_MODEL", req.model)

        set_configured_provider(
            provider_type=req.provider,
            model=req.model,
            base_url=req.base_url,
            api_key=req.api_key,
        )
        return get_active_provider_info()
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.post("/agent/save-key")
def save_agent_api_key(req: SaveKeyRequest):
    """
    Directly writes an API key or configuration variable into the .env file
    and refreshes the running provider configuration.
    """
    from app.config import save_env_variable
    from app.function_id.agent.providers import set_configured_provider, get_active_provider_info
    
    key_name = req.key.strip().upper()
    if key_name == "GEMINI":
        key_name = "GEMINI_API_KEY"
    elif key_name == "OPENAI":
        key_name = "OPENAI_API_KEY"
        
    save_env_variable(key_name, req.value.strip())
    
    if key_name == "GEMINI_API_KEY":
        set_configured_provider("gemini", api_key=req.value.strip())
    elif key_name == "OPENAI_API_KEY":
        set_configured_provider("openai", api_key=req.value.strip())

    return get_active_provider_info()



