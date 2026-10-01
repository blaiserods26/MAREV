import { RecoveredSignature } from '../types';

export interface LLMProvider {
  readonly id: string;
  readonly name: string;
  isAvailable(): Promise<boolean> | boolean;
  generateSignature(prompt: string, calleeContext?: string): Promise<RecoveredSignature>;
}
