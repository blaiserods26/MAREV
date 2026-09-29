# 06: Nested Subroutine & Callee Code Exploration

**What to build:**
Enable the agent to inspect child functions called by the target routine to deduce composite semantics (e.g. recognizing that calling an MD5 transformation loop means the caller is a password hash or checksum validator). Render the analyzed callee list in the UI with interactive links.

**Blocked by:** 05: Tracer Bullet: End-to-End On-Demand Agent Signature Recovery

**Status:** resolved

- [x] `fetch_nested_or_callee_code` tool exposed to agent engine with multi-hop recursive exploration.
- [x] Agent system prompt and context builder format child subroutine instructions, complexity, loop counts, and constants for bottom-up reasoning.
- [x] UI shows interactive "Nested Callees Explored" badges in the signature card allowing seamless click-to-navigate.
- [x] Integration test `test_bottom_up_callee_deduction` verifies wrapper function signature deduction via nested callee analysis.

## Resolution
The nested subroutine exploration slice is fully implemented and tested:
1. `fetch_nested_or_callee_code` recursively traverses child callees up to `max_depth` to pull basic blocks, loops, string refs, and constants.
2. `AgenticFunctionIdentifier` injects nested subroutine behaviors into the LLM context, enabling bottom-up semantic composition.
3. React `InstructionPanel.tsx` displays clickable badges for all analyzed subroutines, linking directly into the CFG canvas.
4. Added test `test_bottom_up_callee_deduction` in `tests/test_agentic_id.py` confirming caller identification via callee inspection.
5. All 40 backend tests pass; frontend build passes.

