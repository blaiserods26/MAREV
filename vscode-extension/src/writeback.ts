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

function escapeRegExp(string: string): string {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}
