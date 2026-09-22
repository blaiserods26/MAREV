# 04: Verify CFG Test Suite and Downstream Analysis Pipeline

**What to build:**
Run and update test suites to ensure 100% test pass rate across `test_cfg.py`, `test_analysis.py`, `test_identification.py`, `test_api.py`, `test_ir.py`, and `test_parser.py`. Verify that all CFG construction invariants, cyclomatic complexity calculations, reachability assertions, and loop analyses produce identical or improved deterministic results.

**Blocked by:** 03 (Contract and Delete Obsolete Packages...)

**Status:** resolved

- [x] All CFG builder tests pass with deepened interface
- [x] Analysis, dominator, and loop tests pass
- [x] End-to-end API upload and analysis pipeline runs cleanly
- [x] Pytest reports 100% green (35 passed)
