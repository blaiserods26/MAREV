import os
import json
import logging
from typing import Dict, Any, List, Optional
import httpx
from app.config import settings
from app.function_id.agent.providers.base import BaseLLMProvider

logger = logging.getLogger(__name__)

class OllamaProvider(BaseLLMProvider):
    """
    Local air-gapped LLM provider connecting to a local Ollama instance (http://localhost:11434).
    Enables confidential, zero-cost reverse engineering on local machines.
    """

    def __init__(
        self,
        base_url: Optional[str] = None,
        model: Optional[str] = None,
    ) -> None:
        self.base_url = (
            base_url
            or os.getenv("OLLAMA_HOST")
            or os.getenv("OLLAMA_BASE_URL")
            or settings.ollama_host
            or "http://localhost:11434"
        ).rstrip("/")
        self.model = model or os.getenv("OLLAMA_MODEL") or settings.ollama_model or "qwen2.5-coder"

    def name(self) -> str:
        return f"ollama ({self.model})"

    def is_available(self) -> bool:
        """Checks if local Ollama daemon is active and responsive."""
        try:
            with httpx.Client(timeout=1.0) as client:
                resp = client.get(f"{self.base_url}/api/tags")
                return resp.status_code == 200
        except Exception:
            return False

    def list_local_models(self) -> List[str]:
        """Lists models currently installed in the local Ollama instance."""
        try:
            with httpx.Client(timeout=2.0) as client:
                resp = client.get(f"{self.base_url}/api/tags")
                if resp.status_code == 200:
                    data = resp.json()
                    return [m.get("name", "") for m in data.get("models", []) if m.get("name")]
        except Exception:
            pass
        return []

    def generate_signature(self, prompt: str, callee_context: Optional[str] = None) -> Dict[str, Any]:
        callee_section = ""
        if callee_context:
            callee_section = f"\n\n### Nested Callee / Child Functions Context:\n{callee_context}"

        system_instruction = (
            "You are an expert binary reverse engineer and static program analysis agent. "
            "Analyze the provided x86-64 assembly instructions, basic block Control Flow Graph (CFG), "
            "registers (following System V AMD64 ABI: %rdi, %rsi, %rdx, %rcx, %r8, %r9), string references, "
            "and constants to deduce the function's high-level semantic name, typed C signature, parameter bindings, "
            "and explanation. Return valid JSON only adhering strictly to this JSON structure:\n"
            "{\n"
            '  "name": "function_name",\n'
            '  "return_type": "int",\n'
            '  "calling_convention": "System V AMD64",\n'
            '  "parameters": [{"name": "buf", "type_name": "const char*", "register_or_location": "%rdi", "description": "..."}],\n'
            '  "c_prototype": "int function_name(const char* buf)",\n'
            '  "summary": "...",\n'
            '  "confidence": 0.85,\n'
            '  "reasoning": ["...", "..."],\n'
            '  "nested_callees_analyzed": []\n'
            "}"
        )

        full_prompt = f"{system_instruction}\n\n{prompt}{callee_section}"

        payload = {
            "model": self.model,
            "prompt": full_prompt,
            "format": "json",
            "stream": False,
            "options": {
                "temperature": 0.1,
            }
        }

        try:
            with httpx.Client(timeout=60.0) as client:
                resp = client.post(f"{self.base_url}/api/generate", json=payload)
                if resp.status_code != 200:
                    raise RuntimeError(f"Ollama API returned HTTP {resp.status_code}: {resp.text}")

                data = resp.json()
                response_text = data.get("response", "{}")
                return json.loads(response_text)
        except Exception as e:
            logger.error(f"Ollama generation error: {e}")
            raise RuntimeError(f"Local Ollama generation failed: {str(e)}")
