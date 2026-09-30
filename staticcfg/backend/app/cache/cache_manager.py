import os
import json
import hashlib
import logging
from typing import Optional
from app.analysis.models import CachedAnalysis

logger = logging.getLogger(__name__)

CACHE_DIR = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), ".cache")

class CacheManager:
    """
    Manages computation of content hashes and disk serialization of CachedAnalysis objects.
    """

    @staticmethod
    def compute_hash(content: str) -> str:
        """Computes a deterministic SHA-256 hash string for input text."""
        return hashlib.sha256(content.encode("utf-8", errors="replace")).hexdigest()

    @staticmethod
    def get_cache_path(filename: str, file_hash: str) -> str:
        """Returns the canonical file path for storing the analysis JSON."""
        os.makedirs(CACHE_DIR, exist_ok=True)
        safe_name = "".join(c if c.isalnum() or c in ("-", "_", ".") else "_" for c in filename)
        return os.path.join(CACHE_DIR, f"{safe_name}_{file_hash[:16]}.json")

    @classmethod
    def load_cache(cls, filename: str, file_hash: str) -> Optional[CachedAnalysis]:
        """Loads cached analysis from disk if existing and valid."""
        path = cls.get_cache_path(filename, file_hash)
        if not os.path.exists(path):
            return None
        try:
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
            return CachedAnalysis.model_validate_json(content)
        except Exception as e:
            logger.warning(f"Failed to load cache from {path}: {e}")
            return None

    @classmethod
    def save_cache(cls, filename: str, file_hash: str, analysis: CachedAnalysis) -> str:
        """Serializes and saves a CachedAnalysis object to disk."""
        path = cls.get_cache_path(filename, file_hash)
        try:
            with open(path, "w", encoding="utf-8") as f:
                f.write(analysis.model_dump_json(indent=2))
        except Exception as e:
            logger.warning(f"Failed to write cache to {path}: {e}")
        return path

    @staticmethod
    def build_from_project(project, file_hash: str) -> CachedAnalysis:
        """Constructs a CachedAnalysis by running the AnalysisEngine on a BinaryProject."""
        from app.analysis.engine import AnalysisEngine
        return AnalysisEngine().analyze(project, file_hash)

    @classmethod
    def build_from_parsed_file(cls, parsed_file, file_hash: str) -> CachedAnalysis:
        """Compatibility wrapper for build_from_project."""
        return cls.build_from_project(parsed_file, file_hash)
