import * as vscode from 'vscode';
import { RecoveredSignature, ExtractedContext, AgentConfig } from './types';

export class MarevSidebarProvider implements vscode.WebviewViewProvider {
  public static readonly viewType = 'marev.sidebar';
  private _view?: vscode.WebviewView;

  private _currentContext?: ExtractedContext;
  private _currentSignature?: RecoveredSignature;
  private _isLoading = false;
  private _errorMessage?: string;

  constructor(
    private readonly _extensionUri: vscode.Uri,
    private readonly _onRunAnalysis: (context: ExtractedContext) => Promise<void>,
    private readonly _onRename: (signature: RecoveredSignature, context: ExtractedContext) => Promise<void>,
    private readonly _onInsertDoc: (signature: RecoveredSignature, context: ExtractedContext) => Promise<void>
  ) {}

  public resolveWebviewView(
    webviewView: vscode.WebviewView,
    _context: vscode.WebviewViewResolveContext,
    _token: vscode.CancellationToken
  ) {
    this._view = webviewView;

    webviewView.webview.options = {
      enableScripts: true,
      localResourceRoots: [this._extensionUri]
    };

    webviewView.webview.html = this._getHtmlForWebview(webviewView.webview);

    webviewView.webview.onDidReceiveMessage(async (data) => {
      switch (data.type) {
        case 'triggerAnalysis': {
          if (this._currentContext) {
            await this._onRunAnalysis(this._currentContext);
          } else {
            vscode.window.showWarningMessage('No active code selected. Select code in the editor first.');
          }
          break;
        }
        case 'renameFunction': {
          if (this._currentSignature && this._currentContext) {
            await this._onRename(this._currentSignature, this._currentContext);
          }
          break;
        }
        case 'insertDoc': {
          if (this._currentSignature && this._currentContext) {
            await this._onInsertDoc(this._currentSignature, this._currentContext);
          }
          break;
        }
        case 'copyPrototype': {
          if (this._currentSignature?.c_prototype) {
            await vscode.env.clipboard.writeText(this._currentSignature.c_prototype);
            vscode.window.showInformationMessage('C Prototype copied to clipboard!');
          }
          break;
        }
        case 'openSettings': {
          vscode.commands.executeCommand('workbench.action.openSettings', 'marev');
          break;
        }
      }
    });

    // Update with any pending context
    if (this._currentContext) {
      this._updateWebview();
    }
  }

  public setContext(context: ExtractedContext) {
    this._currentContext = context;
    this._currentSignature = undefined;
    this._errorMessage = undefined;
    this._isLoading = false;
    this._updateWebview();
    if (this._view) {
      this._view.show?.(true);
    }
  }

  public setLoading(loading: boolean, message?: string) {
    this._isLoading = loading;
    this._errorMessage = undefined;
    this._view?.webview.postMessage({
      type: 'setLoading',
      loading,
      message: message ?? 'AI Agent reverse-engineering function semantics...'
    });
  }

  public setSignatureResult(signature: RecoveredSignature) {
    this._currentSignature = signature;
    this._isLoading = false;
    this._errorMessage = undefined;
    this._updateWebview();
  }

  public setError(error: string) {
    this._errorMessage = error;
    this._isLoading = false;
    this._updateWebview();
  }

  private _updateWebview() {
    if (this._view) {
      this._view.webview.postMessage({
        type: 'updateState',
        context: this._currentContext,
        signature: this._currentSignature,
        isLoading: this._isLoading,
        errorMessage: this._errorMessage
      });
    }
  }

  private _getHtmlForWebview(_webview: vscode.Webview): string {
    return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MAREV AI Function Identifier</title>
  <style>
    :root {
      --bg-dark: #0f172a;
      --card-bg: #1e293b;
      --border-color: #334155;
      --primary: #6366f1;
      --primary-hover: #4f46e5;
      --accent: #06b6d4;
      --text-main: #f8fafc;
      --text-muted: #94a3b8;
      --success: #10b981;
      --warning: #f59e0b;
      --danger: #ef4444;
      --code-bg: #090d16;
    }

    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      margin: 0;
      padding: 12px;
      color: var(--text-main);
      background-color: transparent;
      font-size: 13px;
      line-height: 1.5;
    }

