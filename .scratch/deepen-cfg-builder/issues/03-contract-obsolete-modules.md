# 03: Contract and Delete Obsolete Packages and Phantom Seams

**What to build:**
Delete obsolete packages, single-adapter abstract base classes, and satellite helper modules:
- Remove `staticcfg/backend/app/basic_block/` (`base.py`, `engine.py`, `__init__.py`)
- Remove `staticcfg/backend/app/cfg/base.py` (`BaseCFGBuilder`)
- Remove `staticcfg/backend/app/analysis/complexity.py` and `staticcfg/backend/app/analysis/reachability.py`
- Update `staticcfg/backend/app/cfg/__init__.py` to export `CFGBuilder`
- Update any downstream imports across `staticcfg/backend/`

**Blocked by:** 02 (Deepen CFGBuilder...)

**Status:** resolved

- [x] `app/basic_block/` removed from codebase
- [x] `BaseCFGBuilder` removed from codebase
- [x] `complexity.py` and `reachability.py` removed from `app/analysis/`
- [x] No remaining references or broken imports across `app/` and `tests/`
