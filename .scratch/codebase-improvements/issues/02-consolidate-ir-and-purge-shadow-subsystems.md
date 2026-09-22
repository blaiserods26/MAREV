# 02: Consolidate IR Models & Purge Shadow Subsystems

**What to build:** Consolidate data models so all components and routes use the authoritative Intermediate Representation in `app/ir/models.py`, remove duplicate models from `app/models/schemas.py`, and delete obsolete shadow basic-block files in `app/cfg/`.

**Blocked by:** None (can start immediately)

**Status:** resolved

- [x] Duplicate models (`Function`, `BasicBlock`, `CFG`, `CFGEdge`, `CallGraph`) removed from `app/models/schemas.py` and imported from `app/ir/models.py` / `app/analysis/callgraph.py`
- [x] Dead shadow files `app/cfg/basic_block.py`, `app/cfg/leader.py`, `app/cfg/edge.py`, and `app/cfg/instruction_classifier.py` removed
- [x] Pydantic deprecation warnings (`PydanticDeprecatedSince20`) resolved
- [x] All unit and API tests pass
