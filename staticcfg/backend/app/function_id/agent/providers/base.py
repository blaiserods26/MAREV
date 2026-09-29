from abc import ABC, abstractmethod
from typing import Dict, Any, Optional
from app.function_id.models import RecoveredSignature

class BaseLLMProvider(ABC):
    """Abstract interface for LLM inference providers powering the Agentic Identifier."""

    @abstractmethod
    def name(self) -> str:
        """Name of the provider (e.g., 'gemini', 'ollama', 'mock')."""
        pass

    @abstractmethod
    def is_available(self) -> bool:
        """Returns True if the provider is configured and available for inference."""
        pass

    @abstractmethod
    def generate_signature(self, prompt: str, callee_context: Optional[str] = None) -> Dict[str, Any]:
        """
        Takes formatted x86-64 reverse engineering prompt and returns parsed signature dict.
        """
        pass
