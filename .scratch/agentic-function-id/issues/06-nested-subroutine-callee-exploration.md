# 06: Nested Subroutine & Callee Code Exploration

**What to build:**
Enable the agent to inspect child functions called by the target routine to deduce composite semantics (e.g. recognizing that calling an MD5 transformation loop means the caller is a password hash or checksum validator). Render the analyzed callee list in the UI with interactive links.

**Blocked by:** 05: Tracer Bullet: End-to-End On-Demand Agent Signature Recovery

**Status:** ready-for-agent

- [ ] `fetch_nested_or_callee_code` tool exposed to agent engine.
- [ ] Agent system prompt instructs bottom-up deduction using callee behaviors.
- [ ] UI shows interactive "Nested Callees Analyzed" badges in the signature card allowing navigation to those subroutines.
- [ ] Integration test with caller-callee binary showing bottom-up deduction.
