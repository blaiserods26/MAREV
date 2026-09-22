# Codebase Improvements & Design Realignment Specification

## Objective

Remediate design defects, logic bugs, and duplicate subsystems discovered during codebase analysis, unify the Intermediate Representation (IR), encapsulate analysis into a deep `AnalysisEngine` module, and enhance reverse-engineering capabilities with sidebar identification signals, visual loop rendering, and symbol-less function boundary recovery.

## Plan & Vertical Slices

1. **01-core-bug-fixes-and-frontend-inspector**: Fix loop calculation, feature dictionary key mismatches, and restore the missing inspector cards.
2. **02-consolidate-ir-and-purge-shadow-subsystems**: Clean up redundant IR duplicate models in `schemas.py` and delete dead shadow files in `app/cfg/`.
3. **03-deep-analysis-engine-orchestration**: Encapsulate the analysis pipeline behind a deep `AnalysisEngine` interface.
4. **04-function-identification-sidebar-and-search**: Display predicted function identities and categories in the sidebar and enable search by predicted names.
5. **05-visual-loop-back-edges-and-dominance**: Visually style natural loop back-edges on canvas and add interactive dominance highlighting.
6. **06-symbol-less-binary-function-recovery**: Integrate prologue/epilogue boundary detection for raw symbol-less disassembly.
