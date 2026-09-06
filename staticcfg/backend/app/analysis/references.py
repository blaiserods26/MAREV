import re
from typing import List, Set, Optional
from pydantic import BaseModel, Field
from app.ir.models import Function, Instruction

HEX_CONST_PATTERN = re.compile(r'\$(?:0x)?([0-9a-fA-F]+)\b')
DEC_CONST_PATTERN = re.compile(r'\$(-?\d+)\b')
DISPLACEMENT_ADDR_PATTERN = re.compile(r'(?:0x)?([0-9a-fA-F]+)\(%[a-z0-9]+\)')
STRING_LITERAL_PATTERN = re.compile(r'"([^"\\]*(?:\\.[^"\\]*)*)"')

class ExtractedReferences(BaseModel):
    """Extracted string, constant, address, and call references for a Function."""
    strings: List[str] = Field(default_factory=list)
    constants: List[int] = Field(default_factory=list)
    addresses: List[int] = Field(default_factory=list)
    called_functions: List[str] = Field(default_factory=list)
    imported_apis: List[str] = Field(default_factory=list)

def extract_references(function: Function) -> ExtractedReferences:
    """Extract string literals, numeric constants, memory displacement addresses,

    and call targets/imported APIs from function instructions.
    """
    strings_set: Set[str] = set()
    constants_set: Set[int] = set()
    addresses_set: Set[int] = set()
    calls_set: Set[str] = set()
    imported_apis_set: Set[str] = set()

    for inst in function.instructions:
        op = inst.operands
        comment = inst.comment or ""

        # 1. Direct Calls & PLT Imports
        if inst.is_call:
            callee = inst.target_symbol
            if callee:
                calls_set.add(callee)
                if "@plt" in callee.lower() or callee.startswith(".plt"):
                    imported_apis_set.add(callee)

        # 2. String references (from comment or operands or quotes)
        str_matches = STRING_LITERAL_PATTERN.findall(op) + STRING_LITERAL_PATTERN.findall(comment)
        for s in str_matches:
            if len(s) >= 2:
                strings_set.add(s)

        if comment and "string" in comment.lower():
            strings_set.add(comment)

        # 3. Numeric Constants (immediate operands like $0x40 or $64)
        hex_matches = HEX_CONST_PATTERN.findall(op)
        for h in hex_matches:
            try:
                val = int(h, 16)
                if val not in (0, 1): # Filter out trivial 0 and 1 flags
                    constants_set.add(val)
            except ValueError:
                pass

        dec_matches = DEC_CONST_PATTERN.findall(op)
        for d in dec_matches:
            try:
                val = int(d, 10)
                if abs(val) > 1:
                    constants_set.add(val)
            except ValueError:
                pass

        # 4. Memory Displacement Addresses (e.g. 0x200a12(%rip))
        disp_matches = DISPLACEMENT_ADDR_PATTERN.findall(op)
        for disp in disp_matches:
            try:
                addr = int(disp, 16)
                addresses_set.add(addr)
            except ValueError:
                pass

        if inst.target is not None:
            addresses_set.add(inst.target)

    return ExtractedReferences(
        strings=sorted(list(strings_set)),
        constants=sorted(list(constants_set)),
        addresses=sorted(list(addresses_set)),
        called_functions=sorted(list(calls_set)),
        imported_apis=sorted(list(imported_apis_set))
    )
