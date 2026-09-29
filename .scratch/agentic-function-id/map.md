# Wayfinder Map: Agentic AI Function & Signature Identification

`wayfinder:map`

## Destination

Replace the unimplemented ML interface with an **Agentic AI Function Identification & Signature Recovery Engine** capable of deducing semantic function names, argument signatures, and explainable summaries for stripped x86-64 binaries using CFG and Call Graph context.

## Notes

- **Domain**: Control Flow Graph (CFG) analysis, x86-64 disassembly, static binary analysis, agentic reverse engineering.
- **Skills**: `grilling`, `domain-modeling`, `codebase-design`.
- **Standing preferences**: Keep deterministic recovery isolated from probabilistic identification; preserve fast offline heuristics for known libc routines; leverage agentic reasoning for unknown/stripped subroutines.

## Decisions so far

<!-- the index: one line per closed ticket, enough to judge relevance, then zoom the link for the detail the ticket holds -->

- [01: Agent LLM Provider and Execution Strategy](file:///c:/Users/blais/Desktop/AI%20Agents/CodetoCFG/.scratch/agentic-function-id/issues/01-agent-execution-environment.md): Pluggable multi-provider interface supporting Google Gemini and OpenAI/Ollama-compatible local endpoints.
- [02: Agent Tool Surface for Function Inspection](file:///c:/Users/blais/Desktop/AI%20Agents/CodetoCFG/.scratch/agentic-function-id/issues/02-agent-tool-surface.md): Deterministic IR tools including disassembly, CFG metrics, XRefs, and explicit recursive nested callee code fetching.
- [03: Pipeline Integration and Cascading Architecture](file:///c:/Users/blais/Desktop/AI%20Agents/CodetoCFG/.scratch/agentic-function-id/issues/03-pipeline-integration-and-cascade.md): On-demand targeted execution triggered per-function from UI to handle huge codebases without latency/cost blowout.
- [04: Function Signature & Semantic Domain Model](file:///c:/Users/blais/Desktop/AI%20Agents/CodetoCFG/.scratch/agentic-function-id/issues/04-signature-schema-and-ir.md): Typed `RecoveredSignature` model with C prototype, parameter locations/types, calling convention, and reasoning.
- [05: Tracer Bullet: End-to-End On-Demand Agent Signature Recovery](file:///c:/Users/blais/Desktop/AI%20Agents/CodetoCFG/.scratch/agentic-function-id/issues/05-tracer-bullet-agent-signature-recovery.md): Complete vertical slice from disassembly to UI delivering on-demand signature and parameter deduction with deterministic inspection tools and pluggable providers.
- [06: Nested Subroutine & Callee Code Exploration](file:///c:/Users/blais/Desktop/AI%20Agents/CodetoCFG/.scratch/agentic-function-id/issues/06-nested-subroutine-callee-exploration.md): Recursive callee traversal and bottom-up semantic composition, enabling accurate identification of wrapper and dispatch functions via child subroutine analysis.



## Not yet specified

- Asynchronous batch processing queue for large binaries with hundreds of functions
- Frontend interactive chat/inspector allowing user to question the agent's signature deduction
- Caching and vector storage of previously analyzed function signatures across binaries


## Out of scope

- Training or fine-tuning local ML/GNN models from scratch (superseded by Agentic AI)
- Dynamic execution / symbolic execution (e.g. QEMU, angr) — this remains pure static analysis
