# 04: Function Signature & Semantic Domain Model

Type: grilling
Status: resolved
Blocked by: None

## Question

How should recovered function signatures be represented in the IR and UI?
Currently `CandidatePrediction` only has `predicted_name: str`, `confidence: float`, `category: SemanticCategory`, and `evidence: List[str]`.
To support true function signature recovery, what fields are needed?
e.g.
- `return_type: str` (e.g. `int`, `void*`, `bool`)
- `parameters: List[ParameterSignature]` (`name`, `type`, `register_or_stack_loc`)
- `summary: str` (high-level behavior description)
- `calling_convention: str` (e.g. `System V AMD64 ABI`)

## Answer

**Decision: Introduce Typed `RecoveredSignature` in Domain & IR (Yes)**
Extend `app/function_id/models.py` with:
```python
class ParameterSignature(BaseModel):
    name: str
    type_name: str
    register_or_location: Optional[str] = None  # e.g. "%rdi", "%rsi", "stack+8"
    description: Optional[str] = None

class RecoveredSignature(BaseModel):
    name: str
    return_type: str
    parameters: List[ParameterSignature] = Field(default_factory=list)
    calling_convention: str = "System V AMD64"
    c_prototype: str  # e.g. "int validate_token(const char* token, size_t len)"
    summary: str
    confidence: float
    reasoning: List[str] = Field(default_factory=list)
    nested_callees_analyzed: List[str] = Field(default_factory=list)
```
Update `IdentificationResult` to include an optional `recovered_signature: Optional[RecoveredSignature]`.

