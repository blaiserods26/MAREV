import { describe, it, expect } from 'vitest';
import * as fs from 'fs';
import * as path from 'path';
import { extractFunctionContext } from '../src/contextExtractor';
import { generateDoxygenComment } from '../src/doxygen';
import { RecoveredSignature } from '../src/types';

describe('Real-World Reverse Engineering Fixture: night_cipher_game_c.c', () => {
  const filePath = path.resolve(__dirname, '../../assets/night_cipher_game_c.c');

  it('successfully extracts function boundaries from Ghidra decompilation in night_cipher_game_c.c', () => {
    expect(fs.existsSync(filePath)).toBe(true);

    const content = fs.readFileSync(filePath, 'utf-8');
    const lines = content.split(/\r?\n/);

    // Test extraction around line 18 (inside FUN_00102020)
    const context = extractFunctionContext(lines, 17, 'c');

    expect(context.isEnclosing).toBe(true);
    expect(context.functionName).toBe('FUN_00102020');
    expect(context.targetCode).toContain('void FUN_00102020(void)');
    expect(context.targetCode).toContain('return;');
  });

  it('generates accurate Doxygen documentation for recovered Ghidra function', () => {
    const recoveredSig: RecoveredSignature = {
      name: 'trampoline_thunk_dispatcher',
      return_type: 'void',
      calling_convention: 'cdecl',
      c_prototype: 'void trampoline_thunk_dispatcher(void);',
      confidence: 0.91,
      semantic_category: 'DISPATCHER',
      summary: 'Trampoline jump table stub invoking dynamic symbol pointer PTR_00106ff8.',
      parameters: []
    };

    const doc = generateDoxygenComment(recoveredSig);
    expect(doc).toContain('@brief Trampoline jump table stub');
    expect(doc).toContain('@return void');
    expect(doc).toContain('DISPATCHER');
  });
});
