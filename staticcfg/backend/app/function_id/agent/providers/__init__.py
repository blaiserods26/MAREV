import os
from typing import Optional, Dict, Any, List
from app.function_id.agent.providers.base import BaseLLMProvider
from app.function_id.agent.providers.mock import MockDeterministicProvider
from app.function_id.agent.providers.gemini import GoogleGeminiProvider
from app.function_id.agent.providers.openai_compatible import OpenAICompatibleProvider
from app.function_id.agent.providers.ollama import OllamaProvider

_configured_provider: Optional[BaseLLMProvider] = None

def get_default_provider() -> BaseLLMProvider:
    """
    Selects the best available LLM provider based on environment configuration or runtime selection:
    1. Runtime-configured provider (if set)
    2. Google Gemini (if GEMINI_API_KEY or GOOGLE_API_KEY is configured)
    3. Local Ollama (if running on localhost:11434)
    4. OpenAI-compatible endpoint (if OPENAI_API_KEY is configured)
    5. Mock Deterministic Provider (zero-dependency offline fallback)
    """
    global _configured_provider
    if _configured_provider is not None:
        return _configured_provider

    gemini = GoogleGeminiProvider()
    if gemini.is_available():
        return gemini

    ollama = OllamaProvider()
    if ollama.is_available():
        return ollama

    openai_p = OpenAICompatibleProvider()
    if openai_p.is_available():
        return openai_p

    return MockDeterministicProvider()

def set_configured_provider(
    provider_type: str,
    model: Optional[str] = None,
    base_url: Optional[str] = None,
    api_key: Optional[str] = None
) -> BaseLLMProvider:
    """Sets the active provider for the agentic identification pipeline."""
    global _configured_provider
    pt = provider_type.lower()
    if pt == "gemini":
        _configured_provider = GoogleGeminiProvider(api_key=api_key, model=model or "gemini-1.5-flash")
    elif pt == "ollama":
        _configured_provider = OllamaProvider(base_url=base_url, model=model or "qwen2.5-coder")
    elif pt in ("openai", "openai_compatible"):
        _configured_provider = OpenAICompatibleProvider(base_url=base_url, api_key=api_key, model=model)
    elif pt in ("mock", "mock_deterministic", "offline"):
        _configured_provider = MockDeterministicProvider()
    else:
        raise ValueError(f"Unknown provider type '{provider_type}'. Supported: 'gemini', 'ollama', 'openai', 'mock'")

    return _configured_provider

def get_active_provider_info() -> Dict[str, Any]:
    """Returns metadata about active provider and available alternatives."""
    active = get_default_provider()

    gemini = GoogleGeminiProvider()
    gemini_avail = gemini.is_available()
    masked_key = ""
    if gemini_avail and gemini.api_key:
        k = gemini.api_key.strip()
        masked_key = f"{k[:4]}...{k[-4:]}" if len(k) > 10 else "***"

    ollama = OllamaProvider()
    ollama_avail = ollama.is_available()
    local_models = ollama.list_local_models() if ollama_avail else []

    return {
        "status": "ready" if active.is_available() else "offline",
        "active_provider": active.name(),
        "is_available": active.is_available(),
        "gemini_configured": gemini_avail,
        "gemini_masked_key": masked_key,
        "available_providers": [
            {"id": "gemini", "name": "Google Gemini", "available": gemini_avail, "masked_key": masked_key},
            {"id": "ollama", "name": "Local Ollama (Air-Gapped)", "available": ollama_avail, "models": local_models},
            {"id": "mock", "name": "Deterministic Offline Engine", "available": True},
        ]
    }

__all__ = [
    "BaseLLMProvider",
    "MockDeterministicProvider",
    "GoogleGeminiProvider",
    "OpenAICompatibleProvider",
    "OllamaProvider",
    "get_default_provider",
    "set_configured_provider",
    "get_active_provider_info",
]
