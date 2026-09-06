from typing import Dict, Optional
from app.cache.cache_manager import CachedAnalysis

class SessionStore:
    _instance: Optional['SessionStore'] = None

    def __init__(self):
        self.cached_analyses: Dict[str, CachedAnalysis] = {}
        self.active_file_id: Optional[str] = None

    @classmethod
    def get_instance(cls) -> 'SessionStore':
        if cls._instance is None:
            cls._instance = SessionStore()
        return cls._instance

    def set_active_analysis(self, file_id: str, analysis: CachedAnalysis):
        self.cached_analyses[file_id] = analysis
        self.active_file_id = file_id

    def get_active_analysis(self) -> Optional[CachedAnalysis]:
        if not self.active_file_id:
            return None
        return self.cached_analyses.get(self.active_file_id)

    def get_analysis(self, file_id: Optional[str] = None) -> Optional[CachedAnalysis]:
        fid = file_id or self.active_file_id
        if not fid:
            return None
        return self.cached_analyses.get(fid)
