# 07: Implement Pluggable LLM Providers and Agentic Identifier

Type: task
Status: open
Blocked by: 06

## Question

Implement the pluggable provider engine (`BaseLLMProvider`, `GeminiProvider`, `OpenAICompatibleProvider`) and the `AgenticFunctionIdentifier` reasoning agent that synthesizes function signatures and names from the inspection tools.

## Acceptance Criteria
- [ ] `BaseLLMProvider` abstract interface with async/sync generation and JSON schema enforcement.
- [ ] `GeminiProvider` using Google GenAI / REST API.
- [ ] `OpenAICompatibleProvider` for OpenAI, Anthropic, or local Ollama (`http://localhost:11434/v1`).
- [ ] System prompt engineering grounded in x86-64 reverse engineering rules (calling conventions `%rdi, %rsi...`, stack frames, CFG loops, callee context).
- [ ] `AgenticFunctionIdentifier` returns structured `RecoveredSignature` and `CandidatePrediction`.
