# 05: Implement RecoveredSignature in Function ID Models

Type: task
Status: open
Blocked by: None

## Question

Implement the `RecoveredSignature` and `ParameterSignature` domain models in `staticcfg/backend/app/function_id/models.py` and integrate them into `IdentificationResult`.

## Acceptance Criteria
- [ ] `ParameterSignature` model with `name`, `type_name`, `register_or_location`, and `description`.
- [ ] `RecoveredSignature` model with `name`, `return_type`, `parameters`, `calling_convention`, `c_prototype`, `summary`, `confidence`, `reasoning`, and `nested_callees_analyzed`.
- [ ] `IdentificationResult` includes optional `recovered_signature: Optional[RecoveredSignature] = None`.
- [ ] Existing serialization/deserialization tests in `test_api.py` and `test_pipeline.py` continue to pass.
