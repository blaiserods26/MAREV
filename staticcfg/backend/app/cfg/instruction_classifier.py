from app.models.schemas import Instruction

CONDITIONAL_JUMPS = {
    "ja", "jae", "jb", "jbe", "jc", "je", "jg", "jge", "jl", "jle",
    "jna", "jnae", "jnb", "jnbe", "jnc", "jne", "jng", "jnge", "jnl", "jnle",
    "jno", "jnp", "jns", "jnz", "jo", "jp", "jpe", "jpo", "js", "jz",
    "loop", "loope", "loopne"
}

UNCONDITIONAL_JUMPS = {"jmp", "jmpq"}

RETURNS = {"ret", "retq"}

CALLS = {"call", "callq"}

def is_conditional_jump(mnemonic: str) -> bool:
    return mnemonic.lower() in CONDITIONAL_JUMPS

def is_unconditional_jump(mnemonic: str) -> bool:
    return mnemonic.lower() in UNCONDITIONAL_JUMPS

def is_jump(mnemonic: str) -> bool:
    mn = mnemonic.lower()
    return mn in CONDITIONAL_JUMPS or mn in UNCONDITIONAL_JUMPS

def is_return(mnemonic: str) -> bool:
    return mnemonic.lower() in RETURNS

def is_call(mnemonic: str) -> bool:
    return mnemonic.lower() in CALLS

def is_control_flow(mnemonic: str) -> bool:
    mn = mnemonic.lower()
    return mn in CONDITIONAL_JUMPS or mn in UNCONDITIONAL_JUMPS or mn in RETURNS or mn in CALLS
