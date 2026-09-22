# 05: Visual Loop Back-Edge Rendering & Dominance Navigation

**What to build:** Make control flow loops immediately identifiable on the CFG canvas by rendering natural loop back-edges with distinct styled amber dashed curves and pill badges, and highlight dominator relationships on block selection.

**Blocked by:** 03-deep-analysis-engine-orchestration

**Status:** resolved

- [x] Loop back-edges identified from loop analysis and passed to frontend edge graph
- [x] Back-edges rendered with custom dashed amber styling and label badges
- [x] Immediate dominator and dominance frontier highlighted when a basic block node is selected
- [x] Toggle switch in toolbar to highlight or filter loop structures
