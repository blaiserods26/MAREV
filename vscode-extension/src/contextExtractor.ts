import { CalleeContext, ExtractedContext } from './types';

const C_KEYWORDS = new Set([
  'if', 'else', 'for', 'while', 'do', 'switch', 'case', 'default',
  'return', 'sizeof', 'typeof', 'typedef', 'struct', 'union', 'enum',
  'static', 'inline', 'extern', 'const', 'volatile', 'auto', 'register',
  'catch', 'try', 'throw', 'alignas', 'alignof', 'decltype', 'template',
  'typename', 'namespace', 'using', 'public', 'private', 'protected'
]);

export function isStrippedFunctionName(name: string): boolean {
  return /^(FUN_|sub_|_sub_|func_|_func_|f\d+$|subroutine_)/i.test(name) || /^[a-f0-9]{6,}$/i.test(name);
}

export function stripCommentsFromLines(lines: string[]): string[] {
  let inMultiComment = false;
  const result: string[] = [];

  for (const line of lines) {
    let cleaned = '';
    let j = 0;
    while (j < line.length) {
      if (inMultiComment) {
        const endIdx = line.indexOf('*/', j);
        if (endIdx === -1) {
          cleaned += ' '.repeat(line.length - j);
          j = line.length;
        } else {
          cleaned += ' '.repeat(endIdx + 2 - j);
          inMultiComment = false;
          j = endIdx + 2;
        }
      } else {
        if (line.slice(j, j + 2) === '/*') {
          inMultiComment = true;
          cleaned += '  ';
          j += 2;
        } else if (line.slice(j, j + 2) === '//') {
          cleaned += ' '.repeat(line.length - j);
          break;
        } else {
          cleaned += line[j];
          j++;
        }
      }
    }
    result.push(cleaned);
  }

  return result;
}

export function findMatchingBraceEnd(lines: string[], openBraceLine: number, openBraceCol: number): number {
  let braceDepth = 0;
  let endLine = openBraceLine;
  let inStr = false;
  let inChar = false;
  let inComm = false;

  for (let i = openBraceLine; i < lines.length; i++) {
    const line = lines[i];
    const startCol = i === openBraceLine ? openBraceCol : 0;

    for (let c = startCol; c < line.length; c++) {
      const ch = line[c];
      const nextCh = c + 1 < line.length ? line[c + 1] : '';

      if (inComm) {
        if (ch === '*' && nextCh === '/') {
          inComm = false;
          c++;
        }
      } else if (inStr) {
        if (ch === '\\') {
          c++;
        } else if (ch === '"') {
          inStr = false;
        }
      } else if (inChar) {
        if (ch === '\\') {
          c++;
        } else if (ch === "'") {
          inChar = false;
        }
      } else {
        if (ch === '/' && nextCh === '*') {
          inComm = true;
          c++;
        } else if (ch === '/' && nextCh === '/') {
          break; // Rest of line is comment
        } else if (ch === '"') {
          inStr = true;
        } else if (ch === "'") {
          inChar = true;
        } else if (ch === '{') {
          braceDepth++;
        } else if (ch === '}') {
          braceDepth--;
          if (braceDepth === 0) {
            endLine = i;
            return endLine;
          }
        }
      }
    }

    if (braceDepth === 0 && i >= openBraceLine) {
      return i;
    }
  }

  return endLine;
}

export function extractAllFunctionsInDocument(
  lines: string[],
  languageId: string,
  onlyStripped: boolean = false
): ExtractedContext[] {
  const isAsm = languageId.includes('asm') || languageId.includes('assembly') || languageId === 's';
  const functions: ExtractedContext[] = [];

  if (isAsm) {
    let lineIdx = 0;
    while (lineIdx < lines.length) {
      const line = lines[lineIdx].trim();
      let labelMatch = line.match(/^[0-9a-fA-F]+\s+<([a-zA-Z0-9_]+)>:/);
      if (!labelMatch) {
        labelMatch = line.match(/^([a-zA-Z_?.][a-zA-Z0-9_?.$@]*):/);
      }

      if (labelMatch) {
        const funcName = labelMatch[1];
        if (!onlyStripped || isStrippedFunctionName(funcName)) {
          const ctx = extractAsmFunctionContext(lines, lineIdx, languageId);
          if (ctx.isEnclosing && ctx.functionName) {
            functions.push(ctx);
            lineIdx = ctx.endLine + 1;
            continue;
          }
        }
      }
      lineIdx++;
    }
  } else {
    const cleanLines = stripCommentsFromLines(lines);
    let lineIdx = 0;
    while (lineIdx < cleanLines.length) {
      const line = cleanLines[lineIdx];

      // Match C/C++ function signature: identifier before (
      const match = line.match(/(?:^|[\s*&])([a-zA-Z_]\w*(?:::[a-zA-Z_]\w*)*)\s*\([^;{()]*\)\s*(?:\{|\s*$)/);
      if (match) {
        const rawName = match[1];
        const nameParts = rawName.split('::');
        const candidateName = nameParts[nameParts.length - 1];

        if (!C_KEYWORDS.has(candidateName) && !C_KEYWORDS.has(rawName)) {
          if (!onlyStripped || isStrippedFunctionName(candidateName)) {
            let foundBrace = false;
            for (let k = lineIdx; k < Math.min(cleanLines.length, lineIdx + 8); k++) {
              if (cleanLines[k].includes('{')) {
                foundBrace = true;
                break;
              }
              if (cleanLines[k].includes(';')) break;
            }

            if (foundBrace) {
              const ctx = extractCFunctionContext(lines, lineIdx, languageId, undefined, undefined, cleanLines);
              if (ctx.isEnclosing && ctx.functionName) {
                functions.push(ctx);
                lineIdx = ctx.endLine + 1;
                continue;
              }
            }
          }
        }
      }
      lineIdx++;
    }
  }

  return functions;
}

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
  selectionEnd?: number,
  providedCleanLines?: string[]
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

  const cleanLines = providedCleanLines || stripCommentsFromLines(lines);

  // Scan upwards in cleanLines to find the function header
  let headerLine = -1;
  let funcName = '';
  const searchLimit = Math.max(0, cursorLine - 300);

  for (let i = cursorLine; i >= searchLimit; i--) {
    const line = cleanLines[i];
    const match = line.match(/(?:^|[\s*&])([a-zA-Z_]\w*(?:::[a-zA-Z_]\w*)*)\s*\([^;{()]*\)\s*(?:\{|\s*$)/);
    if (match) {
      const rawName = match[1];
      const nameParts = rawName.split('::');
      const candidateName = nameParts[nameParts.length - 1];
      if (!C_KEYWORDS.has(candidateName) && !C_KEYWORDS.has(rawName)) {
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

  for (let i = headerLine; i < cleanLines.length; i++) {
    const col = cleanLines[i].indexOf('{');
    if (col !== -1) {
      openBraceLine = i;
      openBraceCol = col;
      break;
    }
    // If we hit a semicolon before an opening brace, it's just a prototype, not definition
    if (cleanLines[i].includes(';')) {
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

  // Count braces forward to find endLine using comment-safe, string-safe counter
  const endLine = findMatchingBraceEnd(lines, openBraceLine, openBraceCol);

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
