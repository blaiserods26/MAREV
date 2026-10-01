# MAREV: AI Function Identifier & Reverse Engineering Agent

A self-contained Visual Studio Code extension that uses embedded AI reverse-engineering agents to deduce semantic function names, C prototypes, typed parameter breakdowns, and operational explanations for stripped, decompiled, or obfuscated C and Assembly code.

---

## ✨ Features

- **Multi-Modal Reverse Engineering**: Works with both high-level C/C++ source code (Ghidra decompilations, stripped C files) and raw x86-64 assembly / disassembly.
- **Zero-Config Context Expansion**: Highlight any line or partial block inside a function; MAREV automatically resolves the complete enclosing function boundary and extracts local callee definitions.
- **Nested Callee Inspection**: Automatically extracts invoked subroutines in the active file, providing full structural context to the AI agent.
- **Dual AI Providers**:
  - **Google Gemini**: Cloud reasoning via Gemini 2.5 Flash / Gemini 1.5 Pro.
  - **Local Ollama**: 100% air-gapped, offline reverse engineering via local models (`qwen2.5-coder:latest`, `deepseek-coder`, etc.).
- **Rich Sidebar UI**: Visual identification card mirroring the MAREV instruction panel with confidence percentages, category tags (`CRYPTOGRAPHY`, `VALIDATION`, `DISPATCHER`, etc.), and formatted parameter tables.
- **1-Click Editor Writeback**:
  - **Rename Function in File**: Safely renames the identifier across all local occurrences in the buffer.
  - **Insert Doxygen / Signature**: Injects formatted Doxygen documentation comments immediately above the function.
  - **Atomic & Undoable**: All modifications execute as a single transaction supporting standard `Ctrl+Z` Undo.

---

## 🚀 Quick Start

### 1. Triggering Identification
1. Open any C (`.c`, `.cpp`, `.h`) or Assembly (`.s`, `.asm`) file.
2. Place your cursor inside a stripped function (e.g. `FUN_00102020` or `sub_401120`) or select a code snippet.
3. Right-click and choose **"MAREV: Identify Function with AI Agent"** (or press `Ctrl+Alt+M` / `Cmd+Alt+M`).
4. The **MAREV AI** sidebar opens and displays the extracted code and callee context.
5. Click **"✦ Run AI Function Prediction"** to analyze with the agent.
6. Click **"✏️ Rename in File"** or **"📄 Insert Doxygen"** to apply the result.

---

## ⚙️ Configuration Settings

Open VS Code Settings (`Ctrl+,`) and search for `MAREV`:

| Setting | Default | Description |
| :--- | :--- | :--- |
| `marev.provider` | `"gemini"` | Active provider: `"gemini"` or `"ollama"`. |
| `marev.geminiApiKey` | `""` | Gemini API key (or set `GEMINI_API_KEY` in your environment). |
| `marev.geminiModel` | `"gemini-2.5-flash"` | Gemini model identifier. |
| `marev.ollamaEndpoint`| `"http://localhost:11434"` | Local Ollama HTTP server URL. |
| `marev.ollamaModel` | `"qwen2.5-coder:latest"` | Local Ollama model tag. |
| `marev.autoExpandContext` | `true` | Automatically resolve enclosing function boundary. |

---

## 📦 Building and Testing

```bash
# Install dependencies
npm install

# Run unit and fixture tests
npm test

# Typecheck TypeScript
npm run typecheck

# Build extension bundle
npm run build

# Package into .vsix
npx vsce package --no-dependencies
```
