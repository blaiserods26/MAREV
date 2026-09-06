from typing import List, Set, Dict
from app.models.schemas import Function, BasicBlock, Instruction
from app.cfg.leader import find_leaders

def partition_basic_blocks(function: Function) -> List[BasicBlock]:
    """
    Partition instructions of a function into basic blocks using leader set.
    """
    instructions = function.instructions
    if not instructions:
        return []

    leaders = find_leaders(function)
    blocks: List[BasicBlock] = []
    current_insts: List[Instruction] = []
    block_index = 0

    for inst in instructions:
        # If this instruction is a leader and we already have accumulated instructions, finish current block
        if inst.address in leaders and current_insts:
            b_id = f"B{block_index}"
            start_addr = current_insts[0].address
            end_addr = current_insts[-1].address
            blocks.append(BasicBlock(
                id=b_id,
                start_address=start_addr,
                end_address=end_addr,
                instructions=current_insts
            ))
            block_index += 1
            current_insts = []

        current_insts.append(inst)

    # Add final block
    if current_insts:
        b_id = f"B{block_index}"
        start_addr = current_insts[0].address
        end_addr = current_insts[-1].address
        blocks.append(BasicBlock(
            id=b_id,
            start_address=start_addr,
            end_address=end_addr,
            instructions=current_insts
        ))

    return blocks
