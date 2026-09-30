import os
import json
import logging
from typing import Dict, Any, Optional
import httpx
from app.config import settings
from app.function_id.agent.providers.base import BaseLLMProvider

logger = logging.getLogger(__name__)

class GoogleGeminiProvider(BaseLLMProvider):
    """
    Inference provider connecting to Google Gemini API (e.g. gemini-1.5-flash or gemini-2.0-flash).
    """

    def __init__(self, api_key: Optional[str] = None, model: Optional[str] = None) -> None:
        self.api_key = (
            api_key
            or settings.gemini_api_key
            or settings.google_api_key
            or os.getenv("GEMINI_API_KEY")
            or os.getenv("GOOGLE_API_KEY")
            or ""
        )
        raw_model = model or os.getenv("GEMINI_MODEL") or settings.gemini_model or "gemini-2.5-flash"
        if "1.5" in raw_model:
            raw_model = "gemini-2.5-flash"
        self.model = raw_model

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
            "and explanation. Return valid JSON only adhering strictly to this JSON schema:\n"
            "{\n"
            '  "name": "function_name",\n'
            '  "return_type": "int",\n'
            '  "calling_convention": "System V AMD64",\n'
            '  "parameters": [\n'
            '    {"name": "buf", "type_name": "const char*", "register_or_location": "%rdi", "description": "..."}\n'
            '  ],\n'
            '  "c_prototype": "int function_name(const char* buf)",\n'
            '  "summary": "High-level summary of what the function computes.",\n'
            '  "confidence": 0.85,\n'
            '  "reasoning": ["Evidence bullet 1", "Evidence bullet 2"],\n'
            '  "nested_callees_analyzed": []\n'
            "}"
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
            if resp.status_code == 404 and self.model != "gemini-2.5-flash":
                logger.warning(f"Model '{self.model}' returned 404. Falling back to 'gemini-2.5-flash'...")
                fallback_url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={self.api_key}"
                resp = client.post(fallback_url, json=payload)

            if resp.status_code != 200:
                logger.error(f"Gemini API error {resp.status_code}: {resp.text}")
                raise RuntimeError(f"Gemini API returned HTTP {resp.status_code}: {resp.text}")


            result = resp.json()
            try:
                candidate = result["candidates"][0]["content"]["parts"][0]["text"].strip()
                if candidate.startswith("```"):
                    candidate = candidate.split("\n", 1)[-1].rsplit("```", 1)[0].strip()
                return json.loads(candidate)
            except Exception as e:
                logger.error(f"Failed to parse Gemini JSON response: {e}")
                raise RuntimeError(f"Failed to parse Gemini response: {e}")

