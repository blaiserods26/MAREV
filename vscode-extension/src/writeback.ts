import * as vscode from 'vscode';
import { RecoveredSignature, ExtractedContext } from './types';
import { generateDoxygenComment } from './doxygen';

export { generateDoxygenComment };

export async function renameFunctionInDocument(
  editor: vscode.TextEditor,
  context: ExtractedContext,
  newName: string
): Promise<boolean> {
  const oldName = context.functionName;
  if (!oldName) {
    vscode.window.showWarningMessage('MAREV: Could not determine original function name to rename.');
    return false;
  }

  if (oldName === newName) {
    vscode.window.showInformationMessage(`MAREV: Function name is already "${newName}".`);
    return true;
  }

  const doc = editor.document;
  const text = doc.getText();

  // Match identifier as whole word
  const regex = new RegExp(`\\b${escapeRegExp(oldName)}\\b`, 'g');
  const edit = new vscode.WorkspaceEdit();

  let count = 0;
  let match: RegExpExecArray | null;

  while ((match = regex.exec(text)) !== null) {
    const startPos = doc.positionAt(match.index);
    const endPos = doc.positionAt(match.index + oldName.length);
    const range = new vscode.Range(startPos, endPos);
    edit.replace(doc.uri, range, newName);
    count++;
  }

  if (count === 0) {
    vscode.window.showWarningMessage(`MAREV: No occurrences of "${oldName}" found in active file.`);
    return false;
  }

  const success = await vscode.workspace.applyEdit(edit);
  if (success) {
    vscode.window.showInformationMessage(
      `MAREV: Renamed ${count} occurrences of "${oldName}" -> "${newName}".`
    );
  } else {
    vscode.window.showErrorMessage(`MAREV: Failed to apply rename edit to "${newName}".`);
  }
  return success;
}

export async function insertDocumentationInDocument(
  editor: vscode.TextEditor,
  context: ExtractedContext,
  sig: RecoveredSignature
): Promise<boolean> {
  const docblock = generateDoxygenComment(sig);
  const targetLine = Math.max(0, context.startLine);
  const position = new vscode.Position(targetLine, 0);

  const success = await editor.edit((editBuilder) => {
    editBuilder.insert(position, docblock + '\n');
  });

  if (success) {
    vscode.window.showInformationMessage(
      `MAREV: Inserted C Doxygen documentation for "${sig.name}".`
    );
  } else {
    vscode.window.showErrorMessage('MAREV: Failed to insert documentation.');
  }

  return success;
}

export interface BatchRenameItem {
  originalName: string;
  predictedName: string;
  context: ExtractedContext;
  signature?: RecoveredSignature;
  insertDoc?: boolean;
}

export async function applyBatchRenamesInDocument(
  editor: vscode.TextEditor,
  items: BatchRenameItem[]
): Promise<{ totalOccurrences: number; functionsCount: number; success: boolean }> {
  const doc = editor.document;
  const edit = new vscode.WorkspaceEdit();
  const text = doc.getText();
  let totalOccurrences = 0;
  let functionsCount = 0;

  // 1. Collect all rename edits
  for (const item of items) {
    if (!item.originalName || !item.predictedName || item.originalName === item.predictedName) {
      continue;
    }
    const regex = new RegExp(`\\b${escapeRegExp(item.originalName)}\\b`, 'g');
    let match: RegExpExecArray | null;
    let occurrencesForItem = 0;

    while ((match = regex.exec(text)) !== null) {
      const startPos = doc.positionAt(match.index);
      const endPos = doc.positionAt(match.index + item.originalName.length);
      edit.replace(doc.uri, new vscode.Range(startPos, endPos), item.predictedName);
      occurrencesForItem++;
    }

    if (occurrencesForItem > 0) {
      totalOccurrences += occurrencesForItem;
      functionsCount++;
    }
  }

  // 2. Collect docblock insertions if requested (insert bottom to top)
  const itemsWithDoc = items
    .filter((it) => it.insertDoc && it.signature && it.context)
    .sort((a, b) => b.context.startLine - a.context.startLine);

  for (const it of itemsWithDoc) {
    if (it.signature) {
      const docblock = generateDoxygenComment(it.signature);
      const pos = new vscode.Position(Math.max(0, it.context.startLine), 0);
      edit.insert(doc.uri, pos, docblock + '\n');
    }
  }

  const success = await vscode.workspace.applyEdit(edit);
  if (success) {
    vscode.window.showInformationMessage(
      `MAREV: Batch replaced ${functionsCount} function names (${totalOccurrences} occurrences in file).`
    );
  } else {
    vscode.window.showErrorMessage('MAREV: Failed to apply batch renames.');
  }

  return { totalOccurrences, functionsCount, success };
}

function escapeRegExp(string: string): string {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

