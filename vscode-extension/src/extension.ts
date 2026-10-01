import * as vscode from 'vscode';
import { MarevSidebarProvider } from './sidebarProvider';
import { ExtractedContext, RecoveredSignature, AgentConfig, BatchFunctionCandidate } from './types';
import { extractFunctionContext, extractAllFunctionsInDocument } from './contextExtractor';
import { AgentEngine } from './agent/agentEngine';
import {
  renameFunctionInDocument,
  insertDocumentationInDocument,
  applyBatchRenamesInDocument,
  BatchRenameItem
} from './writeback';
import { loadWorkspaceEnv } from './envLoader';

let sidebarProvider: MarevSidebarProvider | undefined;
let lastActiveEditor: vscode.TextEditor | undefined = vscode.window.activeTextEditor;

function isTargetDocument(doc?: vscode.TextDocument): boolean {
  if (!doc) return false;
  const lang = doc.languageId.toLowerCase();
  const file = doc.fileName.toLowerCase();
  return (
    lang === 'c' ||
    lang === 'cpp' ||
    lang.includes('asm') ||
    lang.includes('assembly') ||
    file.endsWith('.c') ||
    file.endsWith('.cpp') ||
    file.endsWith('.cc') ||
    file.endsWith('.cxx') ||
    file.endsWith('.h') ||
    file.endsWith('.hpp') ||
    file.endsWith('.s') ||
    file.endsWith('.asm')
  );
}

function getTargetEditor(): vscode.TextEditor | undefined {
  if (vscode.window.activeTextEditor && isTargetDocument(vscode.window.activeTextEditor.document)) {
    return vscode.window.activeTextEditor;
  }
  if (lastActiveEditor && !lastActiveEditor.document.isClosed && isTargetDocument(lastActiveEditor.document)) {
    return lastActiveEditor;
  }
  const visibleTarget = vscode.window.visibleTextEditors.find((e) => isTargetDocument(e.document));
  if (visibleTarget) {
    return visibleTarget;
  }
  if (vscode.window.activeTextEditor) {
    return vscode.window.activeTextEditor;
  }
  if (lastActiveEditor && !lastActiveEditor.document.isClosed) {
    return lastActiveEditor;
  }
  if (vscode.window.visibleTextEditors.length > 0) {
    return vscode.window.visibleTextEditors[0];
  }
  return undefined;
}

