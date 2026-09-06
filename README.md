# StaticCFG — Production-Quality x86-64 Disassembly & Control Flow Graph Static Analyzer

**StaticCFG** is a high-performance static analysis platform designed to process x86-64 `objdump`-style `.asm` disassembly files, recover function boundaries, construct deterministic Control Flow Graphs (CFGs), execute static structural analysis, and predict function identities in stripped binaries.

---

## Architecture & System Overview

StaticCFG follows a clean, decoupled monorepo architecture where architecture-specific disassembly parsing is completely isolated from downstream basic block partitioning, flow graph construction, static analysis, and function identity matching.

```text
                                  +---------------------------------------+
                                  |         objdump `.asm` File           |
                                  +---------------------------------------+
                                                      |
                                                      v
                                  +---------------------------------------+
                                  |         BaseDisassemblyParser         |
                                  |            (app/parser/)              |
                                  +---------------------------------------+
                                                      |
                                                      v
                                  +---------------------------------------+
                                  |     Intermediate Representation (IR)  |
                                  |     (BinaryProject, Function, etc.)   |
                                  +---------------------------------------+
                                                      |
                                       +--------------+--------------+
                                       |                             |
                                       v                             v
                        +----------------------------+  +----------------------------+
                        |  FunctionRecoveryEngine    |  |     BasicBlockEngine       |
                        |      (app/recovery/)       |  |    (app/basic_block/)      |
                        +----------------------------+  +----------------------------+
                                                                     |
                                                                     v
                                                        +----------------------------+
                                                        |         CFGBuilder         |
                                                        |        (app/cfg/)          |
                                                        +----------------------------+
                                                                     |
                                       +-----------------------------+-----------------------------+
                                       |                             |                             |
                                       v                             v                             v
                        +----------------------------+  +----------------------------+  +----------------------------+
                        |      Analysis Engine       |  | Function ID Interface      |  |       FastAPI & UI         |
                        |     (app/analysis/)        |  |    (app/function_id/)      |  |    (app/api & frontend)    |
                        +----------------------------+  +----------------------------+  +----------------------------+
```

---

## Core IR & Data Models

All static analysis engines and API endpoints operate exclusively on strongly-typed Intermediate Representation (IR) models (`app/ir/models.py`):

1. **`BinaryProject`**: Top-level container representing an analyzed disassembly or binary file, metadata, sections, function index, global cross-references, and call graph.
2. **`Section`**: Memory section representation (`.text`, `.rodata`, `.data`, `.bss`) with memory bounds and instruction streams.
3. **`Function`**: Recovered function representation containing entry address, bounds, calling convention info, instruction list, basic blocks, and CFG.
4. **`Instruction`**: Normalized assembly instruction model with address, raw bytes, mnemonic, operands, branch targets, control flow classification (`COND_BRANCH`, `UNCOND_BRANCH`, `CALL`, `RET`, `INDIRECT_JUMP`, `NORMAL`, `DATA`, `NOP`), comments, and cross-references.
5. **`BasicBlock`**: Basic block container bounded by compiler leader rules, storing instruction lists, predecessor/successor block IDs, and terminator types.
6. **`CFG`**: Control Flow Graph for a function, maintaining entry block ID, exit block IDs, node dictionary, flow edges, cyclomatic complexity metric, and reachability info.
7. **`CFGEdge`**: Directed control flow edge with type classification (`FALLTHROUGH`, `TRUE_BRANCH`, `FALSE_BRANCH`, `UNCOND_JUMP`, `CALL`, `RETURN`, `INDIRECT`, `UNKNOWN`).
8. **`Reference`**: Cross-reference model tracking code and data references (`CALL`, `JUMP`, `DATA`, `STRING`) with source address, target address, and target symbol.

---

## Clean Module Interfaces

- **Parser Interface (`BaseDisassemblyParser`)**: Standardized parser contract (`parse_content`, `parse_file`) isolating file format nuances.
- **Function Recovery Interface (`BaseFunctionRecovery`)**: Abstract engine for boundary recovery, entry point detection, and prologue/epilogue pattern analysis.
- **Basic Block Engine (`BaseBasicBlockEngine`)**: Deterministic partitioner implementing 3-rule leader detection:
  1. Function start instruction is a leader.
  2. Branch targets inside function bounds are leaders.
  3. Instructions immediately following branches or returns are leaders.
