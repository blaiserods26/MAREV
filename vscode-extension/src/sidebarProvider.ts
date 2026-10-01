import * as vscode from 'vscode';
import { RecoveredSignature, ExtractedContext, BatchFunctionCandidate } from './types';
import { BatchRenameItem } from './writeback';

export class MarevSidebarProvider implements vscode.WebviewViewProvider {
  public static readonly viewType = 'marev.sidebar';
  private _view?: vscode.WebviewView;

  private _currentContext?: ExtractedContext;
  private _currentSignature?: RecoveredSignature;
  private _isLoading = false;
  private _errorMessage?: string;

  private _batchCandidates: BatchFunctionCandidate[] = [];
  private _batchDocName = '';
  private _batchProgress = { completed: 0, total: 0, currentFunc: '' };
  private _isBatchRunning = false;
  private _isScanning = false;
  private _onlyStripped = true;
  private _activeTab: 'single' | 'batch' = 'single';

  constructor(
    private readonly _extensionUri: vscode.Uri,
    private readonly _onRunAnalysis: (context: ExtractedContext) => Promise<void>,
    private readonly _onRename: (signature: RecoveredSignature, context: ExtractedContext) => Promise<void>,
    private readonly _onInsertDoc: (signature: RecoveredSignature, context: ExtractedContext) => Promise<void>,
    private readonly _onScanFile: (onlyStripped: boolean) => Promise<BatchFunctionCandidate[] | void>,
    private readonly _onRunBatchAnalysis: (candidateIds?: string[]) => Promise<void>,
    private readonly _onApplyBatchRenames: (items: BatchRenameItem[]) => Promise<void>
  ) {}

  public getBatchCandidates(): BatchFunctionCandidate[] {
    return this._batchCandidates;
  }


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
    this._updateWebview();

    webviewView.webview.onDidReceiveMessage(async (data) => {
      switch (data.type) {
        case 'webviewReady': {
          this._updateWebview();
          break;
        }
        case 'setTab': {
          this._activeTab = data.tab;
          break;
        }
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
        case 'scanFile': {
          await this._onScanFile(Boolean(data.onlyStripped));
          break;
        }
        case 'triggerBatchAnalysis': {
          await this._onRunBatchAnalysis(data.candidateIds);
          break;
        }
        case 'batchSelectionUpdated': {
          for (const c of this._batchCandidates) {
            c.selected = Boolean(data.allSelected);
          }
          break;
        }
        case 'updateCandidateSelection': {
          const cand = this._batchCandidates.find((c) => c.id === data.id);
          if (cand) {
            cand.selected = Boolean(data.selected);
            if (data.predictedName) {
              cand.predictedName = data.predictedName;
            }
          }
          break;
        }
        case 'applyBatchRenames': {
          const approved: BatchRenameItem[] = (data.items || []).map((it: any) => {
            const cand = this._batchCandidates.find((c) => c.id === it.id);
            return {
              originalName: it.originalName,
              predictedName: it.predictedName,
              context: cand?.context || it.context,
              signature: cand?.signature,
              insertDoc: Boolean(it.insertDoc)
            };
          });
          await this._onApplyBatchRenames(approved);
          break;
        }
        case 'openSettings': {
          vscode.commands.executeCommand('workbench.action.openSettings', 'marev');
          break;
        }
      }
    });

