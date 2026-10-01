# 01: Tracer Bullet — Extension Skeleton, Command & Sidebar Webview Loop

**What to build:**
A functioning VS Code extension in `vscode-extension/` that can be loaded in the VS Code Extension Host. When the user selects code in any editor and clicks the editor context menu item "MAREV: Identify Function with AI Agent" (or presses the keyboard shortcut / runs the command), the MAREV sidebar webview automatically opens, receives the selected text, and renders a signature card with mock data confirming the full communication loop from editor to sidebar.

**Blocked by:** None (can start immediately)

**Status:** resolved

- [x] Extension manifest (`package.json`) defines `marev.identifyFunction` command, editor context menu entry, and `marev.sidebar` view container.
- [x] TypeScript build configuration (`tsconfig.json`, `esbuild.js` / build scripts) compiles extension into `dist/extension.js`.
- [x] Custom `WebviewViewProvider` serves the sidebar HTML/CSS/JS.
- [x] Active editor selection is captured and sent via `postMessage` to the sidebar webview.
- [x] Sidebar webview displays the received snippet, status indicator, and preview card.

## Answer

Created standalone VS Code extension package in `vscode-extension/` with manifest, custom activity bar view container, WebviewViewProvider for `marev.sidebar`, editor context menu integration, and TypeScript build pipeline via esbuild producing `dist/extension.js`. Selection capture and state passing to Webview verified.

