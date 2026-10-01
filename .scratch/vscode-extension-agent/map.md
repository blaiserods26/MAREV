# Wayfinder Map: Self-Contained VS Code Extension for AI Agent Function Identification

`wayfinder:map`

## Destination

A self-contained VS Code extension located in `vscode-extension/` that captures user-selected C/C++ or assembly code snippets in the active editor, enriches them with enclosing function boundaries and document callee context, executes an embedded multi-provider AI agent (Gemini and local Ollama) to recover semantic function names, C prototypes, parameter types, and explanations, and presents the results in an interactive sidebar Webview with 1-click editor writeback (symbol rename and Doxygen insertion).

## Notes

- **Domain**: VS Code Extension API, TypeScript, AST/Symbol extraction, LLM Agent Reasoning, Webview UI, Editor Writeback.
- **Skills**: `grilling`, `domain-modeling`, `codebase-design`.
- **Standing preferences**: Self-contained runtime inside VS Code without requiring the Python FastAPI backend; support both high-level C/C++ and raw disassembly; mirror the web app's `InstructionPanel` design and `RecoveredSignature` schema.

## Decisions so far

<!-- the index: one line per closed ticket, enough to judge relevance, then zoom the link for the detail the ticket holds -->

- [01: Tracer Bullet — Extension Skeleton, Command & Sidebar Webview Loop](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/.scratch/vscode-extension-agent/issues/01-tracer-bullet-skeleton-and-sidebar.md): Scaffolding, TypeScript build, activity bar view container, and full editor-to-webview communication loop.
- [02: Enclosing Function & Callee Context Extractor](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/.scratch/vscode-extension-agent/issues/02-enclosing-function-and-callee-extractor.md): Zero-config brace AST and label-to-ret boundary detection with local callee scanner.
- [03: Multi-Provider AI Agent Core (Gemini & Local Ollama)](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/.scratch/vscode-extension-agent/issues/03-multi-provider-ai-agent-core.md): Self-contained TypeScript reverse-engineering agent with structured JSON generation via Gemini and Ollama.
- [04: Editor Writeback & 1-Click Code Actions](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/.scratch/vscode-extension-agent/issues/04-editor-writeback-actions.md): Atomic undoable `WorkspaceEdit` symbol renaming and typed Doxygen comment insertion.
- [05: Verification with Sample Binaries & Distributable .VSIX Packaging](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/.scratch/vscode-extension-agent/issues/05-verification-and-vsix-packaging.md): End-to-end tests against `night_cipher_game_c.c` and production packaging into `marev-ai-agent-0.1.0.vsix`.


## Not yet specified

- Local vector store caching of recovered signatures across developer workspaces
- Interactive multi-turn chat directly with the agent inside the sidebar Webview
- Cross-file callee resolution across multi-file C/C++ projects using clangd/compile_commands.json

## Out of scope

- Python FastAPI backend dependency for the extension (extension must operate self-contained)
- Binary compilation or dynamic debugging within the extension
