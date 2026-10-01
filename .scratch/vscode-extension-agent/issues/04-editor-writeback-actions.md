# 04: Editor Writeback & 1-Click Code Actions

**What to build:**
One-click writeback actions directly within the sidebar result card:
1. "Rename Function in File": Replaces the stripped function name (e.g. `sub_401000` or `f1`) with the predicted semantic name across the active document using `vscode.WorkspaceEdit`.
2. "Insert C Signature / Doxygen Comment": Injects a clean, formatted Doxygen comment (with `@brief`, `@param`, `@return`) and verified C prototype right above the function declaration in the editor buffer.
All edits are performed as a single atomic editor transaction supporting native Undo (`Ctrl+Z`).

**Blocked by:** 03: Multi-Provider AI Agent Core (Gemini & Local Ollama)

**Status:** resolved

- [x] Sidebar action button "Rename in File" triggers `marev.renameFunction` command.
- [x] Document scanner renames the function identifier at its declaration and local call sites in the buffer.
- [x] Sidebar action button "Insert Doxygen / Signature" triggers `marev.insertDocumentation` command.
- [x] Formatted documentation block is inserted directly above the enclosing function boundary.
- [x] "Copy Prototype" button copies the recovered C prototype to the system clipboard.
- [x] Actions are undoable in a single `Ctrl+Z` keystroke.

## Answer

Implemented atomic editor writeback operations in `src/writeback.ts` and `src/doxygen.ts`. The "Rename in File" action uses `vscode.WorkspaceEdit` to replace all identifier occurrences across the active document buffer cleanly. The "Insert Doxygen / Signature" action formats typed Doxygen docblocks (`@brief`, `@param`, `@return`, `@note`) and inserts them immediately preceding the function boundary via `editor.edit`. Both actions are fully undoable with `Ctrl+Z`.

