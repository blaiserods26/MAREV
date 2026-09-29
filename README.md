# StaticCFG — Production-Quality x86-64 Disassembly & Control Flow Graph Static Analyzer

**StaticCFG** is a high-performance static analysis platform designed to process x86-64 `objdump`-style `.asm` disassembly files, recover function boundaries, construct deterministic Control Flow Graphs (CFGs), execute static structural analysis, and predict function identities in stripped binaries using a multi-stage explainable pipeline.

---

## Architecture & System Overview

StaticCFG follows a clean, decoupled monorepo architecture where architecture-specific disassembly parsing is completely isolated from downstream basic block partitioning, flow graph construction, static analysis, and function identity matching.

```text
Upload stripped/disassembly input
        ↓
Recover functions
        ↓
Build CFGs
        ↓
Build call graph
        ↓
Extract fingerprints
        ↓
Identify known functions
        ↓
Predict unknown function semantics/names
        ↓
Show confidence + evidence in UI
```

---

## Multi-Stage Function Identification Pipeline

For stripped binaries where standard function symbols are stripped (e.g. `sub_401820`), StaticCFG does NOT jump directly from assembly to an arbitrary guessed function name. Instead, it processes each recovered function through a rigorous multi-stage identification pipeline:

```text
Recovered Function
      ↓
Feature Extraction
      ↓
Signature Matching
      ↓
Library/API Evidence
      ↓
String/Constant Evidence
      ↓
CFG Similarity
      ↓
Semantic Classification
      ↓
Candidate Ranking
      ↓
Confidence + Evidence
```

### Identification Methodology & Pipeline Stages

1. **Feature Extraction**: Extracts structural metrics (instruction count, basic block count, edge count, cyclomatic complexity, loop count), opcode category distributions, call references, string references, and numeric constants into a `FunctionFingerprint`.
2. **Signature Matching**: Matches extracted fingerprints against an extensible `SignatureDatabase` pre-populated with standard C library functions (`strlen`, `strcmp`, `strcpy`, `memcpy`, `memset`, `malloc`, `free`) and common routine signatures (`validate_password`, `sha256_transform`, `socket_connect`, `error_exit`).
3. **Library/API Evidence**: Identifies direct calls to imported standard library symbols and system APIs.
4. **String/Constant Evidence**: Scans string literal references (`"password"`, `"access denied"`) and cryptographic magic constants (`0x428a2f98`, `0x67452301`).
5. **CFG Similarity Scoring**: Computes structural graph similarity using block/edge count ratios, cyclomatic complexity similarity, and entry/exit node topology.
6. **Semantic Classification**: Categorizes functions into functional domains:
   - `STRING_PROCESSING`
   - `MEMORY_MANAGEMENT`
   - `FILE_IO`
   - `NETWORKING`
   - `CRYPTOGRAPHY`
   - `VALIDATION`
   - `PARSING`
   - `ERROR_HANDLING`
   - `DISPATCHING`
   - `UTILITY`
   - `UNKNOWN`
7. **Candidate Ranking**: Scores and ranks candidate predictions based on weighted evidence.
8. **Confidence + Explainable Evidence**: Produces confidence percentages alongside itemized evidence bullets (`+ strcmp usage`, `+ validation-like branch structure`) and alternative candidate predictions.

---

## Deterministic Recovery vs. Probabilistic Identification

- **Deterministic Recovery**: Function boundary detection, basic block leader partitioning, control flow graph construction, dominator analysis, loop detection, and call graph generation are 100% deterministic and mathematically verifiable based on formal CFG rules.
- **Probabilistic Identification**: Function name prediction in stripped binaries is probabilistic. The system never presents uncertain predictions as absolute facts. It always preserves the underlying recovered symbol (`sub_401820`) and address (`0x401820`) alongside confidence scores and alternative candidate predictions.

---

## Machine Learning Interface (`BaseMLClassifier`)

To support future ML models (such as Graph Neural Networks or Transformer-based code embeddings) without coupling the core analyzer to any single framework:
- The abstract interface `BaseMLClassifier` (`app/function_id/ml_interface.py`) defines `predict_category()`, `compute_embedding()`, and `compute_similarity()`.
- ML models can be plugged in seamlessly while preserving deterministic static recovery and explainable evidence generation.

---

## Example Pipeline Output

```text
0x401820

Predicted name:
validate_password

Confidence:
87%

Evidence:
+ strcmp usage
+ strlen usage
+ authentication-related string reference
+ validation-like branch structure
+ high CFG similarity

Alternatives:
check_password      72%
verify_credentials  55%
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
7. **`CandidatePrediction`**: Candidate name prediction with confidence, category, and evidence.
8. **`IdentificationResult`**: Multi-stage identification result storing recovered symbol name, address, top prediction, confidence, evidence bullets, and alternative predictions.

---

## Quick Start & Verification

### Running Backend & Unit Tests

```bash
cd staticcfg/backend

# Install dependencies
pip install -r requirements.txt

# Run pytest unit test suite (27 tests)
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