    .header-bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding-bottom: 10px;
      border-bottom: 1px solid var(--border-color);
      margin-bottom: 12px;
    }

    .title {
      font-size: 13px;
      font-weight: 700;
      letter-spacing: 0.5px;
      display: flex;
      align-items: center;
      gap: 6px;
      text-transform: uppercase;
      color: #cbd5e1;
    }

    .settings-btn {
      background: none;
      border: 1px solid var(--border-color);
      color: var(--text-muted);
      cursor: pointer;
      padding: 3px 8px;
      border-radius: 4px;
      font-size: 11px;
      transition: all 0.2s;
    }
    .settings-btn:hover {
      border-color: var(--primary);
      color: var(--text-main);
    }

    .badge {
      display: inline-block;
      padding: 2px 7px;
      border-radius: 9999px;
      font-size: 10px;
      font-weight: 600;
      text-transform: uppercase;
    }
    .badge-primary { background: rgba(99, 102, 241, 0.2); color: #818cf8; border: 1px solid rgba(99, 102, 241, 0.4); }
    .badge-success { background: rgba(16, 185, 129, 0.2); color: #34d399; border: 1px solid rgba(16, 185, 129, 0.4); }
    .badge-warning { background: rgba(245, 158, 11, 0.2); color: #fbbf24; border: 1px solid rgba(245, 158, 11, 0.4); }
    .badge-category { background: rgba(6, 182, 212, 0.2); color: #22d3ee; border: 1px solid rgba(6, 182, 212, 0.4); }

    .card {
      background: var(--card-bg);
      border: 1px solid var(--border-color);
      border-radius: 8px;
      padding: 12px;
      margin-bottom: 12px;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.2);
    }

    .btn-primary {
      width: 100%;
      background: linear-gradient(135deg, var(--primary) 0%, #4338ca 100%);
      color: white;
      border: none;
      border-radius: 6px;
      padding: 9px 12px;
      font-size: 12px;
      font-weight: 600;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      transition: all 0.2s;
    }
    .btn-primary:hover:not(:disabled) {
      filter: brightness(1.1);
      box-shadow: 0 0 12px rgba(99, 102, 241, 0.5);
    }
    .btn-primary:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    .btn-secondary {
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid var(--border-color);
      color: var(--text-main);
      border-radius: 6px;
      padding: 6px 10px;
      font-size: 11px;
      font-weight: 500;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      transition: all 0.2s;
    }
    .btn-secondary:hover {
      background: rgba(255, 255, 255, 0.1);
      border-color: var(--primary);
    }

    .actions-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 8px;
      margin-top: 10px;
    }

    .code-box {
      background: var(--code-bg);
      border: 1px solid var(--border-color);
      border-radius: 6px;
      padding: 8px 10px;
      font-family: 'JetBrains Mono', Consolas, Monaco, monospace;
      font-size: 11px;
      color: #38bdf8;
      overflow-x: auto;
      white-space: pre-wrap;
      word-break: break-all;
      margin: 6px 0;
    }

    .table-container {
      width: 100%;
      border-collapse: collapse;
      margin-top: 8px;
      font-size: 11px;
    }
    .table-container th {
      text-align: left;
      padding: 5px 6px;
      border-bottom: 1px solid var(--border-color);
      color: var(--text-muted);
      font-weight: 600;
    }
    .table-container td {
      padding: 6px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }

    .spinner {
      display: inline-block;
      width: 14px;
      height: 14px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 50%;
      border-top-color: white;
      animation: spin 0.8s linear infinite;
    }
    @keyframes spin {
      to { transform: rotate(360deg); }
    }

    .collapsible-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      cursor: pointer;
      font-size: 11px;
      color: var(--text-muted);
      user-select: none;
    }

    .error-card {
      background: rgba(239, 68, 68, 0.1);
      border: 1px solid rgba(239, 68, 68, 0.3);
      border-radius: 6px;
      padding: 10px;
      color: #fca5a5;
      font-size: 11px;
      margin-bottom: 12px;
    }

    .placeholder-state {
      text-align: center;
      padding: 30px 10px;
      color: var(--text-muted);
    }
  </style>
</head>
<body>
  <div class="header-bar">
    <div class="title">
      <span style="color: var(--primary);">✦</span> MAREV AI AGENT
    </div>
    <button class="settings-btn" id="openSettingsBtn" title="Extension Settings">⚙ Config</button>
  </div>

  <div id="errorContainer"></div>

  <div id="contextSection">
    <div class="card" id="contextCard" style="display: none;">
      <div class="collapsible-header" id="contextToggle">
        <span><strong id="langBadge">C</strong> • <span id="linesInfo">Lines 0-0</span></span>
        <span id="calleesCount" class="badge badge-primary">0 callees</span>
      </div>
      <div id="contextBody" style="margin-top: 8px;">
        <div style="font-size: 11px; color: var(--text-muted); margin-bottom: 4px;">Target Code:</div>
        <div class="code-box" id="codeSnippet" style="max-height: 100px; overflow-y: auto;"></div>
      </div>
    </div>
  </div>

  <button class="btn-primary" id="analyzeBtn" disabled>
    <span>✦ Run AI Function Prediction</span>
  </button>

  <div id="resultSection" style="margin-top: 14px;"></div>

  <script>
    const vscode = acquireVsCodeApi();

    const analyzeBtn = document.getElementById('analyzeBtn');
    const openSettingsBtn = document.getElementById('openSettingsBtn');
    const contextCard = document.getElementById('contextCard');
    const langBadge = document.getElementById('langBadge');
    const linesInfo = document.getElementById('linesInfo');
    const calleesCount = document.getElementById('calleesCount');
    const codeSnippet = document.getElementById('codeSnippet');
    const resultSection = document.getElementById('resultSection');
    const errorContainer = document.getElementById('errorContainer');

    let currentContext = null;
    let currentSignature = null;

    openSettingsBtn.addEventListener('click', () => {
      vscode.postMessage({ type: 'openSettings' });
    });

    analyzeBtn.addEventListener('click', () => {
      vscode.postMessage({ type: 'triggerAnalysis' });
    });

    window.addEventListener('message', event => {
      const message = event.data;
      switch (message.type) {
        case 'setLoading':
          setLoadingUI(message.loading, message.message);
          break;
        case 'updateState':
          renderState(message);
          break;
      }
    });

    function setLoadingUI(loading, statusText) {
      if (loading) {
        analyzeBtn.disabled = true;
        analyzeBtn.innerHTML = '<span class="spinner"></span> <span>' + (statusText || 'Analyzing...') + '</span>';
      } else {
        analyzeBtn.disabled = !currentContext;
        analyzeBtn.innerHTML = '<span>✦ Run AI Function Prediction</span>';
      }
    }

    function renderState(state) {
      currentContext = state.context;
      currentSignature = state.signature;

      // Handle Errors
      if (state.errorMessage) {
        errorContainer.innerHTML = '<div class="error-card"><strong>Error:</strong> ' + escapeHtml(state.errorMessage) + '</div>';
      } else {
        errorContainer.innerHTML = '';
      }

      // Handle Context Card
      if (currentContext) {
        contextCard.style.display = 'block';
        langBadge.textContent = currentContext.languageId.toUpperCase();
        linesInfo.textContent = 'Lines ' + (currentContext.startLine + 1) + '-' + (currentContext.endLine + 1);
        calleesCount.textContent = (currentContext.callees?.length || 0) + ' callees';
        codeSnippet.textContent = currentContext.targetCode;
        analyzeBtn.disabled = state.isLoading;
      } else {
        contextCard.style.display = 'none';
        analyzeBtn.disabled = true;
      }

      // Handle Results Card
      if (currentSignature) {
        renderResult(currentSignature);
      } else if (!state.isLoading && !currentContext) {
        resultSection.innerHTML = '<div class="placeholder-state"><p>Select a function or code snippet in the editor and click <strong>"MAREV: Identify Function"</strong> to begin.</p></div>';
      } else if (!state.isLoading && currentContext && !currentSignature) {
        resultSection.innerHTML = '';
      }

      if (state.isLoading) {
        setLoadingUI(true, 'AI Agent reverse-engineering function semantics...');
      } else {
        setLoadingUI(false);
      }
    }

    function renderResult(sig) {
      const confPct = Math.round(sig.confidence * 100);
      let confBadgeClass = 'badge-success';
      if (confPct < 60) confBadgeClass = 'badge-warning';

      let paramsHtml = '';
      if (sig.parameters && sig.parameters.length > 0) {
        paramsHtml = '<table class="table-container"><thead><tr><th>Param</th><th>Type</th><th>Purpose</th></tr></thead><tbody>';
        for (const p of sig.parameters) {
          paramsHtml += '<tr><td><code>' + escapeHtml(p.name) + '</code></td><td style="color: #67e8f9;">' + escapeHtml(p.type) + '</td><td style="color: var(--text-muted);">' + escapeHtml(p.purpose) + '</td></tr>';
        }
        paramsHtml += '</tbody></table>';
      } else {
        paramsHtml = '<div style="color: var(--text-muted); font-size: 11px; margin-top: 4px;">No parameters (void)</div>';
      }

      resultSection.innerHTML = \`
        <div class="card" style="border-color: rgba(99, 102, 241, 0.4); background: rgba(30, 41, 59, 0.9);">
          <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 8px;">
            <div>
              <div style="font-size: 11px; color: var(--text-muted); text-transform: uppercase; font-weight: 600;">Deduced Identifier</div>
              <div style="font-size: 15px; font-weight: 700; color: #38bdf8; font-family: monospace; word-break: break-all;">
                \${escapeHtml(sig.name)}
              </div>
            </div>
            <div style="text-align: right;">
              <span class="badge \${confBadgeClass}">\${confPct}% Confidence</span>
              <div style="margin-top: 4px;"><span class="badge badge-category">\${escapeHtml(sig.semantic_category || 'GENERAL')}</span></div>
            </div>
          </div>

          <div style="margin-top: 10px;">
            <div style="font-size: 11px; color: var(--text-muted); font-weight: 600;">Recovered C Prototype:</div>
            <div class="code-box">\${escapeHtml(sig.c_prototype || (sig.return_type + ' ' + sig.name + '()'))}</div>
          </div>

          <div style="margin-top: 10px;">
            <div style="font-size: 11px; color: var(--text-muted); font-weight: 600;">Parameters:</div>
            \${paramsHtml}
          </div>

          <div style="margin-top: 10px;">
            <div style="font-size: 11px; color: var(--text-muted); font-weight: 600;">Operational Summary:</div>
            <div style="font-size: 12px; color: #cbd5e1; margin-top: 4px; line-height: 1.4;">
              \${escapeHtml(sig.summary || 'No explanation provided.')}
            </div>
          </div>

          <div class="actions-grid">
            <button class="btn-secondary" id="renameBtn">
              ✏️ Rename in File
            </button>
            <button class="btn-secondary" id="insertDocBtn">
              📄 Insert Doxygen
            </button>
          </div>
          <div style="margin-top: 6px;">
            <button class="btn-secondary" id="copyProtoBtn" style="width: 100%;">
              📋 Copy C Prototype
            </button>
          </div>
        </div>
      \`;

      document.getElementById('renameBtn')?.addEventListener('click', () => {
        vscode.postMessage({ type: 'renameFunction' });
      });
      document.getElementById('insertDocBtn')?.addEventListener('click', () => {
        vscode.postMessage({ type: 'insertDoc' });
      });
      document.getElementById('copyProtoBtn')?.addEventListener('click', () => {
        vscode.postMessage({ type: 'copyPrototype' });
      });
    }

    function escapeHtml(text) {
      if (!text) return '';
      return String(text)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
    }
  </script>
</body>
</html>`;
  }
}
