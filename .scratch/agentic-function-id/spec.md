# Feature Spec: Agentic AI Function & Signature Identification

## Problem Statement
StaticCFG previously contained an unimplemented abstract interface `BaseMLClassifier` with no working ML models or dependencies. While deterministic boundary recovery and rule-based heuristics identify known libc functions, stripped binary functions with custom business logic fall back to opaque identifiers like `anon_validation_0x401820`.

Traditional ML (e.g. Asm2Vec, GNNs) is fragile across compiler optimizations, requires huge training datasets, and outputs only opaque embeddings or discrete tags. In contrast, an **Agentic AI** approach leverages state-of-the-art LLMs with deterministic reverse-engineering inspection tools to deduce high-level C-style function prototypes, parameter types/locations, calling conventions, and human-readable reasoning traces.

## System Architecture

```text
User selects stripped function in UI
           ↓
Clicks "Analyze with AI Agent"
           ↓
POST /api/functions/{name}/agent-identify
           ↓
FunctionInspectionToolset extracts:
  • Basic blocks & instruction disassembly
  • CFG graph metrics (loops, cyclomatic complexity)
  • Inbound callers & outbound callees
  • String literals & numeric constants
  • Optional: Nested callee disassembly / known signatures
           ↓
Pluggable BaseLLMProvider (Gemini / OpenAI / Ollama)
           ↓
Structured JSON Output -> RecoveredSignature
           ↓
Frontend displays C prototype, parameters, & reasoning trace
```

## Domain Models
```python
class ParameterSignature(BaseModel):
    name: str
    type_name: str
    register_or_location: Optional[str] = None
    description: Optional[str] = None

class RecoveredSignature(BaseModel):
    name: str
    return_type: str
    parameters: List[ParameterSignature]
    calling_convention: str
    c_prototype: str
    summary: str
    confidence: float
    reasoning: List[str]
    nested_callees_analyzed: List[str]
```
