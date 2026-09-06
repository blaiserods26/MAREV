from typing import List, Set, Dict
from app.basic_block.base import BaseBasicBlockEngine
from app.ir.models import Function, Instruction, BasicBlock
from app.ir.enums import InstructionType

class BasicBlockEngine(BaseBasicBlockEngine):
    """Deterministic Basic Block Leader Detection & Partitioning Engine.

    Leader Detection Rules:
    1. First instruction in the function.
    2. Any instruction that is the target of a direct jump (conditional or unconditional) inside the function.
    3. Any instruction immediately following a branch (conditional/unconditional jump) or return.
    """

    def find_leaders(self, instructions: List[Instruction]) -> Set[int]:
        if not instructions:
            return set()

        leaders: Set[int] = {instructions[0].address}
        func_start = instructions[0].address
        func_end = instructions[-1].address

        for idx, inst in enumerate(instructions):
            # Rule 2: Target of direct branch inside function bounds is a leader
            if (inst.is_conditional or inst.is_unconditional) and inst.target is not None:
                if func_start <= inst.target <= func_end:
                    leaders.add(inst.target)

            # Rule 3: Instruction immediately following a branch (cond/uncond/indirect jump) or return is a leader
            if inst.is_branch or inst.is_return:
                if idx + 1 < len(instructions):
                    leaders.add(instructions[idx + 1].address)

        return leaders

    def partition(self, function: Function) -> List[BasicBlock]:
        instructions = function.instructions
        if not instructions:
            return []

        leaders = self.find_leaders(instructions)
        addr_to_idx: Dict[int, int] = {inst.address: idx for idx, inst in enumerate(instructions)}

        sorted_leader_addrs = sorted(
            [addr for addr in leaders if addr in addr_to_idx],
            key=lambda a: addr_to_idx[a]
        )

        blocks: List[BasicBlock] = []

        for b_idx, start_addr in enumerate(sorted_leader_addrs):
            start_i = addr_to_idx[start_addr]
            if b_idx + 1 < len(sorted_leader_addrs):
                next_start_addr = sorted_leader_addrs[b_idx + 1]
                end_i = addr_to_idx[next_start_addr] - 1
            else:
                end_i = len(instructions) - 1

            block_insts = instructions[start_i: end_i + 1]
            if not block_insts:
                continue

            end_addr = block_insts[-1].address
            block_id = f"B{b_idx}"
            terminator = block_insts[-1].instruction_type if block_insts else None

            blocks.append(
                BasicBlock(
                    id=block_id,
                    start_address=start_addr,
                    end_address=end_addr,
                    instructions=block_insts,
                    terminator_type=terminator
                )
            )

        return blocks
