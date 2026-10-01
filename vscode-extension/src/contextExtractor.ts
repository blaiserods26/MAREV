import { CalleeContext, ExtractedContext } from './types';

const C_KEYWORDS = new Set([
  'if', 'else', 'for', 'while', 'do', 'switch', 'case', 'default',
  'return', 'sizeof', 'typeof', 'typedef', 'struct', 'union', 'enum',
  'static', 'inline', 'extern', 'const', 'volatile', 'auto', 'register'
]);

export function extractFunctionContext(
  lines: string[],
  cursorLine: number,
  languageId: string,
  selectionStart?: number,
  selectionEnd?: number
): ExtractedContext {
  const isAsm = languageId.includes('asm') || languageId.includes('assembly') || languageId === 's';

  if (isAsm) {
    return extractAsmFunctionContext(lines, cursorLine, languageId, selectionStart, selectionEnd);
  } else {
    return extractCFunctionContext(lines, cursorLine, languageId, selectionStart, selectionEnd);
  }
}

function extractCFunctionContext(
  lines: string[],
  cursorLine: number,
  languageId: string,
  selectionStart?: number,
  selectionEnd?: number
): ExtractedContext {
  // If user provided a multi-line selection that already has balanced braces, use it directly
  if (
    selectionStart !== undefined &&
    selectionEnd !== undefined &&
    selectionEnd > selectionStart
  ) {
    const selectedText = lines.slice(selectionStart, selectionEnd + 1).join('\n');
    const funcMatch = selectedText.match(/\b([a-zA-Z_]\w*)\s*\([^)]*\)\s*\{/);
    if (funcMatch) {
      const funcName = funcMatch[1];
      const callees = extractCalleesFromCode(selectedText, lines, funcName);
      return {
        targetCode: selectedText,
        languageId,
        functionName: funcName,
        isEnclosing: true,
        startLine: selectionStart,
        endLine: selectionEnd,
        callees
      };
    }
  }

  // Scan upwards to find the function header with opening brace '{'
  let headerLine = -1;
  let funcName = '';
  const searchLimit = Math.max(0, cursorLine - 300);

  for (let i = cursorLine; i >= searchLimit; i--) {
    const line = lines[i];
    // Check if line contains function declaration/definition
    // e.g. int func_name(...) { or void func_name(...)
    const match = line.match(/(?:^|\s+)([a-zA-Z_]\w*)\s*\([^;{()]*\)\s*(?:\{|\s*$)/);
    if (match) {
      const candidateName = match[1];
      if (!C_KEYWORDS.has(candidateName)) {
        headerLine = i;
        funcName = candidateName;
        break;
      }
    }
  }

  if (headerLine === -1) {
    // Fall back to selection or cursor line
    const start = selectionStart ?? cursorLine;
    const end = selectionEnd ?? cursorLine;
    const fallbackText = lines.slice(start, end + 1).join('\n');
    return {
      targetCode: fallbackText,
      languageId,
      functionName: undefined,
      isEnclosing: false,
      startLine: start,
      endLine: end,
      callees: []
    };
  }

  // Find the opening brace '{' starting from headerLine
  let openBraceLine = -1;
  let openBraceCol = -1;

  for (let i = headerLine; i < lines.length; i++) {
    const col = lines[i].indexOf('{');
    if (col !== -1) {
      openBraceLine = i;
      openBraceCol = col;
      break;
    }
    // If we hit a semicolon before an opening brace, it's just a prototype, not definition
    if (lines[i].includes(';')) {
      break;
    }
  }

  if (openBraceLine === -1) {
    const start = selectionStart ?? cursorLine;
    const end = selectionEnd ?? cursorLine;
    return {
      targetCode: lines.slice(start, end + 1).join('\n'),
      languageId,
      functionName: funcName || undefined,
      isEnclosing: false,
      startLine: start,
      endLine: end,
      callees: []
    };
  }

  // Count braces forward to find endLine
  let braceDepth = 0;
  let endLine = openBraceLine;

  for (let i = openBraceLine; i < lines.length; i++) {
    const line = lines[i];
    const startCol = (i === openBraceLine) ? openBraceCol : 0;

    for (let c = startCol; c < line.length; c++) {
      const char = line[c];
      if (char === '{') {
        braceDepth++;
      } else if (char === '}') {
        braceDepth--;
        if (braceDepth === 0) {
          endLine = i;
          break;
        }
      }
    }

    if (braceDepth === 0) {
      break;
    }
  }

  const enclosingCode = lines.slice(headerLine, endLine + 1).join('\n');
  const callees = extractCalleesFromCode(enclosingCode, lines, funcName);

  return {
    targetCode: enclosingCode,
    languageId,
    functionName: funcName,
    isEnclosing: true,
    startLine: headerLine,
    endLine,
    callees
  };
}

function extractAsmFunctionContext(
  lines: string[],
  cursorLine: number,
  languageId: string,
  selectionStart?: number,
  selectionEnd?: number
): ExtractedContext {
  // Scan upwards for label
  let labelLine = -1;
  let funcName = '';
  const searchLimit = Math.max(0, cursorLine - 500);

  for (let i = cursorLine; i >= searchLimit; i--) {
    const line = lines[i].trim();
    // objdump style: 0000000000401120 <func_name>: or label:
    const objdumpMatch = line.match(/^[0-9a-fA-F]+\s+<([a-zA-Z0-9_]+)>:/);
    if (objdumpMatch) {
      labelLine = i;
      funcName = objdumpMatch[1];
      break;
    }
    const labelMatch = line.match(/^([a-zA-Z_?.][a-zA-Z0-9_?.$@]*):/);
    if (labelMatch) {
      labelLine = i;
      funcName = labelMatch[1];
      break;
    }
  }

  if (labelLine === -1) {
    const start = selectionStart ?? cursorLine;
    const end = selectionEnd ?? cursorLine;
    return {
      targetCode: lines.slice(start, end + 1).join('\n'),
      languageId,
      functionName: undefined,
      isEnclosing: false,
      startLine: start,
      endLine: end,
      callees: []
    };
  }

  // Scan downwards for ret or endproc or next label
  let endLine = labelLine;
  for (let i = labelLine + 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (/\b(?:retq?|repz\s+retq?|iretq?)\b/.test(line)) {
      endLine = i;
      break;
    }
    // If another label starts before ret, cut off before that label
    if (i > labelLine + 1 && (/^[0-9a-fA-F]+\s+<[a-zA-Z0-9_]+>:/i.test(line) || /^[a-zA-Z_?.][a-zA-Z0-9_?.$@]*:/.test(line))) {
      endLine = i - 1;
      break;
    }
    endLine = i;
  }

  const asmCode = lines.slice(labelLine, endLine + 1).join('\n');
  const callees = extractAsmCallees(asmCode, lines, funcName);

  return {
    targetCode: asmCode,
    languageId,
    functionName: funcName,
    isEnclosing: true,
    startLine: labelLine,
    endLine,
    callees
  };
}

function extractCalleesFromCode(code: string, allLines: string[], selfName: string): CalleeContext[] {
  const callees: CalleeContext[] = [];
  const seen = new Set<string>();
  if (selfName) seen.add(selfName);

  // Match function calls: name(...)
  const callRegex = /\b([a-zA-Z_]\w*)\s*\(/g;
  let match: RegExpExecArray | null;

  while ((match = callRegex.exec(code)) !== null) {
    const name = match[1];
    if (C_KEYWORDS.has(name) || seen.has(name)) continue;
    seen.add(name);

    // Search allLines for definition of name
    const def = findCFunctionDefinition(name, allLines);
    if (def) {
      callees.push(def);
      if (callees.length >= 5) break; // Limit to 5 nested callees
    }
  }

  return callees;
}

function findCFunctionDefinition(funcName: string, lines: string[]): CalleeContext | null {
  const targetRegex = new RegExp(`\\b${funcName}\\s*\\([^;{()]*\\)\\s*\\{`);
  for (let i = 0; i < lines.length; i++) {
    if (targetRegex.test(lines[i])) {
      // Extract up to 30 lines of callee definition
      let depth = 0;
      let end = i;
      for (let j = i; j < Math.min(lines.length, i + 40); j++) {
        for (const char of lines[j]) {
          if (char === '{') depth++;
          if (char === '}') {
            depth--;
            if (depth === 0) {
              end = j;
              break;
            }
          }
        }
        if (depth === 0 && j > i) break;
        end = j;
      }
      return {
        name: funcName,
        line: i,
        code: lines.slice(i, end + 1).join('\n')
      };
    }
  }
  return null;
}

function extractAsmCallees(asmCode: string, allLines: string[], selfName: string): CalleeContext[] {
  const callees: CalleeContext[] = [];
  const seen = new Set<string>();
  if (selfName) seen.add(selfName);

  // Match calls: call helper or callq 0x401050 <helper>
  const callRegex = /\bcallq?\s+([a-zA-Z0-9_.*+<>]+)/gi;
  let match: RegExpExecArray | null;

  while ((match = callRegex.exec(asmCode)) !== null) {
    let target = match[1].trim();
    const bracketMatch = target.match(/<([a-zA-Z0-9_]+)>/);
    if (bracketMatch) {
      target = bracketMatch[1];
    }
    if (seen.has(target)) continue;
    seen.add(target);

    // Search allLines for target label
    for (let i = 0; i < allLines.length; i++) {
      const line = allLines[i].trim();
      if (line.startsWith(target + ':') || line.includes('<' + target + '>:')) {
        let end = i;
        for (let j = i + 1; j < Math.min(allLines.length, i + 35); j++) {
          if (/\b(?:retq?|repz\s+retq?)\b/.test(allLines[j])) {
            end = j;
            break;
          }
          end = j;
        }
        callees.push({
          name: target,
          line: i,
          code: allLines.slice(i, end + 1).join('\n')
        });
        break;
      }
    }
    if (callees.length >= 5) break;
  }

  return callees;
}
