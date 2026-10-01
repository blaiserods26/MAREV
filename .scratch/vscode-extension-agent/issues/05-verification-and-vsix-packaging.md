# 05: Verification with Sample Binaries & Distributable .VSIX Packaging

**What to build:**
End-to-end verification of the extension against real stripped C files (such as `assets/night_cipher_game_c.c`) and assembly files, packaging the entire extension into a `.vsix` archive using `@vscode/vsce`, and providing a comprehensive setup guide in `vscode-extension/README.md`.

**Blocked by:** 04: Editor Writeback & 1-Click Code Actions

**Status:** resolved

- [x] Automated or manual verification test with functions in `assets/night_cipher_game_c.c`.
- [x] Packaging script generating a standalone `.vsix` bundle in `vscode-extension/`.
- [x] `README.md` documenting installation, configuration (Gemini API key / Ollama setup), keyboard shortcuts, and sample usage.
- [x] Clean typecheck (`npm run typecheck` / `npm run build`) passing without errors.

## Answer

Implemented verification test suite in `tests/e2eFixture.test.ts` testing extraction directly against real Ghidra decompilation in `assets/night_cipher_game_c.c`. Packaged the standalone production extension into `marev-ai-agent-0.1.0.vsix` (16.11 KB) with full `.vscodeignore` exclusions. Created comprehensive documentation in `vscode-extension/README.md`.

