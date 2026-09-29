import urllib.parse
from typing import Optional, Dict, Any, List
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

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


# ──────────────────────────────────────────────────────────────────
# Batch Scan: stripped-function discovery & agentic bulk rename
# ──────────────────────────────────────────────────────────────────
import re
import threading
import time
import uuid

# In-memory batch job store (singleton – one job at a time)
_batch_jobs: Dict[str, Dict[str, Any]] = {}

_STRIPPED_PATTERNS = re.compile(
    r"^(?:sub_[0-9a-fA-F]+|fn_[0-9a-fA-F]+|func_[0-9a-fA-F]+|FUN_[0-9a-fA-F]+|"
    r"_?[0-9a-fA-F]{4,}|loc_[0-9a-fA-F]+|nullsub_\d+)$",
    re.IGNORECASE,
)

def _is_stripped(name: str) -> bool:
    """Returns True when a function name is a compiler-generated stub like sub_401000."""
    cleaned = name.strip("<>")
    return bool(_STRIPPED_PATTERNS.match(cleaned))


@router.get("/agent/stripped-functions")
def list_stripped_functions():
    """
    Lists all functions whose names are stripped compiler stubs (sub_XXXX, FUN_XXXX, etc.)
    that the AI agent could potentially reconstruct.
    """
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    stripped = []
    seen = set()
    for name in analysis.cfgs:
        cleaned = name.strip("<>")
        if cleaned in seen:
            continue
        if _is_stripped(cleaned):
            seen.add(cleaned)
            ident = analysis.identifications.get(name) or analysis.identifications.get(cleaned)
            already_recovered = bool(
                ident and ident.recovered_signature and ident.recovered_signature.name
                and not _is_stripped(ident.recovered_signature.name)
            )
            cfg_obj = analysis.cfgs.get(name)
            fp = analysis.fingerprints.get(name) or analysis.fingerprints.get(cleaned)
            stripped.append({
                "name": name,
                "clean_name": cleaned,
                "already_recovered": already_recovered,
                "recovered_name": ident.recovered_signature.name if (ident and ident.recovered_signature) else None,
                "block_count": len(cfg_obj.nodes) if cfg_obj else 0,
                "string_count": len(fp.string_references) if fp else 0,
                "has_strings": bool(fp and fp.string_references),
            })

    stripped.sort(key=lambda f: (f["already_recovered"], -f["string_count"], f["clean_name"]))
    return {"stripped_count": len(stripped), "functions": stripped}


class BatchScanRequest(BaseModel):
    max_functions: Optional[int] = None       # None = all
    skip_already_recovered: bool = True
    priority_with_strings: bool = True        # scan string-rich functions first
    concurrency: int = 1                       # sequential (safe for rate-limited APIs)


@router.post("/agent/batch-scan")
def start_batch_scan(req: BatchScanRequest):
    """
    Starts a background batch job that scans all stripped functions in the current
    binary and runs the AI agent on each one to reconstruct its name & signature.
    Returns a job_id for polling.
    """
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded.")

    from app.function_id.agent.providers import get_default_provider
    provider = get_default_provider()
    if not provider.is_available():
        raise HTTPException(
            status_code=400,
            detail=f"No LLM provider available. Configure Gemini or Ollama first. "
                   f"Active: {provider.name()}"
        )

    # Cancel existing running job
    for jid, job in list(_batch_jobs.items()):
        if job["status"] == "running":
            job["cancel_flag"] = True

    # Build target list
    seen = set()
    candidates = []
    for name in analysis.cfgs:
        cleaned = name.strip("<>")
        if cleaned in seen:
            continue
        if not _is_stripped(cleaned):
            continue
        seen.add(cleaned)
        ident = analysis.identifications.get(name) or analysis.identifications.get(cleaned)
        already_recovered = bool(
            ident and ident.recovered_signature and ident.recovered_signature.name
            and not _is_stripped(ident.recovered_signature.name)
        )
        if req.skip_already_recovered and already_recovered:
            continue
        fp = analysis.fingerprints.get(name) or analysis.fingerprints.get(cleaned)
        has_strings = bool(fp and fp.string_references)
        candidates.append((name, has_strings))

    if req.priority_with_strings:
        candidates.sort(key=lambda x: (not x[1], x[0]))  # strings-first

    if req.max_functions is not None:
        candidates = candidates[: req.max_functions]

    job_id = str(uuid.uuid4())[:8]
    job: Dict[str, Any] = {
        "job_id": job_id,
        "status": "running",
        "total": len(candidates),
        "completed": 0,
        "failed": 0,
        "current_function": None,
        "results": [],
        "errors": [],
        "started_at": time.time(),
        "finished_at": None,
        "cancel_flag": False,
    }
    _batch_jobs[job_id] = job

    def _run_batch():
        from app.function_id.agent.engine import AgenticFunctionIdentifier
        from app.function_id.agent.providers import get_default_provider as _get_prov

        p = _get_prov()
        identifier = AgenticFunctionIdentifier(analysis, provider=p)

        for func_name, _has_strings in candidates:
            if job["cancel_flag"]:
                job["status"] = "cancelled"
                job["finished_at"] = time.time()
                return

            job["current_function"] = func_name
            try:
                result = identifier.identify_function(func_name)
                rec_name = result.recovered_signature.name if result.recovered_signature else func_name
                confidence = result.recovered_signature.confidence if result.recovered_signature else 0.0
                job["results"].append({
                    "original_name": func_name,
                    "recovered_name": rec_name,
                    "c_prototype": result.recovered_signature.c_prototype if result.recovered_signature else "",
                    "confidence": round(confidence, 3),
                    "semantic_category": result.semantic_category.value,
                    "summary": result.recovered_signature.summary if result.recovered_signature else "",
                })
            except Exception as exc:
                job["errors"].append({"function": func_name, "error": str(exc)})
                job["failed"] += 1

            job["completed"] += 1

        job["status"] = "done"
        job["current_function"] = None
        job["finished_at"] = time.time()

    t = threading.Thread(target=_run_batch, daemon=True)
    t.start()

    return {
        "job_id": job_id,
        "total": len(candidates),
        "status": "running",
        "message": f"Batch scan started — {len(candidates)} stripped functions queued.",
    }


@router.get("/agent/batch-scan/{job_id}")
def get_batch_scan_status(job_id: str):
    """Returns current progress and partial results for a batch scan job."""
    job = _batch_jobs.get(job_id)
    if not job:
        raise HTTPException(status_code=404, detail=f"Batch job '{job_id}' not found.")
    elapsed = round(time.time() - job["started_at"], 1)
    pct = round((job["completed"] / job["total"]) * 100, 1) if job["total"] > 0 else 0
    return {**job, "elapsed_seconds": elapsed, "progress_pct": pct}


@router.get("/agent/batch-scan")
def list_batch_scan_jobs():
    """Lists all known batch scan jobs (most recent first)."""
    jobs = sorted(_batch_jobs.values(), key=lambda j: j["started_at"], reverse=True)
    return {"jobs": [{k: v for k, v in j.items() if k != "cancel_flag"} for j in jobs[:10]]}


@router.post("/agent/batch-scan/{job_id}/cancel")
def cancel_batch_scan(job_id: str):
    """Requests cancellation of a running batch scan job."""
    job = _batch_jobs.get(job_id)
    if not job:
        raise HTTPException(status_code=404, detail=f"Batch job '{job_id}' not found.")
    if job["status"] != "running":
        raise HTTPException(status_code=400, detail=f"Job '{job_id}' is not running (status: {job['status']}).")
    job["cancel_flag"] = True
    return {"job_id": job_id, "status": "cancelling"}
