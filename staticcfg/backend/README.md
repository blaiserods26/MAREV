# StaticCFG Backend

FastAPI static analysis service for x86-64 objdump disassembly files (`.asm`).

## Features

- **Line-oriented Objdump Stream Parser**: Parses sections (`.text`, `.plt`, `.init`), function boundaries (`<name>:`), instructions, raw bytes, mnemonics, operands, and targets.
- **Control Flow Classifier**: Categorizes x86-64 conditional jumps, unconditional jumps, calls, returns, and indirect branches.
- **Leader Detection & Basic Block Partitioning**: Constructs basic blocks deterministically.
- **CFG Builder**: Builds typed graph edges (`true`, `false`, `jump`, `fallthrough`, `return`, `indirect`, `unknown`).
- **Static Analysis**: Cyclomatic complexity (\( M = E - N + 2P \)), reachability analysis, and program-level call graph.

## Setup & Running

```bash
python -m venv venv
source venv/bin/activate  # Or venv\Scripts\activate on Windows
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8000
```

## Running Tests

```bash
python -m pytest tests
```
