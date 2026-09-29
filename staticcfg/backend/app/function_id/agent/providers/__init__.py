import os
from typing import Optional
from app.function_id.agent.providers.base import BaseLLMProvider
from app.function_id.agent.providers.mock import MockDeterministicProvider
from app.function_id.agent.providers.gemini import GoogleGeminiProvider
from app.function_id.agent.providers.openai_compatible import OpenAICompatibleProvider

def get_default_provider() -> BaseLLMProvider:
    """
    Selects the best available LLM provider based on environment configuration:
    1. Google Gemini (if GEMINI_API_KEY or GOOGLE_API_KEY is configured)
    2. OpenAI or Local Ollama (if OPENAI_API_KEY or OLLAMA_HOST is configured)
    3. Mock Deterministic Provider (zero-dependency offline fallback)
    """
    gemini = GoogleGeminiProvider()
    if gemini.is_available():
        return gemini

    openai_p = OpenAICompatibleProvider()
    if openai_p.is_available():
        return openai_p

    return MockDeterministicProvider()

__all__ = [
    "BaseLLMProvider",
    "MockDeterministicProvider",
    "GoogleGeminiProvider",
    "OpenAICompatibleProvider",
    "get_default_provider",
]
