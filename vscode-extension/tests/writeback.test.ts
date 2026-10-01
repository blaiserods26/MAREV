import { describe, it, expect } from 'vitest';
import { generateDoxygenComment } from '../src/doxygen';
import { RecoveredSignature } from '../src/types';

describe('generateDoxygenComment', () => {
  it('generates well-formatted Doxygen comment from RecoveredSignature', () => {
    const sig: RecoveredSignature = {
      name: 'verify_signature',
      return_type: 'int',
      calling_convention: 'System V AMD64',
      c_prototype: 'int verify_signature(const uint8_t* msg, size_t len);',
      confidence: 0.92,
      semantic_category: 'VALIDATION',
      summary: 'Verifies an ed25519 signature against the public key.',
      parameters: [
        { name: 'msg', type: 'const uint8_t*', purpose: 'Message payload buffer' },
        { name: 'len', type: 'size_t', purpose: 'Length in bytes' }
      ]
    };

    const doc = generateDoxygenComment(sig);

    expect(doc).toContain('/**');
    expect(doc).toContain('* @brief Verifies an ed25519 signature against the public key.');
    expect(doc).toContain('* @param msg Message payload buffer');
    expect(doc).toContain('* @param len Length in bytes');
    expect(doc).toContain('* @return int');
    expect(doc).toContain('* @note Recovered via MAREV AI Agent (92% confidence, VALIDATION)');
    expect(doc).toContain('*/');
  });
});
