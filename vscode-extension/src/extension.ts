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

let sidebarProvider: MarevSidebarProvider | undefined;

export function activate(context: vscode.ExtensionContext) {
  const getAgentConfig = (): AgentConfig => {
    const cfg = vscode.workspace.getConfiguration('marev');
    return {
      provider: cfg.get<'gemini' | 'ollama'>('provider', 'gemini'),
      geminiApiKey: cfg.get<string>('geminiApiKey', ''),
      geminiModel: cfg.get<string>('geminiModel', 'gemini-2.5-flash'),
      ollamaEndpoint: cfg.get<string>('ollamaEndpoint', 'http://localhost:11434'),
      ollamaModel: cfg.get<string>('ollamaModel', 'qwen2.5-coder:latest'),
      autoExpandContext: cfg.get<boolean>('autoExpandContext', true)
    };
  };

  const agentEngine = new AgentEngine(getAgentConfig());

  // Listen for config changes
  context.subscriptions.push(
    vscode.workspace.onDidChangeConfiguration(e => {
      if (e.affectsConfiguration('marev')) {
        agentEngine.updateConfig(getAgentConfig());
      }
    })
  );

  // Handler for running analysis
  const onRunAnalysis = async (extractedContext: ExtractedContext) => {
    if (!sidebarProvider) return;

    const ready = await agentEngine.isProviderReady();
    if (!ready) {
      const cfg = getAgentConfig();
      if (cfg.provider === 'gemini') {
        const choice = await vscode.window.showErrorMessage(
          'MAREV: Gemini API key is missing. Please configure your API key.',
          'Open Settings'
        );
        if (choice === 'Open Settings') {
          vscode.commands.executeCommand('workbench.action.openSettings', 'marev.geminiApiKey');
        }
        sidebarProvider.setError('Gemini API key is not configured. Set "marev.geminiApiKey" in Settings or define GEMINI_API_KEY.');
      } else {
        sidebarProvider.setError(`Ollama is not reachable at ${cfg.ollamaEndpoint}. Ensure the Ollama daemon is running.`);
      }
      return;
    }

    sidebarProvider.setLoading(true, `Agent (${agentEngine.providerName}) reverse-engineering function semantics...`);

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

  const onScanFile = async (onlyStripped: boolean) => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('MAREV: No active editor open to scan.');
      return;
    }

    const doc = editor.document;
    const lines = doc.getText().split(/\r?\n/);
    const functions = extractAllFunctionsInDocument(lines, doc.languageId, onlyStripped);

    if (functions.length === 0) {
      vscode.window.showInformationMessage(
        onlyStripped
          ? 'MAREV: No stripped/generic functions found in active document.'
          : 'MAREV: No function declarations found in active document.'
      );
    }

    const candidates: BatchFunctionCandidate[] = functions.map((f, i) => ({
      id: `cand-${i}-${f.functionName || 'fn'}`,
      originalName: f.functionName || `sub_${i}`,
      predictedName: f.functionName || `sub_${i}`,
      context: f,
      selected: true,
      status: 'pending'
    }));

    const pathParts = doc.fileName.split(/[\\/]/);
    const fileName = pathParts[pathParts.length - 1];

    sidebarProvider?.setBatchCandidates(candidates, fileName);
  };

  const onRunBatchAnalysis = async (candidates: BatchFunctionCandidate[]) => {
    if (!sidebarProvider) return;

    const ready = await agentEngine.isProviderReady();
    if (!ready) {
      vscode.window.showErrorMessage('MAREV: LLM Provider is not ready. Check extension settings.');
      return;
    }

    const toProcess = candidates.filter((c) => c.selected);
    let completed = 0;

    for (const cand of toProcess) {
      cand.status = 'analyzing';
      sidebarProvider.updateBatchCandidate(cand);
      sidebarProvider.setBatchProgress(completed, toProcess.length, cand.originalName);

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
      sidebarProvider.setBatchProgress(completed, toProcess.length, cand.originalName);
    }

    sidebarProvider.setBatchProgress(toProcess.length, toProcess.length, '');
    vscode.window.showInformationMessage(
      `MAREV: Completed AI analysis for ${completed} functions in file.`
    );
  };

  const onApplyBatchRenames = async (items: BatchRenameItem[]) => {
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showWarningMessage('MAREV: No active editor to apply batch renames.');
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
    vscode.window.registerWebviewViewProvider(
      MarevSidebarProvider.viewType,
      sidebarProvider
    )
  );

  // Command: Identify Function with AI Agent
  context.subscriptions.push(
    vscode.commands.registerCommand('marev.identifyFunction', async () => {
      const editor = vscode.window.activeTextEditor;
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
        const text = selection.isEmpty
          ? doc.lineAt(selection.active.line).text
          : doc.getText(selection);
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
        const editor = vscode.window.activeTextEditor;
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
        const editor = vscode.window.activeTextEditor;
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
