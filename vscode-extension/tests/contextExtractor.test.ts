import { describe, it, expect } from 'vitest';
import { extractFunctionContext, extractAllFunctionsInDocument } from '../src/contextExtractor';

describe('extractFunctionContext', () => {
  it('extracts enclosing C function boundary and callee from document text', () => {
    const cSource = `
#include <stdio.h>

static int helper_hash(int x) {
    return (x * 33) ^ 0x5a;
}

int sub_4010a0(int a, int b) {
    int res = helper_hash(a);
    if (res > 100) {
        res += b;
    }
    return res;
}

int main() {
    return sub_4010a0(1, 2);
}
`;

    // Cursor is inside sub_4010a0 at line 9 ("int res = helper_hash(a);")
    const lines = cSource.split('\n');
    const result = extractFunctionContext(lines, 9, 'c');

    expect(result.functionName).toBe('sub_4010a0');
    expect(result.targetCode).toContain('int sub_4010a0(int a, int b) {');
    expect(result.targetCode).toContain('return res;');
    expect(result.isEnclosing).toBe(true);
    expect(result.callees.length).toBeGreaterThan(0);
    expect(result.callees[0].name).toBe('helper_hash');
    expect(result.callees[0].code).toContain('return (x * 33) ^ 0x5a;');
  });

  it('extracts enclosing Assembly function from label to ret', () => {
    const asmSource = `
.globl sub_401120
sub_401120:
    push %rbp
    mov %rsp, %rbp
    mov %edi, -0x4(%rbp)
    call helper_routine
    pop %rbp
    retq

helper_routine:
    mov $0x1, %eax
    retq
`;

    const lines = asmSource.split('\n');
    const result = extractFunctionContext(lines, 4, 'assembly');

    expect(result.functionName).toBe('sub_401120');
    expect(result.targetCode).toContain('sub_401120:');
    expect(result.targetCode).toContain('retq');
    expect(result.callees.length).toBe(1);
    expect(result.callees[0].name).toBe('helper_routine');
    expect(result.callees[0].code).toContain('mov $0x1, %eax');
  });

  it('falls back to selected lines when outside standard function definition', () => {
    const rawSnippet = `x = 5;\ny = x + 10;\nprintf("%d", y);`;
    const lines = rawSnippet.split('\n');
    const result = extractFunctionContext(lines, 1, 'c', 0, 2);

    expect(result.targetCode).toBe(rawSnippet);
    expect(result.startLine).toBe(0);
    expect(result.endLine).toBe(2);
  });

  it('extracts all functions from multi-function C file and supports stripped filter', () => {
    const cSource = `
int helper_one(int x) {
    return x + 1;
}

void FUN_00102020(void) {
    return;
}

int sub_401100(char* buf) {
    return 0;
}
`;
    const lines = cSource.split('\n');
    const all = extractAllFunctionsInDocument(lines, 'c', false);
    expect(all).toHaveLength(3);
    expect(all.map(f => f.functionName)).toEqual(['helper_one', 'FUN_00102020', 'sub_401100']);

    const stripped = extractAllFunctionsInDocument(lines, 'c', true);
    expect(stripped).toHaveLength(2);
    expect(stripped.map(f => f.functionName)).toEqual(['FUN_00102020', 'sub_401100']);
  });
});