export function activate(context: vscode.ExtensionContext) {
  // Track active editor transitions
  context.subscriptions.push(
    vscode.window.onDidChangeActiveTextEditor((editor) => {
      if (editor) {
        lastActiveEditor = editor;
      }
    })
  );

  const getAgentConfig = (): AgentConfig => {
    const cfg = vscode.workspace.getConfiguration('marev');
    const env = loadWorkspaceEnv();

    const provider = cfg.get<'gemini' | 'ollama'>('provider', 'gemini');
    const geminiApiKey = (
      cfg.get<string>('geminiApiKey', '') ||
      env.apiKey ||
      process.env.GEMINI_API_KEY ||
      process.env.GOOGLE_API_KEY ||
      ''
    ).trim();

    const geminiModel = cfg.get<string>('geminiModel', '') || env.model || 'gemini-2.5-flash';
    const ollamaEndpoint = cfg.get<string>('ollamaEndpoint', '') || env.ollamaEndpoint || 'http://localhost:11434';
    const ollamaModel = cfg.get<string>('ollamaModel', '') || env.ollamaModel || 'qwen2.5-coder:latest';
    const autoExpandContext = cfg.get<boolean>('autoExpandContext', true);

    return {
      provider,
      geminiApiKey,
      geminiModel,
      ollamaEndpoint,
      ollamaModel,
      autoExpandContext
    };
  };

  const agentEngine = new AgentEngine(getAgentConfig());

  // Listen for config changes
  context.subscriptions.push(
    vscode.workspace.onDidChangeConfiguration((e) => {
      if (e.affectsConfiguration('marev')) {
        agentEngine.updateConfig(getAgentConfig());
      }
    })
  );

  // Handler for running single-function analysis
  const onRunAnalysis = async (extractedContext: ExtractedContext) => {
    if (!sidebarProvider) return;

    const ready = await agentEngine.isProviderReady();
    if (!ready) {
      const cfg = getAgentConfig();
      if (cfg.provider === 'gemini') {
        const choice = await vscode.window.showErrorMessage(
          'MAREV: Gemini API key is missing. Please configure your API key or add it to .env.',
          'Open Settings'
        );
        if (choice === 'Open Settings') {
          vscode.commands.executeCommand('workbench.action.openSettings', 'marev.geminiApiKey');
        }
        sidebarProvider.setError(
          'Gemini API key is not configured. Set "marev.geminiApiKey" in Settings or define GEMINI_API_KEY in .env.'
        );
      } else {
        sidebarProvider.setError(
          `Ollama is not reachable at ${cfg.ollamaEndpoint}. Ensure the Ollama daemon is running.`
        );
      }
      return;
    }

    sidebarProvider.setLoading(
      true,
      `Agent (${agentEngine.providerName}) reverse-engineering function semantics...`
    );

    try {
      const result = await agentEngine.analyzeFunction(extractedContext);
      sidebarProvider.setSignatureResult(result);
    } catch (err: any) {
      sidebarProvider.setError(err.message || String(err));
    }
  };

  const onRename = async (signature: RecoveredSignature, extractedContext: ExtractedContext) => {
    vscode.commands.executeCommand('marev.renameFunction', signature, extractedContext);
  };

  const onInsertDoc = async (signature: RecoveredSignature, extractedContext: ExtractedContext) => {
    vscode.commands.executeCommand('marev.insertDocumentation', signature, extractedContext);
  };

  const onScanFile = async (onlyStripped: boolean): Promise<BatchFunctionCandidate[]> => {
    sidebarProvider?.setBatchScanning(true);
    try {
      const editor = getTargetEditor();
      if (!editor) {
        vscode.window.showWarningMessage('MAREV: No active or visible editor open to scan.');
        sidebarProvider?.setBatchScanning(false);
        return [];
      }

      const doc = editor.document;
      const lines = doc.getText().split(/\r?\n/);
      const functions = extractAllFunctionsInDocument(lines, doc.languageId, onlyStripped);

      const pathParts = doc.fileName.split(/[\\/]/);
      const fileName = pathParts[pathParts.length - 1];

      const candidates: BatchFunctionCandidate[] = functions.map((f, i) => ({
        id: `cand-${i}-${f.functionName || 'fn'}`,
        originalName: f.functionName || `sub_${i}`,
        predictedName: f.functionName || `sub_${i}`,
        context: f,
        selected: true,
        status: 'pending'
      }));

      sidebarProvider?.setBatchCandidates(candidates, fileName, onlyStripped);

      if (candidates.length === 0) {
        vscode.window.showInformationMessage(
          onlyStripped
            ? `MAREV: No stripped/generic functions found in ${fileName}. (Try unchecking 'Only scan stripped')`
            : `MAREV: No function declarations found in ${fileName}.`
        );
      } else {
        vscode.window.showInformationMessage(
          `MAREV: Found ${candidates.length} functions in ${fileName}.`
        );
      }

      return candidates;
    } finally {
      sidebarProvider?.setBatchScanning(false);
    }
  };

  const onRunBatchAnalysis = async (candidateIds?: string[]) => {
    if (!sidebarProvider) return;

    let candidates = sidebarProvider.getBatchCandidates();
    if (candidates.length === 0) {
      // Auto-scan file if not scanned yet
      candidates = await onScanFile(true);
    }

    if (candidates.length === 0) {
      vscode.window.showWarningMessage('MAREV: No functions found to analyze in active document.');
      return;
    }

    const ready = await agentEngine.isProviderReady();
    if (!ready) {
      const cfg = getAgentConfig();
      const msg =
        cfg.provider === 'gemini'
          ? 'Gemini API key is missing. Set "marev.geminiApiKey" in Settings or in .env.'
          : `Ollama is not reachable at ${cfg.ollamaEndpoint}.`;
      vscode.window.showErrorMessage(`MAREV: ${msg}`);
      sidebarProvider.setError(msg);
      return;
    }

    // Determine target candidates to process
    let toProcess: BatchFunctionCandidate[];
    if (candidateIds && candidateIds.length > 0) {
      const idSet = new Set(candidateIds);
      toProcess = candidates.filter((c) => idSet.has(c.id));
    } else {
      toProcess = candidates.filter((c) => c.selected !== false);
      if (toProcess.length === 0) {
        toProcess = candidates;
      }
    }

    if (toProcess.length === 0) {
      vscode.window.showWarningMessage('MAREV: No functions selected for AI analysis.');
      return;
    }

    let completed = 0;
    const total = toProcess.length;

    try {
      for (const cand of toProcess) {
        cand.status = 'analyzing';
        sidebarProvider.updateBatchCandidate(cand);
        sidebarProvider.setBatchProgress(completed, total, cand.originalName);

        try {
          const sig = await agentEngine.analyzeFunction(cand.context);
          cand.signature = sig;
          cand.predictedName = sig.name;
          cand.status = 'done';
        } catch (err: any) {
          cand.status = 'error';
          cand.error = err.message || String(err);
        }

        completed++;
        sidebarProvider.updateBatchCandidate(cand);
        sidebarProvider.setBatchProgress(completed, total, cand.originalName);

        // Polite delay between calls to prevent bursting LLM rate limits
        await new Promise((r) => setTimeout(r, 250));
      }

      vscode.window.showInformationMessage(
        `MAREV: Completed AI analysis for ${completed} functions in file.`
      );
    } finally {
      sidebarProvider.setBatchProgress(total, total, '');
    }
  };

  const onApplyBatchRenames = async (items: BatchRenameItem[]) => {
    const editor = getTargetEditor();
    if (!editor) {
      vscode.window.showWarningMessage('MAREV: No active or visible editor to apply batch renames.');
      return;
    }

    await applyBatchRenamesInDocument(editor, items);
  };

  // Register Webview View Provider
  sidebarProvider = new MarevSidebarProvider(
    context.extensionUri,
    onRunAnalysis,
    onRename,
    onInsertDoc,
    onScanFile,
    onRunBatchAnalysis,
    onApplyBatchRenames
  );

  context.subscriptions.push(
    vscode.window.registerWebviewViewProvider(MarevSidebarProvider.viewType, sidebarProvider)
  );

  // Command: Identify Function with AI Agent
  context.subscriptions.push(
    vscode.commands.registerCommand('marev.identifyFunction', async () => {
      const editor = getTargetEditor();
      if (!editor) {
        vscode.window.showWarningMessage('MAREV: No active editor open.');
        return;
      }

      const config = vscode.workspace.getConfiguration('marev');
      const autoExpand = config.get<boolean>('autoExpandContext', true);

      const doc = editor.document;
      const lines = doc.getText().split(/\r?\n/);
      const selection = editor.selection;

      let extractedContext: ExtractedContext;

      if (autoExpand) {
        const selStart = selection.isEmpty ? undefined : selection.start.line;
        const selEnd = selection.isEmpty ? undefined : selection.end.line;
        extractedContext = extractFunctionContext(
          lines,
          selection.active.line,
          doc.languageId,
          selStart,
          selEnd
        );
      } else {
        const text = selection.isEmpty ? doc.lineAt(selection.active.line).text : doc.getText(selection);
        extractedContext = {
          targetCode: text,
          languageId: doc.languageId,
          functionName: undefined,
          isEnclosing: false,
          startLine: selection.start.line,
          endLine: selection.end.line,
          callees: []
        };
      }

      // Ensure sidebar is visible and pass context
      await vscode.commands.executeCommand('marev.sidebar.focus');
      sidebarProvider?.setContext(extractedContext);
    })
  );

  // Command: Open Sidebar
  context.subscriptions.push(
    vscode.commands.registerCommand('marev.openSidebar', async () => {
      await vscode.commands.executeCommand('marev.sidebar.focus');
    })
  );

  // Command: Rename Function
  context.subscriptions.push(
    vscode.commands.registerCommand(
      'marev.renameFunction',
      async (signature?: RecoveredSignature, extractedContext?: ExtractedContext) => {
        const editor = getTargetEditor();
        if (!editor) {
          vscode.window.showWarningMessage('MAREV: No active editor open.');
          return;
        }

        if (!signature || !extractedContext) {
          vscode.window.showWarningMessage('MAREV: Run AI identification first to obtain a predicted name.');
          return;
        }

        await renameFunctionInDocument(editor, extractedContext, signature.name);
      }
    )
  );

  // Command: Insert Documentation
  context.subscriptions.push(
    vscode.commands.registerCommand(
      'marev.insertDocumentation',
      async (signature?: RecoveredSignature, extractedContext?: ExtractedContext) => {
        const editor = getTargetEditor();
        if (!editor) {
          vscode.window.showWarningMessage('MAREV: No active editor open.');
          return;
        }

        if (!signature || !extractedContext) {
          vscode.window.showWarningMessage('MAREV: Run AI identification first to obtain signature data.');
          return;
        }

        await insertDocumentationInDocument(editor, extractedContext, signature);
      }
    )
  );

  // Command: Scan Complete File for Functions
  context.subscriptions.push(
    vscode.commands.registerCommand('marev.scanFile', async () => {
      await vscode.commands.executeCommand('marev.sidebar.focus');
      await onScanFile(true);
    })
  );
}

export function deactivate() {}
