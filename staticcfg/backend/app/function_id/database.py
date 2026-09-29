from typing import List, Dict, Optional, Set
from pydantic import BaseModel, Field
from app.function_id.models import SemanticCategory

class KnownFunctionSignature(BaseModel):
    """Signature template for a known library or common binary pattern."""
    name: str
    category: SemanticCategory
    description: str
    expected_api_calls: List[str] = Field(default_factory=list)
    expected_string_keywords: List[str] = Field(default_factory=list)
    expected_constants: List[int] = Field(default_factory=list)
    mnemonic_patterns: List[str] = Field(default_factory=list) # e.g. ["repne scasb", "repe cmpsb"]
    min_instructions: int = 1
    max_instructions: int = 10000
    has_loops: Optional[bool] = None
    min_cyclomatic_complexity: int = 1

class SignatureDatabase:
    """In-memory database of known signatures and library function profiles."""
    def __init__(self) -> None:
        self.signatures: List[KnownFunctionSignature] = []
        self._load_default_signatures()

    def add_signature(self, sig: KnownFunctionSignature) -> None:
        self.signatures.append(sig)

    def get_signatures_by_category(self, cat: SemanticCategory) -> List[KnownFunctionSignature]:
        return [s for s in self.signatures if s.category == cat]

    def _load_default_signatures(self) -> None:
        defaults = [
            KnownFunctionSignature(
                name="strlen",
                category=SemanticCategory.STRING_PROCESSING,
                description="Standard C strlen implementation or inline string length loop",
                mnemonic_patterns=["repne scasb"],
                min_instructions=2,
                max_instructions=25,
            ),
            KnownFunctionSignature(
                name="strcmp",
                category=SemanticCategory.STRING_PROCESSING,
                description="Standard C strcmp implementation or inline string compare loop",
                mnemonic_patterns=["repe cmpsb"],
                min_instructions=2,
                max_instructions=30,
            ),
            KnownFunctionSignature(
                name="strcpy",
                category=SemanticCategory.STRING_PROCESSING,
                description="Standard C strcpy implementation",
                mnemonic_patterns=["movsb", "rep movsb"],
                min_instructions=2,
                max_instructions=35,
            ),
            KnownFunctionSignature(
                name="memcpy",
                category=SemanticCategory.MEMORY_MANAGEMENT,
                description="Standard memory copy function",
                mnemonic_patterns=["rep movsb", "rep movsd", "rep movsq"],
                min_instructions=2,
                max_instructions=40,
            ),
            KnownFunctionSignature(
                name="memset",
                category=SemanticCategory.MEMORY_MANAGEMENT,
                description="Standard memory set function",
                mnemonic_patterns=["rep stosb", "rep stosd", "rep stosq"],
                min_instructions=2,
                max_instructions=40,
            ),
            KnownFunctionSignature(
                name="malloc",
                category=SemanticCategory.MEMORY_MANAGEMENT,
                description="Memory allocation routine",
                expected_api_calls=["mmap", "brk", "sbrk"],
                min_instructions=5,
            ),
            KnownFunctionSignature(
                name="free",
                category=SemanticCategory.MEMORY_MANAGEMENT,
                description="Memory deallocation routine",
                expected_api_calls=["munmap"],
                min_instructions=3,
            ),
            KnownFunctionSignature(
                name="validate_password",
                category=SemanticCategory.VALIDATION,
                description="Authentication / password validation logic",
                expected_string_keywords=["password", "access", "login", "granted", "denied", "valid", "invalid", "auth", "secret"],
                expected_api_calls=["strcmp", "strncmp", "memcmp"],
                has_loops=False,
                min_cyclomatic_complexity=1,
            ),
            KnownFunctionSignature(
                name="validate_credentials",
                category=SemanticCategory.VALIDATION,
                description="Credential checking logic",
                expected_string_keywords=["password", "user", "auth", "login"],
                expected_api_calls=["strcmp", "strncmp"],
                min_cyclomatic_complexity=1,
            ),
            KnownFunctionSignature(
                name="sha256_transform",
                category=SemanticCategory.CRYPTOGRAPHY,
                description="SHA-256 compression function or cryptographic constant user",
                expected_constants=[0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19],
                min_instructions=20,
            ),
            KnownFunctionSignature(
                name="crc32_calc",
                category=SemanticCategory.CRYPTOGRAPHY,
                description="CRC32 checksum calculation",
                expected_constants=[0xedb88320, 0x04c11db7],
                has_loops=True,
            ),
            KnownFunctionSignature(
                name="socket_connect",
                category=SemanticCategory.NETWORKING,
                description="Network socket creation or connection function",
                expected_api_calls=["socket", "connect", "htons", "inet_addr"],
                expected_string_keywords=["http", "https", "socket", "port", "host", "connection"],
            ),
            KnownFunctionSignature(
                name="file_read_handler",
                category=SemanticCategory.FILE_IO,
                description="File open/read/write processing loop",
                expected_api_calls=["fopen", "fread", "fwrite", "fclose", "open", "read", "write"],
                expected_string_keywords=["file", "read", "write", "open", "error opening"],
            ),
            KnownFunctionSignature(
                name="json_parse",
                category=SemanticCategory.PARSING,
                description="Parser or tokenizer routine",
                expected_string_keywords=["parse", "token", "syntax error", "unexpected character"],
                has_loops=True,
                min_cyclomatic_complexity=3,
            ),
            KnownFunctionSignature(
                name="handle_error",
                category=SemanticCategory.ERROR_HANDLING,
                description="Error reporting or termination handler",
                expected_api_calls=["exit", "abort", "perror", "fprintf"],
                expected_string_keywords=["error", "fatal", "failed", "invalid", "panic", "exception"],
            ),
        ]
        for sig in defaults:
            self.add_signature(sig)
