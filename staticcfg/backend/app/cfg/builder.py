from typing import List, Dict, Set, Optional, Union
from collections import deque
from app.ir.models import Function, Instruction, BasicBlock, CFG, CFGEdge
from app.ir.enums import EdgeType, InstructionType

class CFGBuilder:
    """Deep module for constructing Control Flow Graphs (CFGs) from functions.

    Encapsulates:
    1. Leader instruction detection
    2. Basic block partitioning and terminator detection
    3. Directed edge routing (fallthrough, conditional, unconditional, return, indirect)
    4. Predecessor and successor linking
    5. Cyclomatic complexity calculation (M = E - N + 2P)
    6. Unreachable block detection via reachability traversal
    7. Loop back-edge identification
    """

    def __init__(self, block_engine: Optional[object] = None):
        # Kept for backward compatibility with existing callers
        self._legacy_block_engine = block_engine

    def find_leaders(self, instructions: List[Instruction]) -> Set[int]:
        """Deterministic Basic Block Leader Detection Rules:
        1. First instruction in the function.
        2. Any instruction that is the target of a direct branch inside function bounds.
        3. Any instruction immediately following a branch or return.
        """
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

            # Rule 3: Instruction immediately following a branch or return is a leader
            if inst.is_branch or inst.is_return:
                if idx + 1 < len(instructions):
                    leaders.add(instructions[idx + 1].address)

        return leaders

    def partition(self, function: Function) -> List[BasicBlock]:
        """Partition function instructions into a contiguous list of BasicBlock instances."""
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

    @staticmethod
    def calculate_cyclomatic_complexity(
        nodes: Union[int, List[BasicBlock]],
        edges: Union[int, List[CFGEdge]]
    ) -> int:
        """Calculate Cyclomatic Complexity metric M = E - N + 2P (P=1 for single function)."""
        num_nodes = nodes if isinstance(nodes, int) else len(nodes)
        num_edges = edges if isinstance(edges, int) else len(edges)
        if num_nodes == 0:
            return 1
        complexity = num_edges - num_nodes + 2
        return max(1, complexity)

    @staticmethod
    def find_unreachable_blocks(
        entry_id: str,
        nodes: List[BasicBlock],
        edges: List[CFGEdge]
    ) -> List[str]:
        """Perform BFS traversal from entry block to identify unreachable basic block IDs."""
        if not nodes:
            return []

        node_ids = {node.id for node in nodes}
        if entry_id not in node_ids:
            return sorted(list(node_ids))

        adj: Dict[str, List[str]] = {nid: [] for nid in node_ids}
        for edge in edges:
            if edge.source in adj:
                adj[edge.source].append(edge.target)

        visited: Set[str] = set()
        queue = deque([entry_id])
        visited.add(entry_id)

        while queue:
            curr = queue.popleft()
            for neighbor in adj.get(curr, []):
                if neighbor in node_ids and neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)

        unreachable = [nid for nid in node_ids if nid not in visited]
        return sorted(unreachable)

    @staticmethod
    def mark_back_edges(
        entry_id: str,
        nodes: List[BasicBlock],
        edges: List[CFGEdge]
    ) -> None:
        """Detect and tag natural loop back-edges in CFG without circular dependencies.

        Combines:
        1. Backward address jumps (target block start address <= source block start address)
        2. Depth-First Search cycle detection to ancestor blocks on the active traversal path
        """
        block_map = {b.id: b for b in nodes}
        node_ids = set(block_map.keys())

        adj: Dict[str, List[str]] = {nid: [] for nid in node_ids}
        for edge in edges:
            if edge.source in adj and edge.target in node_ids:
                adj[edge.source].append(edge.target)

        back_edge_pairs: Set[tuple[str, str]] = set()

        # Check backward branch address criteria
        for edge in edges:
            if edge.source in block_map and edge.target in block_map:
                src_b = block_map[edge.source]
                tgt_b = block_map[edge.target]
                if tgt_b.start_address <= src_b.start_address:
                    back_edge_pairs.add((edge.source, edge.target))

        # Check DFS gray-node cycle criteria
        # 0 = unvisited (white), 1 = visiting/ancestor (gray), 2 = completed (black)
        state: Dict[str, int] = {nid: 0 for nid in node_ids}

        def dfs(u: str) -> None:
            state[u] = 1
            for v in adj.get(u, []):
                if state[v] == 1:
                    back_edge_pairs.add((u, v))
                elif state[v] == 0:
                    dfs(v)
            state[u] = 2

        if entry_id in node_ids:
            dfs(entry_id)

        for nid in node_ids:
            if state[nid] == 0:
                dfs(nid)

        for edge in edges:
            if (edge.source, edge.target) in back_edge_pairs:
                edge.is_back_edge = True

    def build_cfg(self, function: Function) -> CFG:
        """Build a fully validated Control Flow Graph from a Function IR model."""
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

        blocks = function.basic_blocks or self.partition(function)
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
        complexity = self.calculate_cyclomatic_complexity(len(blocks), len(edges))
        unreachable = self.find_unreachable_blocks(entry_id, blocks, edges)

        # Mark loop back-edges deterministically without circular imports
        self.mark_back_edges(entry_id, blocks, edges)

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
