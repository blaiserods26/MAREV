# 02: Agent Tool Surface for Function Inspection

Type: grilling
Status: resolved
Blocked by: None

## Question

What deterministic inspection tools should the reverse-engineering agent have access to when analyzing a stripped function?
Examples:
1. `get_function_disassembly(func_name)`: Raw x86-64 instructions and operands.
2. `get_cfg_metrics(func_name)`: Basic blocks, edges, cyclomatic complexity, loops, dominators.
3. `get_call_graph_xrefs(func_name)`: Inbound callers and outbound callees.
4. `get_string_and_constant_refs(func_name)`: Data section string references and numeric constants.
5. `inspect_neighbor_function(func_name)`: Context on adjacent routines in `.text`.

## Answer

**Decision: Rich deterministic IR tools with nested callee exploration**
The agent will have programmatic tool/function-calling access to:
1. `get_function_disassembly(func_name)`: Basic-block partitioned instructions, mnemonics, operands, branch targets.
2. `get_cfg_metrics(func_name)`: Cyclomatic complexity, block count, loop count, back-edges, and topological flow.
3. `get_call_graph_xrefs(func_name)`: Inbound callers (who calls this) and outbound callees (what this calls).
4. `fetch_nested_or_callee_code(callee_name)`: Explicit capability to pull disassembly and summary of any nested/called subroutine, enabling bottom-up semantic composition (e.g. if `sub_A` calls `sub_B` which is identified as an HMAC step, `sub_A` can be deduced as token validation).
5. `get_string_and_constant_refs(func_name)`: Data section string literals and immediate constants.

