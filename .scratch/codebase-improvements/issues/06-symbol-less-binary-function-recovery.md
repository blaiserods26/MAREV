# 06: Symbol-Less Binary Function Recovery Engine

**What to build:** Enable parsing and CFG recovery on raw x86-64 disassembly files that lack `<symbol>:` headers, using prologue/epilogue detection and instruction stream partitioning.

**Blocked by:** 03-deep-analysis-engine-orchestration

**Status:** resolved

- [x] `FunctionRecoveryEngine` integrated into `ASMParser` fallback pass when symbol headers are missing
- [x] Boundaries detected using `endbr64`, `push rbp`, `ret`, alignment nop sequences, and call targets
- [x] Synthetic function symbols generated (e.g. `sub_<hex_addr>`) with proper instruction stream attribution
- [x] Test cases verifying recovery of multi-function files without symbol headers
