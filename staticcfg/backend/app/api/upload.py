import uuid
from fastapi import APIRouter, UploadFile, File, HTTPException
from app.models.schemas import AnalysisResponse
from app.parser.asm_parser import ASMParser
from app.cache.cache_manager import CacheManager
from app.api.session import SessionStore

router = APIRouter()

@router.post("/analyze", response_model=AnalysisResponse)
async def analyze_asm_file(file: UploadFile = File(...)):
    filename = file.filename or "uploaded.asm"

    try:
        content_bytes = await file.read()
        content_str = content_bytes.decode("utf-8", errors="replace")
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Failed to read upload file: {str(e)}")

    if not content_str.strip():
        raise HTTPException(status_code=400, detail="Uploaded file is empty.")

    file_hash = CacheManager.compute_hash(content_str)
    store = SessionStore.get_instance()

    # Check JSON Cache first
    cached_analysis = CacheManager.load_cache(filename, file_hash)
    if cached_analysis:
        file_id = str(uuid.uuid4())
        store.set_active_analysis(file_id, cached_analysis)
        return AnalysisResponse(
            file=filename,
            architecture=cached_analysis.architecture,
            sections=cached_analysis.sections,
            function_count=cached_analysis.function_count
        )

    # Parse disassembly into BinaryProject IR
    parser = ASMParser()
    project = parser.parse_content(content_str, filename=filename)
    if not project.functions:
        raise HTTPException(
            status_code=422,
            detail="No recognizable x86-64 objdump-style instructions or functions were found."
        )

    analysis = CacheManager.build_from_project(project, file_hash)
    CacheManager.save_cache(filename, file_hash, analysis)

    file_id = str(uuid.uuid4())
    store.set_active_analysis(file_id, analysis)

    return AnalysisResponse(
        file=filename,
        architecture=analysis.architecture,
        sections=analysis.sections,
        function_count=analysis.function_count
    )
