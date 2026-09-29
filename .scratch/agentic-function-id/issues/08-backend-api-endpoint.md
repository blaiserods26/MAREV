# 08: Backend On-Demand Agent Identification Endpoint

Type: task
Status: open
Blocked by: 07

## Question

Expose an on-demand endpoint `POST /api/functions/{name}/agent-identify` in FastAPI so the frontend can request agentic identification for any individual function without reprocessing the entire binary.

## Acceptance Criteria
- [ ] Endpoint `POST /api/functions/{name}/agent-identify` added in `app/api/routes.py`.
- [ ] Retrieves `BinaryProject` and `CallGraph` from current analysis session.
- [ ] Invokes `AgenticFunctionIdentifier.identify_function(func_name)`.
- [ ] Caches result in session so repeated calls return instantly.
- [ ] Returns `RecoveredSignature` and updated `IdentificationResult`.
- [ ] Integration tests in `tests/test_api.py`.
