import { ExtractedContext, RecoveredSignature, AgentConfig } from '../types';
import { LLMProvider } from './types';
import { GeminiProvider } from './geminiProvider';
import { OllamaProvider } from './ollamaProvider';

export class AgentEngine {
  private _provider: LLMProvider;

  constructor(config: AgentConfig) {
    this._provider = this._createProvider(config);
  }

  public updateConfig(config: AgentConfig) {
    this._provider = this._createProvider(config);
  }

  public get providerName(): string {
    return this._provider.name;
  }

  public async isProviderReady(): Promise<boolean> {
    return await this._provider.isAvailable();
  }

  public async analyzeFunction(context: ExtractedContext): Promise<RecoveredSignature> {
    const isAsm = context.languageId.includes('asm') || context.languageId.includes('assembly') || context.languageId === 's';

    let prompt = '';
    if (isAsm) {
      prompt = `Analyze the following x86-64 assembly subroutine:\n\`\`\`assembly\n${context.targetCode}\n\`\`\``;
    } else {
      prompt = `Analyze the following C/C++ function (which may be stripped, decompiled, or obfuscated):\n\`\`\`c\n${context.targetCode}\n\`\`\``;
    }

    let calleeText: string | undefined = undefined;
    if (context.callees && context.callees.length > 0) {
      calleeText = context.callees
        .map((c, i) => `Subroutine ${i + 1}: \`${c.name}\`:\n\`\`\`\n${c.code}\n\`\`\``)
        .join('\n\n');
    }

    return await this._provider.generateSignature(prompt, calleeText);
  }

  private _createProvider(config: AgentConfig): LLMProvider {
    if (config.provider === 'ollama') {
      return new OllamaProvider(config.ollamaEndpoint, config.ollamaModel);
    } else {
      return new GeminiProvider(config.geminiApiKey, config.geminiModel);
    }
  }
}