    this._updateWebview();
  }

  public setContext(context: ExtractedContext) {
    this._currentContext = context;
    this._currentSignature = undefined;
    this._errorMessage = undefined;
    this._isLoading = false;
    this._activeTab = 'single';
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

  public setBatchScanning(isScanning: boolean) {
    this._isScanning = isScanning;
    this._view?.webview.postMessage({
      type: 'updateScanStatus',
      isScanning
    });
  }

  public setBatchCandidates(candidates: BatchFunctionCandidate[], docName: string, onlyStripped = true) {
    this._batchCandidates = candidates;
    this._batchDocName = docName;
    this._onlyStripped = onlyStripped;
    this._activeTab = 'batch';
    this._isScanning = false;
    this._isBatchRunning = false;
    this._batchProgress = { completed: 0, total: candidates.length, currentFunc: '' };
    this._updateWebview();
    if (this._view) {
      this._view.show?.(true);
    }
  }

  public setBatchProgress(completed: number, total: number, currentFunc?: string) {
    this._isBatchRunning = completed < total;
    this._batchProgress = { completed, total, currentFunc: currentFunc ?? '' };
    this._view?.webview.postMessage({
      type: 'updateBatchProgress',
      progress: this._batchProgress,
      isRunning: this._isBatchRunning
    });
  }

  public updateBatchCandidate(candidate: BatchFunctionCandidate) {
    const idx = this._batchCandidates.findIndex((c) => c.id === candidate.id);
    if (idx !== -1) {
      this._batchCandidates[idx] = candidate;
    } else {
      this._batchCandidates.push(candidate);
    }
    this._view?.webview.postMessage({
      type: 'updateBatchCandidate',
      candidate
    });
  }

  public setError(error: string) {
    this._errorMessage = error;
    this._isLoading = false;
    this._isBatchRunning = false;
    this._isScanning = false;
    this._updateWebview();
  }

  private _updateWebview() {
    if (this._view) {
      this._view.webview.postMessage({
        type: 'updateState',
        activeTab: this._activeTab,
        context: this._currentContext,
        signature: this._currentSignature,
        isLoading: this._isLoading,
        errorMessage: this._errorMessage,
        batchCandidates: this._batchCandidates,
        batchDocName: this._batchDocName,
        batchProgress: this._batchProgress,
        isBatchRunning: this._isBatchRunning,
        isScanning: this._isScanning,
        onlyStripped: this._onlyStripped
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
      margin-bottom: 10px;
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

    .tab-bar {
      display: flex;
      gap: 6px;
      margin-bottom: 12px;
      background: rgba(0, 0, 0, 0.2);
      padding: 3px;
      border-radius: 6px;
      border: 1px solid var(--border-color);
    }
    .tab-btn {
      flex: 1;
      padding: 5px 8px;
      font-size: 11px;
      font-weight: 600;
      background: transparent;
      border: none;
      color: var(--text-muted);
      cursor: pointer;
      border-radius: 4px;
      transition: all 0.2s;
      text-align: center;
    }
    .tab-btn.active {
      background: var(--card-bg);
      color: #38bdf8;
      box-shadow: 0 1px 3px rgba(0,0,0,0.3);
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
    .btn-secondary:hover:not(:disabled) {
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
      padding: 24px 10px;
      color: var(--text-muted);
    }

    .candidate-card {
      border: 1px solid var(--border-color);
      background: rgba(15, 23, 42, 0.6);
      border-radius: 6px;
      padding: 10px;
      margin-bottom: 8px;
      transition: border-color 0.2s;
    }
    .candidate-card:hover {
      border-color: rgba(99, 102, 241, 0.5);
    }

    .candidate-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
    }

    .name-input {
      background: var(--code-bg);
      border: 1px solid var(--border-color);
      color: #38bdf8;
      font-family: monospace;
      font-size: 12px;
      padding: 4px 6px;
      border-radius: 4px;
      width: 100%;
      box-sizing: border-box;
      margin-top: 4px;
    }
    .name-input:focus {
      outline: none;
      border-color: var(--primary);
    }

    .progress-bar-bg {
      background: rgba(255, 255, 255, 0.1);
      height: 6px;
      border-radius: 3px;
      overflow: hidden;
      margin: 8px 0;
    }
    .progress-bar-fill {
      background: linear-gradient(90deg, var(--primary), var(--accent));
      height: 100%;
      width: 0%;
      transition: width 0.3s;
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

  <div class="tab-bar">
    <button class="tab-btn active" id="tabSingle">Single Function</button>
    <button class="tab-btn" id="tabBatch">File Batch Scan</button>
  </div>

  <div id="errorContainer"></div>

  <!-- SINGLE FUNCTION VIEW -->
  <div id="singleView">
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
  </div>

  <!-- BATCH SCAN VIEW -->
  <div id="batchView" style="display: none;">
    <div class="card">
      <div style="font-size: 12px; font-weight: 600; margin-bottom: 8px;">
        📁 Scan Entire Document
      </div>
      <div style="margin-bottom: 10px;">
        <label style="font-size: 11px; color: var(--text-muted); cursor: pointer; display: flex; align-items: center; gap: 6px;">
          <input type="checkbox" id="onlyStrippedCheck" checked>
          Only scan stripped/unnamed routines (FUN_*, sub_*)
        </label>
      </div>
      <button class="btn-secondary" id="scanDocumentBtn" style="width: 100%;">
        🔍 Find All Functions in File
      </button>
    </div>

    <div id="batchProgressCard" class="card" style="display: none;">
      <div style="display: flex; justify-content: space-between; font-size: 11px;">
        <span id="batchProgressLabel">Analyzing functions...</span>
        <span id="batchProgressCount">0 / 0</span>
      </div>
      <div class="progress-bar-bg">
        <div class="progress-bar-fill" id="batchProgressFill"></div>
      </div>
    </div>

    <div id="batchResultsSection" style="display: none;">
      <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px;">
        <span style="font-size: 12px; font-weight: 600;" id="batchFoundCount">0 Candidates</span>
        <div style="display: flex; gap: 6px;">
          <button class="settings-btn" id="selectAllBtn">Select All</button>
          <button class="settings-btn" id="deselectAllBtn">None</button>
        </div>
      </div>

      <button class="btn-primary" id="startBatchAgentBtn" style="margin-bottom: 10px;">
        <span>✦ Run AI Prediction on Candidates</span>
      </button>

      <div id="candidatesList"></div>

      <div style="position: sticky; bottom: 0; background: var(--bg-dark); padding: 8px 0; border-top: 1px solid var(--border-color); margin-top: 10px;">
        <button class="btn-primary" id="applyBatchBtn" style="background: linear-gradient(135deg, #059669 0%, #047857 100%);">
          <span>🚀 Apply Approved Replacements in File</span>
        </button>
      </div>
    </div>
  </div>

  <script>
    const vscode = acquireVsCodeApi();

    // DOM Elements
    const tabSingle = document.getElementById('tabSingle');
    const tabBatch = document.getElementById('tabBatch');
    const singleView = document.getElementById('singleView');
    const batchView = document.getElementById('batchView');

    const analyzeBtn = document.getElementById('analyzeBtn');
    const openSettingsBtn = document.getElementById('openSettingsBtn');
    const contextCard = document.getElementById('contextCard');
    const langBadge = document.getElementById('langBadge');
    const linesInfo = document.getElementById('linesInfo');
    const calleesCount = document.getElementById('calleesCount');
    const codeSnippet = document.getElementById('codeSnippet');
    const resultSection = document.getElementById('resultSection');
    const errorContainer = document.getElementById('errorContainer');

    // Batch DOM
    const scanDocumentBtn = document.getElementById('scanDocumentBtn');
    const onlyStrippedCheck = document.getElementById('onlyStrippedCheck');
    const batchProgressCard = document.getElementById('batchProgressCard');
    const batchProgressLabel = document.getElementById('batchProgressLabel');
    const batchProgressCount = document.getElementById('batchProgressCount');
    const batchProgressFill = document.getElementById('batchProgressFill');
    const batchResultsSection = document.getElementById('batchResultsSection');
    const batchFoundCount = document.getElementById('batchFoundCount');
    const startBatchAgentBtn = document.getElementById('startBatchAgentBtn');
    const candidatesList = document.getElementById('candidatesList');
    const applyBatchBtn = document.getElementById('applyBatchBtn');
    const selectAllBtn = document.getElementById('selectAllBtn');
    const deselectAllBtn = document.getElementById('deselectAllBtn');

    let currentContext = null;
    let currentSignature = null;
    let batchCandidates = [];

    // Tab Switching
    tabSingle.addEventListener('click', () => switchTab('single', true));
    tabBatch.addEventListener('click', () => switchTab('batch', true));

    function switchTab(tab, userInitiated = false) {
      if (tab === 'single') {
        tabSingle.classList.add('active');
        tabBatch.classList.remove('active');
        singleView.style.display = 'block';
        batchView.style.display = 'none';
      } else {
        tabBatch.classList.add('active');
        tabSingle.classList.remove('active');
        singleView.style.display = 'none';
        batchView.style.display = 'block';
        if (userInitiated && (!batchCandidates || batchCandidates.length === 0)) {
          triggerScan();
        }
      }
      if (userInitiated) {
        vscode.postMessage({ type: 'setTab', tab });
      }
    }

    function triggerScan() {
      setScanningUI(true);
      vscode.postMessage({
        type: 'scanFile',
        onlyStripped: onlyStrippedCheck.checked
      });
    }

    scanDocumentBtn.addEventListener('click', () => {
      triggerScan();
    });

    function setScanningUI(scanning) {
      if (scanning) {
        scanDocumentBtn.disabled = true;
        scanDocumentBtn.innerHTML = '<span class="spinner" style="width:12px;height:12px;border-width:2px;display:inline-block;vertical-align:middle;margin-right:6px;"></span> <span>Scanning File for Functions...</span>';
      } else {
        scanDocumentBtn.disabled = false;
        scanDocumentBtn.innerHTML = '🔍 Find All Functions in File';
      }
    }

    startBatchAgentBtn.addEventListener('click', () => {
      startBatchAgentBtn.disabled = true;
      startBatchAgentBtn.innerHTML = '<span class="spinner" style="width:12px;height:12px;border-width:2px;display:inline-block;vertical-align:middle;margin-right:6px;"></span> <span>Initiating AI Analysis...</span>';
      const selectedIds = batchCandidates.filter(c => c.selected !== false).map(c => c.id);
      vscode.postMessage({
        type: 'triggerBatchAnalysis',
        candidateIds: selectedIds
      });
    });

    selectAllBtn.addEventListener('click', () => {
      batchCandidates.forEach(c => c.selected = true);
      renderCandidates();
      vscode.postMessage({ type: 'batchSelectionUpdated', allSelected: true });
    });

    deselectAllBtn.addEventListener('click', () => {
      batchCandidates.forEach(c => c.selected = false);
      renderCandidates();
      vscode.postMessage({ type: 'batchSelectionUpdated', allSelected: false });
    });

    applyBatchBtn.addEventListener('click', () => {
      const approved = batchCandidates
        .filter(c => c.selected && c.predictedName && c.predictedName !== c.originalName)
        .map(c => ({
          id: c.id,
          originalName: c.originalName,
          predictedName: c.predictedName,
          context: c.context,
          insertDoc: c.insertDoc ?? true
        }));

      if (approved.length === 0) {
        alert('No functions selected for renaming. Check the boxes next to the functions you wish to approve.');
        return;
      }

      vscode.postMessage({
        type: 'applyBatchRenames',
        items: approved
      });
    });

    window.addEventListener('message', event => {
      const message = event.data;
      switch (message.type) {
        case 'setLoading':
          setLoadingUI(message.loading, message.message);
          break;
        case 'updateScanStatus':
          setScanningUI(message.isScanning);
          break;
        case 'updateState':
          renderState(message);
          break;
        case 'updateBatchProgress':
          updateProgressUI(message.progress, message.isRunning);
          break;
        case 'updateBatchCandidate':
          const idx = batchCandidates.findIndex(c => c.id === message.candidate.id);
          if (idx !== -1) {
            batchCandidates[idx] = message.candidate;
          } else {
            batchCandidates.push(message.candidate);
          }
          renderCandidates();
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

    function updateProgressUI(progress, isRunning) {
      if (isRunning) {
        batchProgressCard.style.display = 'block';
        batchProgressLabel.textContent = progress.currentFunc ? 'Analyzing: ' + progress.currentFunc : 'Analyzing functions...';
        batchProgressCount.textContent = (progress.completed || 0) + ' / ' + (progress.total || 0);
        const pct = progress.total > 0 ? Math.round((progress.completed / progress.total) * 100) : 0;
        batchProgressFill.style.width = pct + '%';
        startBatchAgentBtn.disabled = true;
        startBatchAgentBtn.innerHTML = '<span class="spinner" style="width:12px;height:12px;border-width:2px;display:inline-block;vertical-align:middle;margin-right:6px;"></span> <span>AI Agent Analyzing (' + (progress.completed || 0) + '/' + (progress.total || 0) + ')...</span>';
      } else {
        batchProgressCard.style.display = 'none';
        startBatchAgentBtn.disabled = false;
        startBatchAgentBtn.innerHTML = '<span>✦ Run AI Prediction on Candidates</span>';
      }
    }

    function renderState(state) {
      currentContext = state.context;
      currentSignature = state.signature;
      batchCandidates = state.batchCandidates || [];

      if (state.activeTab) {
        switchTab(state.activeTab, false);
      }

      setScanningUI(Boolean(state.isScanning));

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
        resultSection.innerHTML = '<div class="placeholder-state"><p>Select a function in the editor and run <strong>"MAREV: Identify Function"</strong> to begin.</p></div>';
      } else if (!state.isLoading && currentContext && !currentSignature) {
        resultSection.innerHTML = '';
      }

      if (state.isLoading) {
        setLoadingUI(true, 'AI Agent reverse-engineering function semantics...');
      } else {
        setLoadingUI(false);
      }

      // Handle Batch Candidates
      if (batchCandidates.length > 0) {
        batchResultsSection.style.display = 'block';
        batchFoundCount.textContent = batchCandidates.length + ' Candidates (' + (state.batchDocName || 'file') + ')';
        startBatchAgentBtn.style.display = 'block';
        applyBatchBtn.parentElement.style.display = 'block';
        renderCandidates();
      } else if (state.batchDocName && !state.isScanning) {
        batchResultsSection.style.display = 'block';
        batchFoundCount.textContent = '0 Candidates (' + state.batchDocName + ')';
        candidatesList.innerHTML = \`
          <div class="card" style="margin-top: 10px; background: rgba(30, 41, 59, 0.5); border-style: dashed; text-align: center; padding: 16px 12px;">
            <div style="font-weight: 600; font-size: 13px; color: var(--text-main); margin-bottom: 6px;">0 functions found in \${escapeHtml(state.batchDocName)}</div>
            <div style="font-size: 11px; color: var(--text-muted); line-height: 1.4;">
              \${state.onlyStripped !== false
                ? 'Only stripped/unnamed routines (FUN_*, sub_*) were scanned.<br><span style="color: var(--accent); font-weight: 500;">Tip: Uncheck "Only scan stripped" above to find all function declarations.</span>'
                : 'No function declarations were detected in the file.'
              }
            </div>
          </div>
        \`;
        startBatchAgentBtn.style.display = 'none';
        applyBatchBtn.parentElement.style.display = 'none';
      } else {
        batchResultsSection.style.display = 'none';
      }

      if (state.batchProgress) {
        updateProgressUI(state.batchProgress, state.isBatchRunning);
      }
    }

    function renderCandidates() {
      let html = '';
      for (const cand of batchCandidates) {
        const confPct = cand.signature ? Math.round(cand.signature.confidence * 100) : null;
        let badgeHtml = '';
        if (cand.status === 'analyzing') {
          badgeHtml = '<span class="spinner" style="width: 10px; height: 10px; border-width: 1.5px;"></span> <span style="font-size: 10px; color: var(--accent);">Analyzing...</span>';
        } else if (cand.status === 'done' && confPct !== null) {
          const badgeClass = confPct >= 60 ? 'badge-success' : 'badge-warning';
          badgeHtml = '<span class="badge ' + badgeClass + '">' + confPct + '%</span>';
          if (cand.signature?.semantic_category) {
            badgeHtml += ' <span class="badge badge-category">' + escapeHtml(cand.signature.semantic_category) + '</span>';
          }
        } else if (cand.status === 'error') {
          badgeHtml = '<span class="badge" style="background: rgba(239,68,68,0.2); color:#fca5a5;">Failed</span>';
        }

        const isChecked = cand.selected !== false;
        const insertDocChecked = cand.insertDoc !== false;
        const hasPredictedName = cand.predictedName && cand.predictedName !== cand.originalName;

        html += \`
          <div class="candidate-card" id="card-\${cand.id}" style="\${hasPredictedName ? 'border-color: rgba(6, 182, 212, 0.5); background: rgba(15, 23, 42, 0.7);' : ''}">
            <div class="candidate-header">
              <label style="display: flex; align-items: center; gap: 6px; cursor: pointer; font-weight: 600; font-family: monospace; flex-wrap: wrap;">
                <input type="checkbox" class="cand-select" data-id="\${cand.id}" \${isChecked ? 'checked' : ''}>
                <span>\${escapeHtml(cand.originalName)}</span>
                \${hasPredictedName ? \`<span style="color: var(--accent); font-weight: 700; word-break: break-all;">➔ \${escapeHtml(cand.predictedName)}</span>\` : ''}
              </label>
              <div>\${badgeHtml}</div>
            </div>

            <div style="margin-top: 6px;">
              <div style="font-size: 10px; color: var(--text-muted); display: flex; justify-content: space-between; align-items: center; margin-bottom: 2px;">
                <span>Proposed Semantic Name:</span>
                \${hasPredictedName ? '<span style="color: var(--success); font-weight: 600; font-size: 10px;">✓ AI Inferred</span>' : ''}
              </div>
              <input type="text" class="name-input" data-id="\${cand.id}" value="\${escapeHtml(cand.predictedName || cand.originalName)}" style="\${hasPredictedName ? 'border-color: var(--accent); color: #38bdf8; font-weight: 600;' : ''}">
            </div>

            \${cand.signature?.summary ? \`
              <div style="font-size: 11px; color: var(--text-muted); margin-top: 4px; line-height: 1.3;">
                \${escapeHtml(cand.signature.summary)}
              </div>
            \` : ''}

            \${cand.error ? \`
              <div style="font-size: 11px; color: #fca5a5; margin-top: 6px; background: rgba(239, 68, 68, 0.15); border: 1px solid rgba(239, 68, 68, 0.3); padding: 5px 8px; border-radius: 4px; word-break: break-word;">
                <strong>Error:</strong> \${escapeHtml(cand.error)}
              </div>
            \` : ''}

            <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 6px; font-size: 10px; color: var(--text-muted);">
              <span>Lines \${cand.context.startLine + 1}-\${cand.context.endLine + 1}</span>
              <label style="cursor: pointer; display: flex; align-items: center; gap: 4px;">
                <input type="checkbox" class="doc-select" data-id="\${cand.id}" \${insertDocChecked ? 'checked' : ''}>
                Include Doxygen doc
              </label>
            </div>
          </div>
        \`;
      }

      candidatesList.innerHTML = html;

      // Attach event listeners
      document.querySelectorAll('.cand-select').forEach(cb => {
        cb.addEventListener('change', e => {
          const id = e.target.dataset.id;
          const cand = batchCandidates.find(c => c.id === id);
          if (cand) {
            cand.selected = e.target.checked;
            vscode.postMessage({
              type: 'updateCandidateSelection',
              id,
              selected: cand.selected,
              predictedName: cand.predictedName
            });
          }
        });
      });

      document.querySelectorAll('.name-input').forEach(input => {
        input.addEventListener('change', e => {
          const id = e.target.dataset.id;
          const cand = batchCandidates.find(c => c.id === id);
          if (cand) {
            cand.predictedName = e.target.value.trim();
            vscode.postMessage({
              type: 'updateCandidateSelection',
              id,
              selected: cand.selected,
              predictedName: cand.predictedName
            });
          }
        });
      });

      document.querySelectorAll('.doc-select').forEach(cb => {
        cb.addEventListener('change', e => {
          const id = e.target.dataset.id;
          const cand = batchCandidates.find(c => c.id === id);
          if (cand) {
            cand.insertDoc = e.target.checked;
          }
        });
      });
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

    // Handshake: notify extension that webview is ready
    vscode.postMessage({ type: 'webviewReady' });
  </script>
</body>
</html>`;
  }
}
