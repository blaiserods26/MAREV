import re
from typing import Optional, Tuple, List
from app.ir.enums import InstructionType, RefType
from app.ir.models import Reference

CONDITIONAL_JUMPS = {
    "ja", "jae", "jb", "jbe", "jc", "je", "jg", "jge", "jl", "jle",
    "jna", "jnae", "jnb", "jnbe", "jnc", "jne", "jng", "jnge", "jnl", "jnle",
    "jno", "jnp", "jns", "jnz", "jo", "jp", "jpe", "jpo", "js", "jz",
    "loop", "loope", "loopne"
}

UNCONDITIONAL_JUMPS = {"jmp", "jmpq"}
RETURNS = {"ret", "retq"}
CALLS = {"call", "callq"}
NOPS = {"nop", "nopw", "nopl"}

BRANCH_TARGET_PATTERN = re.compile(r'^(?:0x)?([0-9a-fA-F]+)(?:\s+<([^>]+)>)?$')
SYMBOL_PATTERN = re.compile(r'<([^>]+)>')

def classify_instruction(mnemonic: str, operands: str) -> InstructionType:
    mn = mnemonic.lower()
    op = operands.strip()
    
    if mn in RETURNS:
        return InstructionType.RET
    if mn in NOPS:
        return InstructionType.NOP
    if mn in CALLS:
        if op.startswith('*'):
            return InstructionType.INDIRECT_CALL
        return InstructionType.CALL
    if mn in UNCONDITIONAL_JUMPS:
        if op.startswith('*'):
            return InstructionType.INDIRECT_JUMP
        return InstructionType.UNCOND_BRANCH
    if mn in CONDITIONAL_JUMPS:
        return InstructionType.COND_BRANCH
    return InstructionType.NORMAL

def extract_target_and_references(
    source_address: int, mnemonic: str, operands: str
) -> Tuple[Optional[int], Optional[str], bool, List[Reference]]:
    """Extract target address, target symbol, indirect flag, and references for an instruction."""
    inst_type = classify_instruction(mnemonic, operands)
    op = operands.strip()
    references: List[Reference] = []
    
    if inst_type in (InstructionType.RET, InstructionType.NOP) or not op:
        return None, None, False, references

    is_indirect = op.startswith('*')
    sym_match = SYMBOL_PATTERN.search(op)
    target_symbol: Optional[str] = sym_match.group(1) if sym_match else None

    if is_indirect:
        return None, target_symbol, True, references

    # Parse target address from direct operands
    tokens = op.split()
    first_tok = tokens[0] if tokens else ""
    target_addr: Optional[int] = None
    
    match = BRANCH_TARGET_PATTERN.match(first_tok)
    if match:
        try:
            target_addr = int(match.group(1), 16)
        except ValueError:
            pass
    elif '<' in op:
        prefix = op.split('<')[0].strip()
        match = BRANCH_TARGET_PATTERN.match(prefix)
        if match:
            try:
                target_addr = int(match.group(1), 16)
            except ValueError:
                pass

    if inst_type in (InstructionType.CALL, InstructionType.COND_BRANCH, InstructionType.UNCOND_BRANCH):
        ref_kind = RefType.CALL if inst_type == InstructionType.CALL else RefType.JUMP
        references.append(
            Reference(
                source_address=source_address,
                target_address=target_addr,
                target_symbol=target_symbol,
                ref_type=ref_kind,
                description=f"{mnemonic} {operands}"
            )
        )

    return target_addr, target_symbol, is_indirect, references
