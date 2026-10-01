# 03: Multi-Provider AI Agent Core (Gemini & Local Ollama)

**What to build:**
A self-contained TypeScript agent engine embedded in the extension that connects to Google Gemini (using API key) and local Ollama (`http://localhost:11434`), selectable via extension settings or sidebar switcher. The agent takes the extracted function and callee context, prompts the model with a System V AMD64 / C semantics reverse-engineering prompt, enforces structured JSON output adhering to `RecoveredSignature`, and populates the sidebar with the real predicted function name, confidence percentage, C prototype, parameter breakdown, and explanation.

**Blocked by:** 01: Tracer Bullet — Extension Skeleton, Command & Sidebar Webview Loop, 02: Enclosing Function & Callee Context Extractor

**Status:** resolved

- [x] Provider interface with `GeminiProvider` (REST / SDK with JSON mode) and `OllamaProvider` (`/api/generate` with format JSON).
- [x] Provider configuration registered in VS Code settings (`marev.provider`, `marev.geminiApiKey`, `marev.geminiModel`, `marev.ollamaEndpoint`, `marev.ollamaModel`).
- [x] Reverse-engineering prompt engineering for both C source code and Assembly disassembly with System V AMD64 calling conventions and type deduction.
- [x] Response parsing with strict schema validation and fallback JSON extractor.
- [x] Live execution state (analyzing, progress messages, error reporting) in the sidebar webview.
- [x] Parameter breakdown table, confidence gauge, and formatted C prototype rendered in the sidebar UI.

## Answer

Implemented pluggable `LLMProvider` interface with `GeminiProvider` and `OllamaProvider`. Built specialized reverse-engineering system prompts for C source code and Assembly with System V AMD64 calling conventions. Built resilient JSON parser with markdown fence stripping and fallback regex extraction. Configured live execution states, parameter tables, confidence pills, and error handling in the Sidebar Webview.

