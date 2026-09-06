from typing import List, Dict, Optional
from app.cfg.base import BaseCFGBuilder
from app.basic_block.engine import BasicBlockEngine
from app.ir.models import Function, BasicBlock, CFG, CFGEdge
from app.ir.enums import EdgeType, InstructionType
from app.analysis.complexity import calculate_cyclomatic_complexity
from app.analysis.reachability import find_unreachable_blocks

class CFGBuilder(BaseCFGBuilder):
    """CFG Builder constructing directed flow graphs from basic blocks

    with strict CFG correctness rules.
    """

    def __init__(self, block_engine: Optional[BasicBlockEngine] = None):
        self.block_engine = block_engine or BasicBlockEngine()

    def build_cfg(self, function: Function) -> CFG:
        if not function.instructions:
            return CFG(
                function=function.name,
                entry="",
                function_name=function.name,
                entry_block_id="",
                exit_block_ids=[],
                nodes=[],
                edges=[],
                cyclomatic_complexity=1,
                unreachable_blocks=[]
            )

        blocks = function.basic_blocks or self.block_engine.partition(function)
        if not blocks:
            return CFG(
                function=function.name,
                entry="",
                function_name=function.name,
                entry_block_id="",
                exit_block_ids=[],
                nodes=[],
                edges=[],
                cyclomatic_complexity=1,
                unreachable_blocks=[]
            )

        addr_to_block_id: Dict[int, str] = {b.start_address: b.id for b in blocks}

        edges: List[CFGEdge] = []
        exit_block_ids: List[str] = []

        func_start = function.instructions[0].address
        func_end = function.instructions[-1].address

        for idx, block in enumerate(blocks):
            last_inst = block.instructions[-1]
            inst_type = last_inst.instruction_type

            # Rule: Return instruction
            if inst_type == InstructionType.RET:
                edges.append(CFGEdge(source=block.id, target="EXIT", type=EdgeType.RETURN))
                if block.id not in exit_block_ids:
                    exit_block_ids.append(block.id)
                continue

            # Rule: Indirect Jump (never guess target; point to UNKNOWN)
            if inst_type == InstructionType.INDIRECT_JUMP:
                edges.append(CFGEdge(source=block.id, target="UNKNOWN", type=EdgeType.INDIRECT))
                if block.id not in exit_block_ids:
                    exit_block_ids.append(block.id)
                continue

            # Rule: Conditional Jump
            if inst_type == InstructionType.COND_BRANCH:
                # True branch (taken target)
                if last_inst.target is not None and func_start <= last_inst.target <= func_end:
                    target_b = addr_to_block_id.get(last_inst.target)
                    if target_b:
                        edges.append(CFGEdge(source=block.id, target=target_b, type=EdgeType.TRUE_BRANCH))
                else:
                    edges.append(CFGEdge(source=block.id, target="EXIT", type=EdgeType.TRUE_BRANCH))

                # False branch (fallthrough to next sequential block)
                if idx + 1 < len(blocks):
                    next_b = blocks[idx + 1].id
                    edges.append(CFGEdge(source=block.id, target=next_b, type=EdgeType.FALSE_BRANCH))

            # Rule: Unconditional Jump (NO fallthrough edge created after jmp)
            elif inst_type == InstructionType.UNCOND_BRANCH:
                if last_inst.target is not None and func_start <= last_inst.target <= func_end:
                    target_b = addr_to_block_id.get(last_inst.target)
                    if target_b:
                        edges.append(CFGEdge(source=block.id, target=target_b, type=EdgeType.UNCOND_JUMP))
                else:
                    edges.append(CFGEdge(source=block.id, target="EXIT", type=EdgeType.UNCOND_JUMP))
                    if block.id not in exit_block_ids:
                        exit_block_ids.append(block.id)

            # Rule: Normal instruction / Call / Indirect Call (fallthrough to next sequential block)
            else:
                if idx + 1 < len(blocks):
                    next_b = blocks[idx + 1].id
                    edges.append(CFGEdge(source=block.id, target=next_b, type=EdgeType.FALLTHROUGH))

        # Populate predecessors and successors for each basic block
        block_map = {b.id: b for b in blocks}
        # Reset predecessors and successors lists
        for b in blocks:
            b.predecessors = []
            b.successors = []

        for edge in edges:
            if edge.source in block_map:
                if edge.target not in block_map[edge.source].successors:
                    block_map[edge.source].successors.append(edge.target)
            if edge.target in block_map:
                if edge.source not in block_map[edge.target].predecessors:
                    block_map[edge.target].predecessors.append(edge.source)

        entry_id = blocks[0].id
        complexity = calculate_cyclomatic_complexity(len(blocks), len(edges))
        unreachable = find_unreachable_blocks(entry_id, blocks, edges)

        cfg = CFG(
            function=function.name,
            entry=entry_id,
            function_name=function.name,
            entry_block_id=entry_id,
            exit_block_ids=exit_block_ids,
            nodes=blocks,
            edges=edges,
            cyclomatic_complexity=complexity,
            unreachable_blocks=unreachable
        )

        function.basic_blocks = blocks
        function.cfg = cfg
        return cfg
