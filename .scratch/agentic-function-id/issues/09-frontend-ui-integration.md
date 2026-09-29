# 09: Frontend Agentic Signature Inspector & Action Button

Type: task
Status: open
Blocked by: 08

## Question

Add an interactive "Analyze with AI Agent" button and signature inspector in the frontend CFG view so users can trigger on-demand signature recovery and view the resulting C prototype, parameters, calling convention, and reasoning trace.

## Acceptance Criteria
- [ ] Add `agentIdentifyFunction(name)` service in `src/services/api.ts`.
- [ ] Add "Analyze with Agent" button in `CFGCanvas.tsx` / function metadata sidebar when viewing a stripped or selected function.
- [ ] Render recovered C prototype (e.g. `int validate_token(const char* buf, size_t len)`), parameter breakdown, and reasoning bullets.
- [ ] Show loading state with animated progress while the agent is reasoning.
