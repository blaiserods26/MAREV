# 03: Pipeline Integration and Cascading Architecture

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

How should the agent integrate into `FunctionIdentificationPipeline`?
Should it:
- A. Run as a fallback only when deterministic and heuristic signature matching (exact symbol table exports, `SignatureDatabase`) fail or return confidence below a threshold (e.g., < 0.60)?
- B. Run on-demand via a user trigger in the frontend (e.g. "Ask Agent to Analyze Function") to save latency and token cost?
- C. Run eagerly on every function in the binary?

## Answer

**Decision: On-Demand Interactive Analysis (Option 2)**
- Do NOT run the agent eagerly across hundreds of functions during raw file upload (prevents huge latency, API rate limits, and excessive token spend).
- Upload runs fast deterministic recovery and static signature heuristics.
- Expose an explicit backend endpoint `POST /api/functions/{name}/agent-identify` triggered on-demand from the UI (e.g. selecting a function in the CFG canvas or side panel and clicking "Analyze with AI Agent").
- Cache agent identification results in the active project session so repeated queries on the same function return instantly.

