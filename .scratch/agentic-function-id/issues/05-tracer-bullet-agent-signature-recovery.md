# 05: Tracer Bullet: End-to-End On-Demand Agent Signature Recovery

**What to build:**
A complete vertical path from disassembly to UI enabling a user to click "Analyze with AI Agent" on any stripped function in the CFG canvas, invoking an x86-64 reverse engineering agent that returns a typed C prototype, parameter breakdown, and reasoning trace rendered directly in the UI.

**Blocked by:** None (can start immediately)

**Status:** resolved

- [x] `ParameterSignature` and `RecoveredSignature` domain models added to `app/function_id/models.py`.
- [x] `FunctionInspectionToolset` created in `app/function_id/agent/tools.py` extracting basic blocks, branch conditions, CFG metrics, and string/constant xrefs.
- [x] `BaseLLMProvider` interface and working provider adapter (`app/function_id/agent/providers/`) with mock/offline capability and cloud support.
- [x] Reverse engineering prompt engine in `app/function_id/agent/engine.py` producing validated `RecoveredSignature`.
- [x] FastAPI endpoint `POST /api/functions/{name}/agent-identify` in `app/api/cfg.py` with session caching.
- [x] Frontend API client function `agentIdentifyFunction` in `src/services/api.ts`.
- [x] UI component in `InstructionPanel.tsx` showing "Analyze with AI Agent" button, loading spinner, and the rendered signature / parameters / reasoning cards.
- [x] End-to-end pytest test verifying agent signature extraction on a stripped function.

## Resolution
The vertical tracer bullet is complete and verified:
1. `ParameterSignature` and `RecoveredSignature` domain models are integrated into `IdentificationResult`.
2. `FunctionInspectionToolset` provides grounded CFG, instruction disassembly, and nested callee extraction.
3. Pluggable providers (`GoogleGeminiProvider`, `OpenAICompatibleProvider`, and offline `MockDeterministicProvider`) power the `AgenticFunctionIdentifier`.
4. FastAPI endpoint `POST /api/functions/{name}/agent-identify` enables on-demand analysis.
5. React `InstructionPanel.tsx` renders the "Analyze with AI Agent" action, C prototype syntax box, parameter breakdown, and reasoning bullets.
6. All 39 backend tests pass; frontend build succeeds cleanly with `vite`.

