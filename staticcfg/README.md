# StaticCFG — x86-64 Assembly Control Flow Graph Generator

StaticCFG is a high-performance, web-based static analysis tool that parses **x86-64 objdump-style disassembly files (`.asm`)** and deterministically generates interactive **Control Flow Graphs (CFG)** for functions.

![StaticCFG Architecture](https://img.shields.io/badge/Architecture-x86--64-blue)
![Backend](https://img.shields.io/badge/Backend-FastAPI%20%7C%20Python%203.11+-green)
![Frontend](https://img.shields.io/badge/Frontend-React%20%7C%20TypeScript%20%7C%20ReactFlow-cyan)

---

## 1. Overview

StaticCFG processes disassembly files produced by `objdump -d` (elf64-x86-64 format) without executing code or calling AI models. Control flow graphs are built 100% deterministically using classic compiler basic-block leader analysis.

### Core Analysis Pipeline

```text
ASM File (.asm)
   ↓
Line-Oriented Stream Parser
   ↓
Instructions & Functions
   ↓
Branch & Control-Flow Classifier
   ↓
Basic-Block Leaders
   ↓
Basic Block Partitioning
   ↓
CFG Edge Generation (true / false / jump / fallthrough / return / indirect)
   ↓
Graph Layout & Interactive React Flow Visualization
```

---

## 2. Basic Block Construction Algorithm

Control Flow Graphs are constructed per function using standard leader detection:

1. **Leader Detection**:
   - The first instruction of the function is a leader.
   - The target of any direct branch (conditional or unconditional jump) inside the function is a leader.
   - The instruction immediately following a conditional branch, unconditional jump, or return is a leader.

2. **Block Partitioning**:
   - Instructions from one leader up to (and including) a terminating control-flow instruction or the next leader form a **BasicBlock** (`B0`, `B1`, `B2`, ...).

3. **Edge Typing**:
   - `true`: Branch-taken edge for conditional jump (`je`, `jne`, `jl`, etc.).
   - `false`: Branch-not-taken (fallthrough) edge for conditional jump.
   - `jump`: Target edge for unconditional jump (`jmp`).
   - `fallthrough`: Sequential flow after non-branching instructions or calls.
   - `return`: Edge from `ret` to synthetic `EXIT` node.
   - `indirect`: Edge from indirect branch (`jmp *%rax`) to synthetic `UNKNOWN` node.

---

## 3. Repository Structure

```text
staticcfg/
├── backend/
│   ├── app/
│   │   ├── main.py              # FastAPI entry point & CORS
│   │   ├── api/                 # API routers (upload, functions, cfg)
│   │   ├── parser/              # Line-by-line objdump parser
│   │   ├── cfg/                 # Leader detection, basic blocks, edge building
│   │   ├── analysis/            # Cyclomatic complexity, reachability, call graph
│   │   └── models/              # Pydantic schemas
│   ├── tests/                   # Pytest suite
│   ├── requirements.txt
│   └── README.md
│
├── frontend/
│   ├── src/
│   │   ├── components/          # CFGCanvas, CFGNode, FunctionList, InstructionPanel, Toolbar, UploadPanel
│   │   ├── pages/               # Analyzer.tsx main view
│   │   ├── services/            # Axios API client
│   │   ├── types/               # TypeScript models
│   │   └── index.css            # Dark IDE reverse-engineering theme
│   ├── package.json
│   └── README.md
│
├── sample/
│   └── validator.asm            # Benchmark sample disassembly (126,741 lines)
│
├── README.md
└── .gitignore
```

---

## 4. Quick Start

### Running the Backend (Python / FastAPI)

```bash
cd staticcfg/backend
pip install -r requirements.txt
python -m pytest tests          # Run unit tests
uvicorn app.main:app --port 8000 --reload
```

The backend starts at `http://localhost:8000`. It automatically preloads `sample/validator.asm` on startup if present.

### Running the Frontend (React / Vite)

```bash
cd staticcfg/frontend
npm install
npm run dev
```

Open `http://localhost:3000` in your browser.

---

## 5. Key Features

- **High-Performance Large File Handling**: Parsed 126,741-line `validator.asm` file (1,135 functions) in ~1.2s line-by-line.
- **Interactive CFG Visualizer**: Automatic hierarchical graph layout via Dagre, zoom/pan/fit controls, custom node styling.
- **Deep Inspection**: Clicking any basic block inspects full instruction table (address, raw bytes, mnemonic, operands, comments).
- **Static Analysis Metrics**: Displays function Cyclomatic Complexity (\( M = E - N + 2P \)), highlights unreachable blocks, and extracts program call graphs.
