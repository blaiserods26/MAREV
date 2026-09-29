# 07: Air-Gapped Local LLM (Ollama) Support & Provider Settings

**What to build:**
Enable zero-cost, private offline reverse engineering using a local Ollama instance (`localhost:11434`) running coding models such as `qwen2.5-coder` or `deepseek-coder`, with provider selection and connection status in the UI.

**Blocked by:** 05: Tracer Bullet: End-to-End On-Demand Agent Signature Recovery

**Status:** resolved

- [x] `OllamaProvider` connecting to local Ollama daemon (`localhost:11434`).
- [x] Provider auto-detection and configuration endpoints `GET /api/agent/status` and `POST /api/agent/config`.
- [x] UI status indicator and provider switcher dropdown in `InstructionPanel.tsx`.
- [x] Graceful fallback to deterministic offline heuristic engine when neither cloud API keys nor local Ollama are available.

## Resolution
The air-gapped local LLM provider slice is complete:
1. `OllamaProvider` implemented in `app/function_id/agent/providers/ollama.py` with model auto-discovery (`qwen2.5-coder`, `deepseek-coder`, etc.).
2. Runtime provider switching via `set_configured_provider` and endpoints `GET /api/agent/status` and `POST /api/agent/config`.
3. Frontend `InstructionPanel.tsx` includes an interactive provider switcher with live status indicator pill.
4. Added tests `test_agent_provider_configuration` and `test_ollama_provider_mocked` in `tests/test_agentic_id.py`.
5. All 41 backend tests pass; frontend build compiles cleanly with zero errors.

