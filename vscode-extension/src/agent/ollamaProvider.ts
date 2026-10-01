import { LLMProvider } from './types';
import { RecoveredSignature } from '../types';
import { parseSignatureJson } from './geminiProvider';

export class OllamaProvider implements LLMProvider {
  public readonly id = 'ollama';
  private _endpoint: string;
  private _model: string;

  constructor(endpoint: string = 'http://localhost:11434', model: string = 'qwen2.5-coder:latest') {
    this._endpoint = endpoint.replace(/\/+$/, '');
    this._model = model;
  }

  public get name(): string {
    return `Ollama (${this._model})`;
  }

  public async isAvailable(): Promise<boolean> {
    try {
      const resp = await fetch(`${this._endpoint}/api/tags`, { method: 'GET', signal: AbortSignal.timeout(2000) });
      return resp.ok;
    } catch {
      return false;
    }
  }

  public async generateSignature(prompt: string, calleeContext?: string): Promise<RecoveredSignature> {
    let fullPrompt = `System: You are an expert reverse engineering and static binary analysis AI agent.
Analyze the target function code and return valid JSON adhering strictly to this schema:
{
  "name": "descriptive_function_name",
  "return_type": "int",
  "calling_convention": "System V AMD64",
  "c_prototype": "int descriptive_function_name(const char* buf, size_t len)",
  "confidence": 0.85,
  "semantic_category": "CRYPTOGRAPHY",
  "summary": "Detailed explanation of what the function does.",
  "parameters": [
    {"name": "buf", "type": "const char*", "location": "%rdi", "purpose": "Input buffer"}
  ],
  "reasoning": ["Step by step reasoning"]
}

Human:
Target Function Code:
${prompt}
`;

    if (calleeContext) {
      fullPrompt += `\nReferenced Callee Subroutines:\n${calleeContext}\n`;
    }

    fullPrompt += '\nAssistant:';

    const url = `${this._endpoint}/api/generate`;
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        model: this._model,
        prompt: fullPrompt,
        stream: false,
        format: 'json',
        options: {
          temperature: 0.1
        }
      })
    });

    if (!response.ok) {
      const err = await response.text();
      throw new Error(`Ollama request failed (${response.status}): ${err}`);
    }

    const data: any = await response.json();
    const rawText = data?.response;
    if (!rawText) {
      throw new Error('Ollama returned empty response content.');
    }

    return parseSignatureJson(rawText);
  }
}
