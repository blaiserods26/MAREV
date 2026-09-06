from typing import List, Optional
from fastapi import APIRouter, HTTPException, Query
from app.models.schemas import FunctionSummary
from app.api.session import SessionStore

router = APIRouter()

@router.get("/functions", response_model=List[FunctionSummary])
def get_functions(
    query: Optional[str] = Query(None, description="Search query for function name or address"),
    section: Optional[str] = Query(None, description="Filter by section name"),
    hide_plt: bool = Query(False, description="Hide PLT section functions"),
    hide_cold: bool = Query(False, description="Hide cold functions")
):
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    if not analysis:
        raise HTTPException(status_code=404, detail="No active assembly file loaded. Please upload a file first.")

    results: List[FunctionSummary] = []
    search_str = query.lower() if query else None

    for func in analysis.functions:
        if section and func.section != section:
            continue
        if hide_plt and (func.section == ".plt" or func.name == ".plt"):
            continue
        if hide_cold and ".cold" in func.name:
            continue

        if search_str:
            if search_str not in func.name.lower() and search_str not in func.address.lower():
                continue

        results.append(func)

    return results
