import os
import time
from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.config import settings
from app.logging import logger
from app.errors import StaticCFGError, staticcfg_exception_handler
from app.api import upload, functions, cfg
from app.parser.asm_parser import ASMParser
from app.cache.cache_manager import CacheManager
from app.api.session import SessionStore

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Fast load sample validator.asm from JSON cache or parse & cache on startup
    sample_path = settings.validator_sample_path
    if os.path.exists(sample_path):
        try:
            t0 = time.time()
            with open(sample_path, "r", encoding="utf-8", errors="replace") as f:
                content = f.read()
            file_hash = CacheManager.compute_hash(content)
            filename = "validator.asm"

            # Check JSON Cache
            cached = CacheManager.load_cache(filename, file_hash)
            if cached:
                store = SessionStore.get_instance()
                store.set_active_analysis("sample-validator", cached)
                dt = (time.time() - t0) * 1000
                logger.info(f"[StaticCFG] Fast-loaded pre-built JSON cache for validator.asm in {dt:.1f}ms ({cached.function_count} functions).")
            else:
                logger.info(f"[StaticCFG] Parsing validator.asm into BinaryProject IR and building JSON cache...")
                parser = ASMParser()
                project = parser.parse_content(content, filename=filename)
                if project.functions:
                    analysis = CacheManager.build_from_project(project, file_hash)
                    CacheManager.save_cache(filename, file_hash, analysis)
                    store = SessionStore.get_instance()
                    store.set_active_analysis("sample-validator", analysis)
                    dt = time.time() - t0
                    logger.info(f"[StaticCFG] Built and cached JSON for validator.asm in {dt:.2f}s ({analysis.function_count} functions).")
        except Exception as e:
            logger.error(f"[StaticCFG] Failed to load sample validator.asm: {e}")
    yield

app = FastAPI(
    title=settings.app_name,
    description="Deterministic x86-64 Control Flow Graph Static Analyzer & Intermediate Representation",
    version=settings.app_version,
    lifespan=lifespan
)

app.add_exception_handler(StaticCFGError, staticcfg_exception_handler)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(upload.router, prefix="/api")
app.include_router(functions.router, prefix="/api")
app.include_router(cfg.router, prefix="/api")

@app.get("/api/health")
def health_check():
    store = SessionStore.get_instance()
    analysis = store.get_analysis()
    return {
        "status": "ok",
        "active_file": analysis.file if analysis else None,
        "function_count": analysis.function_count if analysis else 0
    }
