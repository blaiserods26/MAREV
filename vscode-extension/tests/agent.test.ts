import { describe, it, expect } from 'vitest';
import { parseSignatureJson } from '../src/agent/geminiProvider';
import { AgentEngine } from '../src/agent/agentEngine';
import { AgentConfig, ExtractedContext } from '../src/types';

describe('parseSignatureJson', () => {
  it('parses valid JSON response from AI model', () => {
    const jsonStr = JSON.stringify({
      name: 'rc4_init_key',
      return_type: 'void',
      calling_convention: 'System V AMD64',
      c_prototype: 'void rc4_init_key(uint8_t* state, const uint8_t* key, size_t keylen);',
      confidence: 0.95,
      semantic_category: 'CRYPTOGRAPHY',
      summary: 'Initializes the RC4 state S-box using the key scheduling algorithm (KSA).',
      parameters: [
        { name: 'state', type: 'uint8_t*', location: '%rdi', purpose: '256-byte RC4 S-box buffer' },
        { name: 'key', type: 'const uint8_t*', location: '%rsi', purpose: 'Key byte array' },
        { name: 'keylen', type: 'size_t', location: '%rdx', purpose: 'Length of encryption key' }
      ],
      reasoning: ['Observed 256-iteration permutation loop', 'Standard RC4 KSA constants']
    });

    const parsed = parseSignatureJson(jsonStr);

    expect(parsed.name).toBe('rc4_init_key');
    expect(parsed.confidence).toBe(0.95);
    expect(parsed.semantic_category).toBe('CRYPTOGRAPHY');
    expect(parsed.parameters).toHaveLength(3);
    expect(parsed.parameters[0].name).toBe('state');
    expect(parsed.parameters[0].location).toBe('%rdi');
  });

  it('strips markdown codeblock fences from model response', () => {
    const raw = '```json\n{"name": "parse_header", "return_type": "int", "confidence": 0.8}\n```';
    const parsed = parseSignatureJson(raw);
    expect(parsed.name).toBe('parse_header');
    expect(parsed.return_type).toBe('int');
  });

  it('handles missing or malformed fields gracefully', () => {
    const raw = '{"name": "sub_test"}';
    const parsed = parseSignatureJson(raw);
    expect(parsed.name).toBe('sub_test');
    expect(parsed.return_type).toBe('void');
    expect(parsed.calling_convention).toBe('System V AMD64');
    expect(parsed.parameters).toEqual([]);
  });
});
