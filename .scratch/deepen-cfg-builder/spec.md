# Spec: Deepen Control Flow Graph Construction

## Background & Rationale
Control flow graph construction in StaticCFG is currently spread across six shallow modules with hypothetical single-adapter abstract base classes (`BaseBasicBlockEngine`, `BaseCFGBuilder`), an external basic block engine (`BasicBlockEngine`), external single-function metric utilities (`calculate_cyclomatic_complexity`, `find_unreachable_blocks`), and an inline import for back-edge detection (`from app.analysis.loops import detect_back_edges`).

Downstream analysis (dominator trees, loop detection, fingerprinting, semantic identification) and UI visualization depend on strict CFG invariants. Collapsing leader detection, block partitioning, edge routing, reachability, cyclomatic complexity, and back-edge marking into a single deep `CFGBuilder` module maximizes leverage, ensures locality, and provides a crisp test surface.

## Architectural Changes
1. **Canonical Domain Glossary**: Define `Function`, `BasicBlock`, `Control Flow Graph (CFG)`, `Leader`, and `Edge` in `CONTEXT.md`.
2. **Deep `CFGBuilder`**:
   - Encapsulate leader detection rules (entry instruction, jump targets, fallthrough after branch/ret).
   - Encapsulate basic block partitioning and predecessor/successor tracking.
   - Encapsulate edge classification (true/false conditional branches, unconditional jumps, fallthroughs, returns, indirect jumps).
   - Absorb graph metrics (cyclomatic complexity $M = E - N + 2P$, BFS/DFS unreachable block detection).
   - Self-contained back-edge identification based on backward edge target addresses, eliminating late inline imports.
3. **Contract and Purge**:
   - Remove `app/basic_block/` (`base.py`, `engine.py`).
   - Remove `app/cfg/base.py`.
   - Remove `app/analysis/complexity.py` and `app/analysis/reachability.py`.
   - Update `app/analysis/engine.py`, `app/analysis/fingerprint.py`, and test imports.
4. **Verification**:
   - Full test suite passes without regressions.
