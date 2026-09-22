# 03: Deep AnalysisEngine Pipeline Orchestration

**What to build:** Encapsulate the entire static analysis workflow (boundary refinement, basic block partitioning, CFG construction, call graph extraction, fingerprinting, dominators, loops, and identification) behind a single deep `AnalysisEngine` module with a clean interface.

**Blocked by:** 01-core-bug-fixes-and-frontend-inspector, 02-consolidate-ir-and-purge-shadow-subsystems

**Status:** resolved

- [x] `AnalysisEngine` created with clean `analyze(project: BinaryProject) -> CachedAnalysis` interface
- [x] Analysis orchestration logic cleanly separated from cache serialization in `CacheManager`
- [x] Startup sample preloading and `/api/analyze` route use `AnalysisEngine`
- [x] Comprehensive unit tests verifying end-to-end analysis orchestration
