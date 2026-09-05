# StaticCFG Frontend

React + TypeScript + Vite + React Flow web client for Control Flow Graph visualization.

## Features

- **Reverse Engineering IDE Design**: Dark, compact Ghidra / Binary Ninja / VS Code aesthetic.
- **Searchable Function Browser**: Instant search by function name or address, section filtering, noise reduction (`Hide PLT`, `Hide Cold`).
- **Interactive React Flow Graph Canvas**: Automatic hierarchical layout via Dagre, custom basic block nodes with syntax highlighting, colored edge paths by jump condition.
- **Assembly Inspector Panel**: Bottom panel detailing full instruction table (address, raw bytes, mnemonic, operands, comments).
- **Call Graph Modal**: Program call graph listing direct calls across functions.

## Development

```bash
npm install
npm run dev
```

## Production Build

```bash
npm run build
```
