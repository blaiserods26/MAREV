# 06: Implement Function Inspection Toolset & Nested Callee Fetcher

Type: task
Status: open
Blocked by: 05

## Question

Build the deterministic inspection layer in `staticcfg/backend/app/function_id/agent/tools.py` that gives the agent grounded visibility into `BinaryProject`, including basic block instructions, CFG graph metrics, call graph callers/callees, and the explicit ability to fetch nested callee disassembly.

## Acceptance Criteria
- [ ] `FunctionInspectionToolset` initialized with `BinaryProject` and `CallGraph`.
- [ ] `get_function_context(func_name)`: Returns instruction count, basic blocks, string refs, constants, and callers/callees.
- [ ] `get_callee_details(callee_name)`: Fetches disassembly and known signatures of nested/called routines.
- [ ] `format_prompt_context(func_name)`: Prepares compact, token-efficient assembly and CFG representation for LLM context.
- [ ] Unit tests verifying accurate extraction on sample x86-64 disassembled binaries.
