import { RecoveredSignature } from './types';

export function generateDoxygenComment(sig: RecoveredSignature): string {
  const lines: string[] = [];
  lines.push('/**');
  lines.push(` * @brief ${sig.summary.replace(/\n+/g, ' ')}`);
  lines.push(' *');

  if (sig.parameters && sig.parameters.length > 0) {
    for (const p of sig.parameters) {
      lines.push(` * @param ${p.name} ${p.purpose.replace(/\n+/g, ' ')}`);
    }
  }

  lines.push(` * @return ${sig.return_type || 'void'}`);
  lines.push(
    ` * @note Recovered via MAREV AI Agent (${Math.round(sig.confidence * 100)}% confidence, ${sig.semantic_category || 'GENERAL'})`
  );
  lines.push(' */');

  return lines.join('\n');
}
