from typing import List, Optional, Dict
from app.models.schemas import BasicBlock, CFGEdge, Instruction
from app.cfg.instruction_classifier import is_conditional_jump, is_unconditional_jump, is_return, is_call

def find_block_for_address(address: int, blocks: List[BasicBlock]) -> Optional[BasicBlock]:
    """
    Find basic block containing or starting with address.
    Priority given to block starting at address.
    """
    for block in blocks:
        if block.start_address == address:
            return block
    for block in blocks:
        if block.start_address <= address <= block.end_address:
            return block
    return None

def build_cfg_edges(blocks: List[BasicBlock]) -> List[CFGEdge]:
    """
    Construct CFG edges between basic blocks according to control flow instructions.
    """
    edges: List[CFGEdge] = []
    if not blocks:
        return edges

    # Address to block map
    addr_to_block: Dict[int, BasicBlock] = {}
    for b in blocks:
        addr_to_block[b.start_address] = b

    for i, block in enumerate(blocks):
        if not block.instructions:
            continue

        last_inst = block.instructions[-1]
        mn = last_inst.mnemonic

        if is_conditional_jump(mn):
            # True branch
            if last_inst.target is not None:
                target_block = find_block_for_address(last_inst.target, blocks)
                target_id = target_block.id if target_block else f"EXTERNAL_0x{last_inst.target:x}"
                edges.append(CFGEdge(source=block.id, target=target_id, type="true"))
            elif last_inst.is_indirect:
                edges.append(CFGEdge(source=block.id, target="UNKNOWN", type="indirect"))
            else:
                edges.append(CFGEdge(source=block.id, target="UNKNOWN", type="unknown"))

            # False branch (fallthrough)
            if i + 1 < len(blocks):
                edges.append(CFGEdge(source=block.id, target=blocks[i + 1].id, type="false"))

        elif is_unconditional_jump(mn):
            if last_inst.target is not None:
                target_block = find_block_for_address(last_inst.target, blocks)
                target_id = target_block.id if target_block else f"EXTERNAL_0x{last_inst.target:x}"
                edges.append(CFGEdge(source=block.id, target=target_id, type="jump"))
            elif last_inst.is_indirect:
                edges.append(CFGEdge(source=block.id, target="UNKNOWN", type="indirect"))
            else:
                edges.append(CFGEdge(source=block.id, target="UNKNOWN", type="unknown"))

        elif is_return(mn):
            edges.append(CFGEdge(source=block.id, target="EXIT", type="return"))

        else:
            # Normal instruction or call -> fallthrough to next block
            if i + 1 < len(blocks):
                edges.append(CFGEdge(source=block.id, target=blocks[i + 1].id, type="fallthrough"))

    return edges
