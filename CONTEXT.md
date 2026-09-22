# StaticCFG

Static analysis platform for x86-64 disassembly recovering function boundaries, deterministic Control Flow Graphs (CFGs), structural graph metrics, and function identities.

## Language

### Control Flow Recovery

**Function**:
A contiguous sequence of instructions within a binary section corresponding to a distinct executable routine, identified by symbol or recovered as a synthetic boundary.
_Avoid_: Subroutine, procedure, routine, method

**Basic Block**:
A maximal linear sequence of instructions with a single entry point and single exit point, with no internal branching.
_Avoid_: Code block, block chunk, node

**Control Flow Graph (CFG)**:
A directed graph of a function whose vertices are basic blocks and directed edges represent valid transfers of control between them.
_Avoid_: Flowchart, execution graph, call graph

**Leader**:
The first instruction of a basic block, determined by entry position, branch target address, or sequential position following a branch or return.
_Avoid_: Head instruction, block start, entry instruction

**Edge**:
A directed transfer of control from a source basic block to a target basic block, classified by branching semantics (fallthrough, conditional true/false, unconditional jump, return, or indirect).
_Avoid_: Link, transition, connection

**Back-Edge**:
A directed edge whose target address is an ancestor in sequential control flow or dominates its source, indicating a loop.
_Avoid_: Loop jump, cycle link, backward jump
