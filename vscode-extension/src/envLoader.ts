import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';

export interface WorkspaceEnvConfig {
  apiKey?: string;
  model?: string;
  ollamaEndpoint?: string;
  ollamaModel?: string;
}

export function loadWorkspaceEnv(): WorkspaceEnvConfig {
  const result: WorkspaceEnvConfig = {};

  const folders = vscode.workspace.workspaceFolders;
  if (!folders || folders.length === 0) {
    return result;
  }

  for (const folder of folders) {
    const rootPath = folder.uri.fsPath;
    const candidatePaths = [
      path.join(rootPath, '.env'),
      path.join(rootPath, 'staticcfg', 'backend', '.env'),
      path.join(rootPath, 'backend', '.env')
    ];

    for (const envPath of candidatePaths) {
      if (fs.existsSync(envPath)) {
        try {
          const content = fs.readFileSync(envPath, 'utf-8');
          const lines = content.split(/\r?\n/);
          for (const line of lines) {
            const trimmed = line.trim();
            if (!trimmed || trimmed.startsWith('#') || !trimmed.includes('=')) {
              continue;
            }
            const eqIdx = trimmed.indexOf('=');
            const key = trimmed.slice(0, eqIdx).trim();
            const val = trimmed.slice(eqIdx + 1).trim().replace(/^['"]|['"]$/g, '');

            if ((key === 'GEMINI_API_KEY' || key === 'GOOGLE_API_KEY') && val && !result.apiKey) {
              result.apiKey = val;
            }
            if (key === 'GEMINI_MODEL' && val && !result.model) {
              result.model = val;
            }
            if ((key === 'OLLAMA_ENDPOINT' || key === 'OLLAMA_HOST') && val && !result.ollamaEndpoint) {
              result.ollamaEndpoint = val;
            }
            if (key === 'OLLAMA_MODEL' && val && !result.ollamaModel) {
              result.ollamaModel = val;
            }
          }
          if (result.apiKey) {
            return result;
          }
        } catch {
          // Ignore read errors
        }
      }
    }
  }

  return result;
}
