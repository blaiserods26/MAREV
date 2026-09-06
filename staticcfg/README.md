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
cd backend
pip install -r requirements.txt
pytest
uvicorn app.main:app --port 8000 --reload
```

### Running Frontend

```bash
cd frontend
npm install
npm run dev
npm run build
```
