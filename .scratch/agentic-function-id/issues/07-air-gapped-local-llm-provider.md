# 07: Air-Gapped Local LLM (Ollama) Support & Provider Settings

**What to build:**
Enable zero-cost, private offline reverse engineering using a local Ollama instance (`localhost:11434`) running coding models such as `qwen2.5-coder` or `deepseek-coder`, with provider selection and connection status in the UI.

**Blocked by:** 05: Tracer Bullet: End-to-End On-Demand Agent Signature Recovery

**Status:** ready-for-agent

- [ ] `OllamaProvider` connecting to local Ollama API.
- [ ] Provider auto-detection / configuration endpoint `GET /api/agent/status`.
- [ ] UI status indicator displaying active provider and model.
- [ ] Fallback error handling if neither cloud key nor local Ollama is active.
