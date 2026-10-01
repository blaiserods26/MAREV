import { LLMProvider } from './types';
import { RecoveredSignature } from '../types';

export class GeminiProvider implements LLMProvider {
  public readonly id = 'gemini';
  private _apiKey: string;
  private _model: string;

  constructor(apiKey: string, model: string = 'gemini-2.5-flash') {
    this._apiKey = apiKey.trim() || process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY || '';
    this._model = model.includes('1.5') ? 'gemini-2.5-flash' : model;
  }

  public get name(): string {
    return `Google Gemini (${this._model})`;
  }

  public isAvailable(): boolean {
    return Boolean(this._apiKey && this._apiKey.length > 5);
  }

  public async generateSignature(prompt: string, calleeContext?: string): Promise<RecoveredSignature> {
    if (!this.isAvailable()) {
      throw new Error(
        'Gemini API key is not configured. Set "marev.geminiApiKey" in VS Code Settings or define GEMINI_API_KEY in your environment.'
      );
    }

    const url = `https://generativelanguage.googleapis.com/v1beta/models/${this._model}:generateContent?key=${this._apiKey}`;

    let fullPrompt = prompt;
    if (calleeContext) {
      fullPrompt += `\n\n### Referenced Callee / Subroutine Context:\n${calleeContext}`;
    }

    const systemInstruction = `You are a world-class reverse engineering and static code analysis AI agent.
Analyze the target function code (C source code or x86 assembly disassembly).
Deduce its true semantic purpose, an accurate descriptive function name (e.g. rc4_encrypt, parse_header, compute_checksum, verify_token), return type, parameter list with types and operational descriptions, calling convention, C prototype, confidence (0.0 to 1.0), and semantic category (CRYPTOGRAPHY, STRING_PROCESSING, MEMORY_MANAGEMENT, VALIDATION, NETWORKING, FILE_IO, DISPATCHER, or GENERAL).

Return valid JSON ONLY adhering strictly to this schema:
{
  "name": "string (descriptive semantic function name)",
  "return_type": "string (e.g. int, void, size_t, char*)",
  "calling_convention": "string (e.g. cdecl, System V AMD64)",
  "c_prototype": "string (complete C prototype e.g. int parse_packet(const uint8_t* buf, size_t len))",
  "confidence": number (between 0.1 and 0.99),
  "semantic_category": "string (e.g. CRYPTOGRAPHY, STRING_PROCESSING, VALIDATION, etc.)",
  "summary": "string (2-3 sentences explaining what this function does and its operational logic)",
  "parameters": [
    {
      "name": "string (parameter name)",
      "type": "string (C data type)",
      "location": "string (optional: register %rdi or stack)",
      "purpose": "string (concise description of what this argument represents)"
    }
  ],
  "reasoning": [
    "string (step-by-step reverse engineering clues observed in the code)"
  ]
}`;

    const requestBody = {
      contents: [
        {
          role: 'user',
          parts: [{ text: fullPrompt }]
        }
      ],
      systemInstruction: {
        parts: [{ text: systemInstruction }]
      },
      generationConfig: {
        temperature: 0.1,
        responseMimeType: 'application/json'
      }
    };

    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestBody)
    });

    if (!response.ok) {
      const errText = await response.text();
      throw new Error(`Gemini API error (${response.status}): ${errText}`);
    }

    const jsonResp: any = await response.json();
    const rawText = jsonResp?.candidates?.[0]?.content?.parts?.[0]?.text;
    if (!rawText) {
      throw new Error('Gemini returned an empty response.');
    }

    return parseSignatureJson(rawText);
  }
}

export function parseSignatureJson(raw: string): RecoveredSignature {
  // Strip optional markdown codeblock wrappers
  let cleaned = raw.trim();
  if (cleaned.startsWith('```json')) {
    cleaned = cleaned.replace(/^```json\s*/i, '').replace(/\s*```$/, '');
  } else if (cleaned.startsWith('```')) {
    cleaned = cleaned.replace(/^```\s*/i, '').replace(/\s*```$/, '');
  }

  let parsed: any;
  try {
    parsed = JSON.parse(cleaned);
  } catch (err) {
    // Attempt relaxed regex extraction
    const jsonMatch = cleaned.match(/\{[\s\S]*\}/);
    if (jsonMatch) {
      parsed = JSON.parse(jsonMatch[0]);
    } else {
      throw new Error(`Failed to parse AI agent response as JSON: ${raw}`);
    }
  }

  const name = parsed.name || 'sub_recovered';
  const return_type = parsed.return_type || 'void';
  const calling_convention = parsed.calling_convention || 'System V AMD64';
  const c_prototype = parsed.c_prototype || `${return_type} ${name}();`;
  const confidence = typeof parsed.confidence === 'number' ? Math.min(0.99, Math.max(0.1, parsed.confidence)) : 0.85;
  const semantic_category = parsed.semantic_category || 'GENERAL';
  const summary = parsed.summary || 'Analyzed by AI Agent.';
  const reasoning = Array.isArray(parsed.reasoning) ? parsed.reasoning : [];

  const parameters = Array.isArray(parsed.parameters)
    ? parsed.parameters.map((p: any) => ({
        name: p.name || 'arg',
        type: p.type || p.type_name || 'void*',
        location: p.location || p.register_or_location || undefined,
        purpose: p.purpose || p.description || 'Argument'
      }))
    : [];

  return {
    name,
    return_type,
    calling_convention,
    c_prototype,
    confidence,
    semantic_category,
    summary,
    parameters,
    reasoning
  };
}
