from enum import Enum

class ArchitectureType(str, Enum):
    X86_64 = "x86-64"
    X86 = "x86"
    ARM64 = "arm64"
    UNKNOWN = "unknown"

class InstructionType(str, Enum):
    NORMAL = "NORMAL"
    COND_BRANCH = "COND_BRANCH"
    UNCOND_BRANCH = "UNCOND_BRANCH"
    CALL = "CALL"
    INDIRECT_CALL = "INDIRECT_CALL"
    RET = "RET"
    INDIRECT_JUMP = "INDIRECT_JUMP"
    DATA = "DATA"
    NOP = "NOP"

class EdgeType(str, Enum):
    FALLTHROUGH = "fallthrough"
    TRUE_BRANCH = "true"
    FALSE_BRANCH = "false"
    UNCOND_JUMP = "jump"
    CALL = "call"
    RETURN = "return"
    INDIRECT = "indirect"
    UNKNOWN = "unknown"

class RefType(str, Enum):
    CALL = "CALL"
    JUMP = "JUMP"
    DATA = "DATA"
    STRING = "STRING"
