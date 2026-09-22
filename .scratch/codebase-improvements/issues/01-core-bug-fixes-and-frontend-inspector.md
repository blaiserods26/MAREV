# 01: Core Bug Fixes & Frontend Analysis Inspector Restoration

**What to build:** Ensure structural analysis and function similarity scoring use accurate loop counts and feature metrics, and restore full visibility of incoming callers, outgoing callees, instruction category distributions, and strings/constants in the frontend Analysis tab.

**Blocked by:** None (can start immediately)

**Status:** resolved

- [x] Loop count calculation in `app/function_id/pipeline.py` and `app/function_id/similarity.py` uses actual natural loops instead of `unreachable_blocks`
- [x] Feature category frequency lookup in `similarity.py` correctly queries `instruction_category_frequencies` (with fallback for legacy dicts)
- [x] Frontend `InstructionPanel.tsx` renders Incoming Callers, Outgoing Callees, Instruction Categories, and Strings/Constants panels alongside the Function Identification card
- [x] Backend tests and frontend build pass with zero regressions
