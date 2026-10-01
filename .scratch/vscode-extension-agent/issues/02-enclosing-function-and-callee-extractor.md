# 02: Enclosing Function & Callee Context Extractor

**What to build:**
When a developer highlights only part of a function or has their cursor inside a function, the extension automatically inspects the document buffer to detect the complete **Enclosing Function Boundary** (using zero-config brace-matching for C/C++ and label-to-ret boundaries for Assembly) and identifies any local callee functions invoked within that body. The extracted context is displayed in the sidebar so the user can verify what code will be fed to the agent.

**Blocked by:** 01: Tracer Bullet — Extension Skeleton, Command & Sidebar Webview Loop

**Status:** resolved

- [x] Context extractor resolves enclosing C/C++ function start line, end line, and signature header.
- [x] Context extractor resolves enclosing x86 assembly function boundary (`label:` to `ret`).
- [x] Heuristic callee scanner identifies `call <func>` or `func(...)` calls within the function body and extracts their definitions from the same file if present.
- [x] Sidebar webview displays the resolved enclosing function and attached callee context drawer.
- [x] Unit tests verify extraction on standard C functions and assembly routines.

## Answer

Implemented zero-config `extractFunctionContext` supporting both C/C++ brace-matching AST heuristics and Assembly label-to-ret boundary resolution. Implemented recursive document callee scanning that captures child subroutine definitions to empower agent reverse-engineering. Added comprehensive vitest suite in `tests/contextExtractor.test.ts`.

