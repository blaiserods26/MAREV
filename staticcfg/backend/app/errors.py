from fastapi import Request, status
from fastapi.responses import JSONResponse

class StaticCFGError(Exception):
    """Base exception for all StaticCFG backend errors."""
    def __init__(self, message: str, details: dict = None):
        super().__init__(message)
        self.message = message
        self.details = details or {}

class ParsingError(StaticCFGError):
    """Raised when parsing disassembly text fails."""
    pass

class FunctionRecoveryError(StaticCFGError):
    """Raised when function boundaries cannot be resolved."""
    pass

class CFGConstructionError(StaticCFGError):
    """Raised when building basic blocks or CFG edges fails."""
    pass

class AnalysisError(StaticCFGError):
    """Raised during static analysis computations."""
    pass

async def staticcfg_exception_handler(request: Request, exc: StaticCFGError) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content={
            "error": exc.__class__.__name__,
            "message": exc.message,
            "details": exc.details,
            "path": request.url.path
        }
    )