- **CFG Builder Interface (`BaseCFGBuilder`)**: Connects basic blocks with typed control flow edges and calculates reachability and cyclomatic complexity ($M = E - N + 2P$).
- **Function Identification Interface (`BaseFunctionMatcher`)**: Abstract interface defining function feature signatures (`FunctionSignature`) and match results (`MatchResult`) ready for signature matching in Phase 4.

---

## Repository Structure

```text
CodetoCFG/
├── staticcfg/
│   ├── backend/
│   │   ├── app/
│   │   │   ├── api/             # FastAPI routers (upload, functions, cfg)
│   │   │   ├── analysis/        # Cyclomatic complexity, reachability, callgraph
│   │   │   ├── basic_block/     # Leader detection & basic block engine
│   │   │   ├── cfg/             # Control Flow Graph builder
│   │   │   ├── function_id/     # Function identification interfaces
│   │   │   ├── ir/              # Core IR models & enums
│   │   │   ├── parser/          # x86-64 objdump parser & abstract parser interface
│   │   │   ├── recovery/        # Function boundary recovery engine
│   │   │   ├── config.py        # Settings management
│   │   │   ├── errors.py        # Exception hierarchy & FastAPI handlers
│   │   │   ├── logging.py       # Structured logging setup
│   │   │   └── main.py          # FastAPI application & lifespan loader
│   │   ├── tests/               # Pytest suite & validator.asm fixture
│   │   │   ├── conftest.py
│   │   │   ├── test_api.py
│   │   │   ├── test_cfg.py
│   │   │   ├── test_ir.py
│   │   │   └── test_parser.py
│   │   ├── pyproject.toml
│   │   └── requirements.txt
│   │
│   ├── frontend/
│   │   ├── src/
│   │   │   ├── components/      # CFG visualizer, node rendering, instruction tables
│   │   │   ├── pages/           # Main analyzer views
│   │   │   ├── services/        # API client
│   │   │   ├── types/           # TypeScript core IR definitions
│   │   │   └── index.css
│   │   ├── package.json
│   │   └── vite.config.ts
│   │
│   └── sample/
│       └── validator.asm        # Benchmark disassembly fixture (126,741 lines)
│
└── README.md
```

---

## Development Phases & Roadmap

| Phase | Status | Focus & Key Deliverables |
| :--- | :--- | :--- |
| **Phase 1: Foundation & Data Models** | **Completed** | Monorepo structure, core IR data models (`BinaryProject`, `Section`, `Function`, `Instruction`, `BasicBlock`, `CFG`, `CFGEdge`, `Reference`), abstract module interfaces, logging, configuration, pytest suite with `validator.asm` fixture, and Vite frontend integration. |
| **Phase 2: Recovery & Advanced CFG** | *Upcoming* | Deep function boundary refinement, indirect jump target resolution (switch tables, jump tables), and exception handling block support. |
| **Phase 3: Analysis & Metrics** | *Upcoming* | Data flow analysis, def-use chains, dominant block analysis, loop detection, and advanced reachability metrics. |
| **Phase 4: Function Identification** | *Upcoming* | Opcode n-gram fingerprinting, CFG graph isomorphism hashing, FLIRT-style library function signature matching for stripped binaries. |
| **Phase 5: Interactive UI & Visualizations** | *Upcoming* | Expanded React Flow layout options, interactive call graph navigation, and side-by-side assembly decompilation view. |

---

## Quick Start & Verification

### Running Backend & Unit Tests

```bash
cd staticcfg/backend

# Install dependencies
pip install -r requirements.txt

# Run pytest unit test suite
pytest

# Launch FastAPI development server
uvicorn app.main:app --port 8000 --reload
```

### Running Frontend

```bash
cd staticcfg/frontend

# Install dependencies
npm install

# Run Vite development server
npm run dev

# Build production bundle
npm run build
```