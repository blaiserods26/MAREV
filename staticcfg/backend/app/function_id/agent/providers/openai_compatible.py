import os
import json
import logging
from typing import Dict, Any, Optional
import httpx
from app.function_id.agent.providers.base import BaseLLMProvider

logger = logging.getLogger(__name__)

class OpenAICompatibleProvider(BaseLLMProvider):
    """
    Inference provider connecting to OpenAI or local Ollama / vLLM OpenAI-compatible endpoints.
    Defaults to local Ollama on http://localhost:11434/v1 if OLLAMA_HOST or no OPENAI_API_KEY is found.
    """

    def __init__(
        self,
        base_url: Optional[str] = None,
        api_key: Optional[str] = None,
        model: Optional[str] = None,
    ) -> None:
        self.base_url = base_url or os.getenv("LLM_BASE_URL") or os.getenv("OLLAMA_BASE_URL", "http://localhost:11434/v1")
        self.api_key = api_key or os.getenv("OPENAI_API_KEY") or os.getenv("LLM_API_KEY", "ollama")
        self.model = model or os.getenv("LLM_MODEL", "qwen2.5-coder")

    def name(self) -> str:
        return f"openai_compatible ({self.model} @ {self.base_url})"

    def is_available(self) -> bool:
        # Check if local endpoint is responsive or API key is set
        if "localhost" in self.base_url or "127.0.0.1" in self.base_url:
            try:
                with httpx.Client(timeout=1.0) as client:
                    resp = client.get(f"{self.base_url.rstrip('/v1')}/api/version")
                    return resp.status_code == 200
            except Exception:
                return False
        return bool(self.api_key and self.api_key != "ollama")

    def generate_signature(self, prompt: str, callee_context: Optional[str] = None) -> Dict[str, Any]:
        callee_section = ""
        if callee_context:
            callee_section = f"\n\n### Nested Callee / Child Functions Context:\n{callee_context}"

        system_instruction = (
            "You are an expert binary reverse engineer and static program analysis agent. "
            "Analyze the provided x86-64 assembly instructions, basic block Control Flow Graph (CFG), "
            "registers (following System V AMD64 ABI: %rdi, %rsi, %rdx, %rcx, %r8, %r9), string references, "
            "and constants to deduce the function's high-level semantic name, typed C signature, parameter bindings, "
            "and explanation. Return valid JSON only adhering to this structure:\n"
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

        headers = {
            "Authorization": f"Bearer {self.api_key}",
            "Content-Type": "application/json",
        }

        payload = {
            "model": self.model,
            "messages": [
                {"role": "system", "content": system_instruction},
                {"role": "user", "content": f"{prompt}{callee_section}"}
            ],
            "temperature": 0.1,
            "response_format": {"type": "json_object"}
        }

        with httpx.Client(timeout=60.0) as client:
            resp = client.post(f"{self.base_url.rstrip('/')}/chat/completions", headers=headers, json=payload)
            if resp.status_code != 200:
                raise RuntimeError(f"OpenAI-compatible endpoint returned HTTP {resp.status_code}: {resp.text}")

            result = resp.json()
            content = result["choices"][0]["message"]["content"]
            return json.loads(content)
