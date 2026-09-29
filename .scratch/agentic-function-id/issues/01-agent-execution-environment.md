# 01: Agent LLM Provider and Execution Strategy

Type: grilling
Status: resolved
Blocked by: None

## Question

Which LLM provider/backend strategy should power the Agentic Function Identifier? Should it rely on cloud APIs (e.g. Gemini, OpenAI, Anthropic), a local runtime (Ollama, llama-cpp-python) for offline reverse engineering privacy, or a pluggable provider interface?

## Answer

**Decision: Pluggable Multi-Provider Interface (Option 3)**
- Define an abstract `BaseLLMProvider` interface in `app/function_id/agent/providers/base.py`.
- Provide default implementations:
  1. `GoogleGeminiProvider` (fast, cost-effective reasoning for disassembled routines).
  2. `OpenAICompatibleProvider` (works for OpenAI, Anthropic adapters, local Ollama, and vLLM).
- Configuration via environment variables (`LLM_PROVIDER`, `LLM_API_KEY`, `LLM_MODEL`, `LLM_BASE_URL`) defaulting to zero-crash graceful fallback if no API key is present.

