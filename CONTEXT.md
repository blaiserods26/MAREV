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

### Function Identification & Semantic Recovery

**Recovered Signature**:
A deduced high-level C-style specification for a stripped function, comprising a semantic name, return type, parameter list, calling convention, and explanatory rationale.
_Avoid_: Guessed signature, predicted type, function header

**Parameter Signature**:
A deduced function argument specifying an identified name, semantic data type, physical register or stack binding, and operational purpose.
_Avoid_: Argument slot, param, input register

**Nested Callee Context**:
The structural and semantic properties (disassembly, basic blocks, known signatures) of a subroutine invoked from within an analyzed function, inspected recursively to deduce caller semantics.
_Avoid_: Child function code, subcall snippet, helper code

### IDE Extension & Code Recovery

**Enclosing Function Boundary**:
The detected syntactic span (start and end line/offset) containing the user's active cursor or selection within a source or assembly buffer.
_Avoid_: Outer block, containing snippet, selection parent

**Editor Writeback**:
The programmatic modification of the active text document in the IDE to apply recovered identifiers (e.g., renaming a symbol) or inject semantic documentation (e.g., Doxygen prototypes).
_Avoid_: Code patching, auto-edit, buffer overwrite


