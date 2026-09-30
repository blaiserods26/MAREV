# Research Report: AI Agent-Based Function Name Prediction & Nested Subroutine Extraction

**Date:** 2026-09-30  
**Repository:** StaticCFG (`blaiserods26/MAREV`)  
**Context:** `.scratch/agentic-function-id/`  
**Status:** Findings & Implementation Architecture  

---

## 1. Executive Summary

This research investigates why the AI agent-based function name prediction is currently failing and defines the exact architectural pattern to:
1. Extract and provide the **complete ASM function code** to the AI agent.
2. Recursively detect **nested subroutines (callees)** invoked by the function and extract their complete assembly code, inlining contextual annotations at call sites and appending full callee bodies.
3. Transmit the unified assembly representation to the LLM agent for high-confidence function name and C-signature prediction, ensuring the predicted name immediately updates and displays across the screen (in the Function List sidebar, CFG canvas header, and the Instruction/Analysis Panel).

---

## 2. Root Cause Analysis: Why It Currently Fails

Investigation of primary sources in both backend and frontend revealed four critical failure points:

### Failure Point 1: Backend Startup Crash (`ModuleNotFoundError: No module named 'app.cache'`)
- **Primary Sources:**
  - [`staticcfg/backend/app/main.py:11`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/main.py#L11)
  - [`staticcfg/backend/app/api/upload.py:5`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/api/upload.py#L5)
  - [`staticcfg/backend/app/export_json.py:5`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/export_json.py#L5)
  - [`.gitignore:219`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/.gitignore#L219)
- **Mechanism:**  
  `main.py`, `upload.py`, and `export_json.py` all import `from app.cache.cache_manager import CacheManager`. However, line 219 of root `.gitignore` contains the rule `cache/`. As a result, git completely ignored the `staticcfg/backend/app/cache/` directory during commits.  
  Any invocation of `uv run pytest`, application boot, or file upload aborts immediately with `ModuleNotFoundError: No module named 'app.cache'`.

### Failure Point 2: Frontend State Masking (`analysisReportProp ?? internalReport`)
- **Primary Sources:**
  - [`staticcfg/frontend/src/components/InstructionPanel.tsx:34`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/frontend/src/components/InstructionPanel.tsx#L34)
  - [`staticcfg/frontend/src/components/InstructionPanel.tsx:78-84`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/frontend/src/components/InstructionPanel.tsx#L78-L84)
  - [`staticcfg/frontend/src/pages/Analyzer.tsx:79-84`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/frontend/src/pages/Analyzer.tsx#L79-L84)
- **Mechanism:**  
  In `InstructionPanel.tsx`:
  ```tsx
  const analysisReport = analysisReportProp ?? internalReport;
  ```
  `Analyzer.tsx` passes `analysisReportProp` as a prop. When the user clicks "Analyze with AI Agent", `handleRunAgentIdentification` runs `setInternalReport({ ...analysisReport, identification: updatedIdent })`.
  Because `analysisReportProp` is not null (Analyzer loaded it on selection), `analysisReportProp ?? internalReport` **always evaluates to `analysisReportProp`** and completely discards `internalReport`. The UI never updates on screen. Furthermore, `Analyzer.tsx` is never notified of the newly predicted name, so the parent state remains stale.

### Failure Point 3: In-Memory `CachedAnalysis.functions` Desync
- **Primary Sources:**
  - [`staticcfg/backend/app/function_id/agent/engine.py:163-166`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/function_id/agent/engine.py#L163-L166)
  - [`staticcfg/frontend/src/components/FunctionList.tsx:271-295`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/frontend/src/components/FunctionList.tsx#L271-L295)
- **Mechanism:**  
  When `identify_function` runs, it updates `self.analysis.identifications[resolved_name]`. However, it never updates `self.analysis.functions` (`func_summary.predicted_name`, `confidence`, `semantic_category`).  
  When the frontend re-polls `/functions` or checks the list, `FunctionSummary.predicted_name` is still `null` or unassigned, meaning the sidebar never displays the predicted name badge.

### Failure Point 4: Severe Truncation & Lack of Complete Linear ASM in the Prompt
- **Primary Sources:**
  - [`staticcfg/backend/app/function_id/agent/engine.py:49-68`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/function_id/agent/engine.py#L49-L68)
  - [`staticcfg/backend/app/function_id/agent/tools.py:76-141`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/function_id/agent/tools.py#L76-L141)
- **Mechanism:**  
  The toolset decomposes the target function into basic block text (`Block 0 (0x...) -> [Block 1]: ...`) instead of clean linear disassembly. For nested callees, `fetch_nested_or_callee_code` caps at `max_instructions=35`, and `engine.py` restricts it to:
  ```python
  for b in callee_data.get("blocks", [])[:3]:
      inst_lines.extend(b.get("instructions", [])[:6])
  ```
  This severely truncates nested functions to at most 18 instructions across 3 blocks! Complex child functions (e.g. hashing, AES rounds, decompression, buffer encoders) are clipped so drastically that the AI agent cannot deduce their operational logic.

### Failure Point 5: Provider JSON Schema Omission
- **Primary Sources:**
  - [`staticcfg/backend/app/function_id/agent/providers/gemini.py:43-67`](file:///c:/Users/Blaise%20Rodrigues/Desktop/MAREV/staticcfg/backend/app/function_id/agent/providers/gemini.py#L43-L67)
- **Mechanism:**  
  The system prompt states `Return valid JSON only adhering strictly to the requested schema.`, but no JSON schema is provided in the prompt text, nor is `response_schema` passed in `generationConfig`. The LLM's response format is therefore non-deterministic, frequently breaking `json.loads` or omitting required keys.

---

## 3. Optimal Technical Solution & Design

### Step 1: Complete ASM Function Code Extraction
Instead of presenting fragmented basic block nodes, the agent must receive the **unbroken linear assembly stream** of the target function, sorted by instruction address:
```assembly
0000000000401000 <sub_401000>:
  401000: push   %rbp
  401001: mov    %rsp,%rbp
  401004: mov    %rdi,-0x8(%rbp)
  401008: mov    -0x8(%rbp),%rax
  40100c: movzbl (%rax),%eax
  40100f: test   %al,%al
  401011: je     401025 <sub_401000+0x25>
  401013: mov    -0x8(%rbp),%rax
  401017: lea    0xfe2(%rip),%rsi        # 402000 <_IO_stdin_used+0x4>
  40101e: call   401043 <sub_401043>     # [CALL TO NESTED SUBROUTINE sub_401043]
  401023: jmp    40102a <sub_401000+0x2a>
  401025: mov    $0x0,%eax
  40102a: pop    %rbp
  40102b: ret
```

### Step 2: Nested Function Handling (In-Position Annotation + Appended Full Bodies)
There are two theoretical ways to present nested functions to an LLM:
1. **Direct Macro-Inlining (Replacement in-position):**  
   *Tradeoff:* Replacing `call sub_401043` with the callee instructions directly inside the caller code corrupts stack pointers (`push %rbp`, `leave`, `ret`), clobbers registers, and obscures the function boundary from static analysis.
2. **Call-Site Annotation with Appended Full Bodies (Recommended):**  
   *Tradeoff:* Preserves exact address offsets, stack boundaries, and calling conventions, while giving the LLM the complete callee assembly right below the caller.
   
```markdown
### Target Function Disassembly:
0000000000401000 <sub_401000>:
  401000: push   %rbp
  401001: mov    %rsp,%rbp
  40101e: call   401043 <sub_401043>  ; [Invokes nested subroutine `sub_401043` (see disassembly below)]
  401023: jmp    40102a
  401025: mov    $0x0,%eax
  40102a: pop    %rbp
  40102b: ret

### Nested Subroutine Codes (Callees invoked by sub_401000):
--- Subroutine 1: `sub_401043` (Invoked at 0x40101e) ---
Disassembly:
  401043: push   %rbp
  401044: mov    %rsp,%rbp
  401047: mov    $0x1,%eax
  40104c: pop    %rbp
  40104d: ret
Known Metrics: 1 Basic Block, Cyclomatic Complexity: 1
Referenced Strings: None
Constants: None
```

### Step 3: End-to-End Prediction Pipeline & Screen Display
1. **Prompt Construction:** Unified prompt with:
   - Primary function disassembly (complete, unclipped)
   - Discovered nested functions (complete, unclipped)
   - String literals and constants
   - System V AMD64 register bindings (%rdi, %rsi, %rdx, %rcx, %r8, %r9, %rax)
   - Strict JSON output schema.
2. **Backend Session Synchronization:**
   - Update `self.analysis.identifications[resolved_name]`
   - Update `self.analysis.identifications[cleaned]`
   - Update `self.analysis.functions` summary item with `predicted_name`, `confidence`, and `semantic_category`.
3. **Frontend Synchronous React State Propagation:**
   - In `InstructionPanel.tsx`, maintain an explicit `activeIdentification` state updated on `agentIdentifyFunction()`.
   - Provide an `onFunctionIdentified(updatedIdent)` callback to `Analyzer.tsx`.
   - In `Analyzer.tsx`, update:
     - The function in `functions: FunctionSummary[]`
     - `analysisReport.identification`
     - Cached CFG data if necessary.
   - Result: Both the sidebar `FunctionList`, the top header in `InstructionPanel`, and the `CFGCanvas` header immediately display the predicted function name with confidence and category tags.

---

## 4. Implementation Checklist

- [ ] **Fix Backend Dependency & Cache:**
  - Create `staticcfg/backend/app/cache/cache_manager.py` implementing `CacheManager` with SHA256 hashing and cached analysis read/write.
  - Create `staticcfg/backend/app/cache/__init__.py`.
  - Update `.gitignore` to allow tracking `staticcfg/backend/app/cache/`.
- [ ] **Deepen Assembly Extraction for Target and Nested Functions:**
  - In `staticcfg/backend/app/function_id/agent/tools.py`:
    - Add `get_complete_function_asm(func_name)`: generates clean, contiguous linear disassembly.
    - Enhance `fetch_nested_or_callee_code`: extract full callee instructions (up to 200 instructions, not 35).
    - Annotate call sites in the target assembly pointing to nested subroutines.
  - In `staticcfg/backend/app/function_id/agent/engine.py`:
    - Format complete ASM of both target function and all child subroutines into the LLM prompt.
    - Synchronize `self.analysis.functions` with `predicted_name` and `confidence`.
- [ ] **Enforce JSON Schema Across Providers:**
  - Update `GoogleGeminiProvider` to explicitly embed the JSON schema in the system prompt and add fallback markdown codeblock stripping (`re.sub(r"^```json\s*", ...)`).
- [ ] **Fix Frontend UI Display & React State Propagation:**
  - In `InstructionPanel.tsx`, ensure local state takes precedence over static props and call an `onIdentificationUpdated` callback.
  - In `Analyzer.tsx`, update `functions` state so the sidebar updates in real-time.
- [ ] **Verify End-to-End Suite:**
  - Run full test suite with `py -3.12 -m uv run pytest`.
  - Validate with sample disassembly binary.
