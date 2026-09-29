import os
import logging
from typing import Optional, List
import dotenv
from pydantic import Field, AliasChoices
from pydantic_settings import BaseSettings, SettingsConfigDict

logger = logging.getLogger(__name__)

# Search paths for .env
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPO_ROOT = os.path.normpath(os.path.join(BASE_DIR, "..", ".."))

ENV_PATHS: List[str] = [
    os.path.join(BASE_DIR, ".env"),
    os.path.join(REPO_ROOT, ".env"),
    os.path.abspath(".env")
]

PRIMARY_ENV_FILE = os.path.join(BASE_DIR, ".env")

# Automatically load .env on startup so os.environ is populated
for p in ENV_PATHS:
    if os.path.isfile(p):
        dotenv.load_dotenv(dotenv_path=p, override=True)
        break

class Settings(BaseSettings):
    app_name: str = "StaticCFG Backend"
    app_version: str = "1.0.0"
    debug: bool = False
    log_level: str = "INFO"
    
    # Path settings
    base_dir: str = BASE_DIR
    sample_dir: str = os.path.normpath(os.path.join(BASE_DIR, "..", "sample"))
    validator_sample_path: str = os.path.join(sample_dir, "validator.asm")
    cache_dir: str = os.path.normpath(os.path.join(BASE_DIR, "..", "cache"))
    
    # Analysis thresholds
    max_file_size_mb: int = 200
    cache_enabled: bool = True
    
    # Agentic AI & LLM Provider Keys
    gemini_api_key: Optional[str] = Field(
        default=None,
        validation_alias=AliasChoices("STATICCFG_GEMINI_API_KEY", "GEMINI_API_KEY", "GOOGLE_API_KEY")
    )
    google_api_key: Optional[str] = Field(
        default=None,
        validation_alias=AliasChoices("STATICCFG_GOOGLE_API_KEY", "GOOGLE_API_KEY")
    )
    openai_api_key: Optional[str] = Field(
        default=None,
        validation_alias=AliasChoices("STATICCFG_OPENAI_API_KEY", "OPENAI_API_KEY")
    )
    gemini_model: str = Field(
        default="gemini-1.5-flash",
        validation_alias=AliasChoices("STATICCFG_GEMINI_MODEL", "GEMINI_MODEL")
    )
    openai_model: str = Field(
        default="gpt-4o-mini",
        validation_alias=AliasChoices("STATICCFG_OPENAI_MODEL", "OPENAI_MODEL")
    )
    ollama_host: str = Field(
        default="http://localhost:11434",
        validation_alias=AliasChoices("STATICCFG_OLLAMA_HOST", "OLLAMA_HOST")
    )
    ollama_model: str = Field(
        default="qwen2.5-coder",
        validation_alias=AliasChoices("STATICCFG_OLLAMA_MODEL", "OLLAMA_MODEL")
    )

    model_config = SettingsConfigDict(
        env_file=tuple(ENV_PATHS),
        env_file_encoding="utf-8",
        env_prefix="STATICCFG_",
        case_sensitive=False,
        extra="ignore"
    )

settings = Settings()

def get_env_file_path() -> str:
    """Returns the primary .env file path."""
    return PRIMARY_ENV_FILE

def save_env_variable(key: str, value: str) -> None:
    """
    Saves or updates a key=value pair in the primary .env file,
    and updates os.environ and the active settings instance.
    """
    env_path = get_env_file_path()
    if not os.path.exists(env_path):
        os.makedirs(os.path.dirname(env_path), exist_ok=True)
        with open(env_path, "w", encoding="utf-8") as f:
            f.write("# StaticCFG Environment Variables\n")

    dotenv.set_key(env_path, key, value)
    os.environ[key] = value

    # Update in-memory settings instance
    attr_map = {
        "GEMINI_API_KEY": "gemini_api_key",
        "GOOGLE_API_KEY": "google_api_key",
        "OPENAI_API_KEY": "openai_api_key",
        "GEMINI_MODEL": "gemini_model",
        "OPENAI_MODEL": "openai_model",
        "OLLAMA_HOST": "ollama_host",
        "OLLAMA_MODEL": "ollama_model",
    }
    if key in attr_map:
        setattr(settings, attr_map[key], value)
    logger.info(f"[Config] Updated environment variable '{key}' in .env and memory.")

