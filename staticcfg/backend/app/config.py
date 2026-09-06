import os
from typing import Optional
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    app_name: str = "StaticCFG Backend"
    app_version: str = "1.0.0"
    debug: bool = False
    log_level: str = "INFO"
    
    # Path settings
    base_dir: str = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    sample_dir: str = os.path.normpath(os.path.join(base_dir, "..", "sample"))
    validator_sample_path: str = os.path.join(sample_dir, "validator.asm")
    cache_dir: str = os.path.normpath(os.path.join(base_dir, "..", "cache"))
    
    # Analysis thresholds
    max_file_size_mb: int = 200
    cache_enabled: bool = True
    
    class Config:
        env_prefix = "STATICCFG_"
        case_sensitive = False

settings = Settings()
