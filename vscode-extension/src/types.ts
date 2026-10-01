export interface RecoveredParameter {
  name: string;
  type: string;
  location?: string;
  purpose: string;
}

export interface RecoveredSignature {
  name: string;
  return_type: string;
  parameters: RecoveredParameter[];
  calling_convention: string;
  c_prototype: string;
  confidence: number;
  semantic_category: string;
  summary: string;
  reasoning?: string[];
}

export interface CalleeContext {
  name: string;
  code: string;
  line: number;
}

export interface ExtractedContext {
  targetCode: string;
  languageId: string;
  functionName?: string;
  isEnclosing: boolean;
  startLine: number;
  endLine: number;
  callees: CalleeContext[];
}

export type ProviderType = 'gemini' | 'ollama';

export interface AgentConfig {
  provider: ProviderType;
  geminiApiKey: string;
  geminiModel: string;
  ollamaEndpoint: string;
  ollamaModel: string;
  autoExpandContext: boolean;
}
