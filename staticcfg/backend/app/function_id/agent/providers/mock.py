from typing import Dict, Any, Optional
from app.function_id.agent.providers.base import BaseLLMProvider

class MockDeterministicProvider(BaseLLMProvider):
    """
    Offline deterministic provider for unit tests and local development when no API key is set.
    Deduces high quality reverse engineering signatures based on CFG signals in the prompt.
    """

    def name(self) -> str:
        return "mock_deterministic"

    def is_available(self) -> bool:
        return True

    def generate_signature(self, prompt: str, callee_context: Optional[str] = None) -> Dict[str, Any]:
        prompt_lower = prompt.lower()

        # Crypto SHA-256 detection
        if "0x428a2f98" in prompt_lower or "0x67452301" in prompt_lower:
            return {
                "name": "sha256_transform",
                "return_type": "void",
                "calling_convention": "System V AMD64",
                "parameters": [
                    {"name": "state", "type_name": "uint32_t*", "register_or_location": "%rdi", "description": "Pointer to 8-word SHA-256 state buffer"},
                    {"name": "data", "type_name": "const uint8_t*", "register_or_location": "%rsi", "description": "Pointer to 64-byte block data"},
                ],
                "c_prototype": "void sha256_transform(uint32_t *state, const uint8_t *data)",
                "summary": "SHA-256 block transformation round function processing a 512-bit message chunk.",
                "confidence": 0.95,
                "reasoning": [
                    "Identified SHA-256 initial state / K-constant magic constants (0x428a2f98, 0x67452301)",
                    "Loop structure and bitwise rotate/shift/xor schedule matches SHA-256 round expansion",
                    "Takes state pointer in %rdi and data buffer in %rsi according to System V ABI"
                ],
                "nested_callees_analyzed": []
            }

        # Password / Credential Validation
        if "password" in prompt_lower or "access denied" in prompt_lower or "strcmp" in prompt_lower:
            return {
                "name": "validate_password",
                "return_type": "int",
                "calling_convention": "System V AMD64",
                "parameters": [
                    {"name": "input_password", "type_name": "const char*", "register_or_location": "%rdi", "description": "Null-terminated input password string"},
                ],
                "c_prototype": "int validate_password(const char *input_password)",
                "summary": "Authenticates user-supplied credential against target password string or hash.",
                "confidence": 0.92,
                "reasoning": [
                    "Observed string reference keywords related to authentication ('password', 'access')",
                    "Disassembly contains string comparison and conditional branch routing to success/failure blocks",
                    "Returns status code / boolean 0 or 1 in register %eax"
                ],
                "nested_callees_analyzed": []
            }

        # Auth Token / Token parser
        if "token" in prompt_lower or "auth" in prompt_lower:
            return {
                "name": "verify_auth_token",
                "return_type": "int",
                "calling_convention": "System V AMD64",
                "parameters": [
                    {"name": "token_str", "type_name": "const char*", "register_or_location": "%rdi", "description": "Raw authentication token"},
                    {"name": "token_len", "type_name": "size_t", "register_or_location": "%rsi", "description": "Length of token string in bytes"},
                ],
                "c_prototype": "int verify_auth_token(const char *token_str, size_t token_len)",
                "summary": "Verifies cryptographic validity and header format of session auth token.",
                "confidence": 0.88,
                "reasoning": [
                    "References security token strings and validation branch checks",
                    "Two parameters passed in %rdi (pointer) and %rsi (length)",
                    "Terminal return block writes 0 or 1 to %eax"
                ],
                "nested_callees_analyzed": []
            }

        # Nested Callee context deduction
        if callee_context and ("sha256" in callee_context.lower() or "hash" in callee_context.lower()):
            return {
                "name": "verify_payload_checksum",
                "return_type": "int",
                "calling_convention": "System V AMD64",
                "parameters": [
                    {"name": "payload", "type_name": "const void*", "register_or_location": "%rdi", "description": "Buffer data to be verified"},
                    {"name": "length", "type_name": "size_t", "register_or_location": "%rsi", "description": "Length of buffer in bytes"},
                ],
                "c_prototype": "int verify_payload_checksum(const void *payload, size_t length)",
                "summary": "Computes hash over payload buffer using nested callee routine and verifies checksum.",
                "confidence": 0.90,
                "reasoning": [
                    "Deduced from nested callee routine performing cryptographic hashing",
                    "Passes memory buffer in %rdi and byte size in %rsi to child subroutine",
                    "Checks return value of child transformation to determine validity"
                ],
                "nested_callees_analyzed": ["sha256_transform"]
            }

        # Fallback general stripped function deduction
        return {
            "name": "process_record_buffer",
            "return_type": "int",
            "calling_convention": "System V AMD64",
            "parameters": [
                {"name": "buffer", "type_name": "void*", "register_or_location": "%rdi", "description": "Pointer to target record or memory buffer"},
                {"name": "count", "type_name": "size_t", "register_or_location": "%rsi", "description": "Number of elements or byte length"},
            ],
            "c_prototype": "int process_record_buffer(void *buffer, size_t count)",
            "summary": "Iterates over and processes memory buffer entries based on sequential loop structure.",
            "confidence": 0.75,
            "reasoning": [
                "Disassembly contains loop with index increment in %rsi and base pointer in %rdi",
                "Standard System V AMD64 function prologue and epilogue detected",
                "Returns integer status code in %rax"
            ],
            "nested_callees_analyzed": []
        }
