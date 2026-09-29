import os
import json
import logging
from typing import Dict, Any, Optional
import httpx
from app.function_id.agent.providers.base import BaseLLMProvider

logger = logging.getLogger(__name__)

class GoogleGeminiProvider(BaseLLMProvider):
    """
    Inference provider connecting to Google Gemini API (e.g. gemini-1.5-flash or gemini-2.0-flash).
    """

    def __init__(self, api_key: Optional[str] = None, model: str = "gemini-1.5-flash") -> None:
        self.api_key = api_key or os.getenv("GEMINI_API_KEY") or os.getenv("GOOGLE_API_KEY") or ""
        self.model = os.getenv("GEMINI_MODEL") or model

    def name(self) -> str:
        return f"gemini ({self.model})"

    def is_available(self) -> bool:
        return bool(self.api_key.strip())

    def generate_signature(self, prompt: str, callee_context: Optional[str] = None) -> Dict[str, Any]:
        if not self.is_available():
            raise RuntimeError("Gemini API key is not configured. Set GEMINI_API_KEY environment variable.")

        url = f"https://generativelanguage.googleapis.com/v1beta/models/{self.model}:generateContent?key={self.api_key}"

        callee_section = ""
        if callee_context:
            callee_section = f"\n\n### Nested Callee / Child Functions Context:\n{callee_context}"

        system_instruction = (
            "You are an expert binary reverse engineer and static program analysis agent. "
            "Analyze the provided x86-64 assembly instructions, basic block Control Flow Graph (CFG), "
            "registers (following System V AMD64 ABI: %rdi, %rsi, %rdx, %rcx, %r8, %r9), string references, "
            "and constants to deduce the function's high-level semantic name, typed C signature, parameter bindings, "
            "and explanation. Return valid JSON only adhering strictly to the requested schema."
        )

        full_prompt = f"{prompt}{callee_section}"

        payload = {
            "contents": [
                {
                    "role": "user",
                    "parts": [{"text": full_prompt}]
                }
            ],
            "system_instruction": {
                "parts": [{"text": system_instruction}]
            },
            "generationConfig": {
                "temperature": 0.1,
                "response_mime_type": "application/json",
            }
        }

        with httpx.Client(timeout=30.0) as client:
            resp = client.post(url, json=payload)
            if resp.status_code != 200:
                logger.error(f"Gemini API error {resp.status_code}: {resp.text}")
                raise RuntimeError(f"Gemini API returned HTTP {resp.status_code}: {resp.text}")

            result = resp.json()
            try:
                candidate = result["candidates"][0]["content"]["parts"][0]["text"]
                return json.loads(candidate)
            except Exception as e:
                logger.error(f"Failed to parse Gemini JSON response: {e}")
                raise RuntimeError(f"Failed to parse Gemini response: {e}")
