# 02: Deepen CFGBuilder to Absorb Partitioning, Reachability, Complexity, and Back-Edges

**What to build:**
Consolidate basic block leader detection, block partitioning, edge routing, cyclomatic complexity metric calculation, unreachable block analysis, and back-edge detection directly inside `app/cfg/builder.py`. Eliminate external dependencies on `BasicBlockEngine`, `calculate_cyclomatic_complexity`, `find_unreachable_blocks`, and the inline import of `detect_back_edges`.

**Blocked by:** 01 (Establish Domain Model in CONTEXT.md)

**Status:** resolved

- [x] `CFGBuilder.build_cfg(function: Function) -> CFG` is the self-contained interface
- [x] Internalizes leader detection rules: entry instruction, jump targets within function bounds, fallthrough after branch or ret
- [x] Internalizes basic block partitioning with predecessors/successors tracking
- [x] Internalizes cyclomatic complexity metric $M = E - N + 2P$
- [x] Internalizes unreachable block reachability analysis via BFS/DFS traversal
- [x] Identifies loop back-edges deterministically without circular imports
