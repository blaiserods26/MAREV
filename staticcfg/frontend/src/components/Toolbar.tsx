import React from 'react';
import { Upload, GitFork, Activity, AlertTriangle, FileCode } from 'lucide-react';

interface ToolbarProps {
  activeFile: string | null;
  functionCount: number;
  currentFunction: string | null;
  cyclomaticComplexity: number | null;
  unreachableCount: number;
  showUnreachable: boolean;
  onToggleUnreachable: () => void;
  onOpenUploadModal: () => void;
  onOpenCallGraph: () => void;
}

export const Toolbar: React.FC<ToolbarProps> = ({
  activeFile,
  functionCount,
  currentFunction,
  cyclomaticComplexity,
  unreachableCount,
  showUnreachable,
  onToggleUnreachable,
  onOpenUploadModal,
  onOpenCallGraph,
}) => {
  return (
    <header
      style={{
        height: '42px',
        backgroundColor: 'var(--bg-header)',
        borderBottom: '1px solid var(--border-color)',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 14px',
        userSelect: 'none',
      }}
    >
      {/* Left section: App Brand & Active File */}
      <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <FileCode size={18} color="var(--color-accent)" />
          <span style={{ fontWeight: 800, fontSize: '14px', color: 'var(--text-bright)', letterSpacing: '0.5px' }}>
            StaticCFG
          </span>
          <span style={{ fontSize: '10px', color: 'var(--text-muted)', backgroundColor: 'var(--bg-card)', padding: '2px 6px', borderRadius: '3px' }}>
            x86-64
          </span>
        </div>

        {activeFile && (
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '11px', color: 'var(--text-main)', borderLeft: '1px solid var(--border-color)', paddingLeft: '14px' }}>
            <span style={{ color: 'var(--text-muted)' }}>File:</span>
            <span style={{ fontWeight: 600, color: 'var(--color-address)', fontFamily: 'var(--font-mono)' }}>
              {activeFile}
            </span>
            <span style={{ fontSize: '10px', backgroundColor: '#1c2d3d', color: '#58a6ff', padding: '1px 6px', borderRadius: '10px' }}>
              {functionCount} functions
            </span>
          </div>
        )}
      </div>

      {/* Middle section: Active Function Metrics */}
      {currentFunction && (
        <div style={{ display: 'flex', alignItems: 'center', gap: '12px', fontSize: '11px', fontFamily: 'var(--font-mono)' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
            <span style={{ color: 'var(--text-muted)' }}>Func:</span>
            <span style={{ fontWeight: 700, color: 'var(--text-bright)' }}>{currentFunction}</span>
          </div>

          {cyclomaticComplexity !== null && (
            <div style={{ display: 'flex', alignItems: 'center', gap: '4px', backgroundColor: '#162338', border: '1px solid #1f3a5f', padding: '2px 8px', borderRadius: '4px' }}>
              <Activity size={12} color="var(--color-accent)" />
              <span style={{ color: 'var(--text-muted)', fontSize: '10px' }}>Complexity:</span>
              <span style={{ fontWeight: 700, color: 'var(--color-accent)' }}>{cyclomaticComplexity}</span>
            </div>
          )}

          {unreachableCount > 0 && (
            <button
              onClick={onToggleUnreachable}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '4px',
                backgroundColor: showUnreachable ? '#381616' : '#21262d',
                border: '1px solid #f85149',
                color: '#f85149',
                padding: '2px 8px',
                borderRadius: '4px',
                cursor: 'pointer',
                fontSize: '10px',
                fontWeight: 600,
              }}
            >
              <AlertTriangle size={12} />
              {unreachableCount} Unreachable {showUnreachable ? '(Highlighted)' : ''}
            </button>
          )}
        </div>
      )}

      {/* Right section: Action Buttons */}
      <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
        <button
          onClick={onOpenCallGraph}
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: '6px',
            backgroundColor: 'var(--bg-card)',
            border: '1px solid var(--border-color)',
            color: 'var(--text-main)',
            padding: '5px 10px',
            borderRadius: '4px',
            cursor: 'pointer',
            fontSize: '11px',
            fontWeight: 500,
            transition: 'background 0.1s ease',
          }}
        >
          <GitFork size={13} color="var(--color-accent)" /> Call Graph
        </button>

        <button
          onClick={onOpenUploadModal}
          style={{
            display: 'flex',
            alignItems: 'center',
            gap: '6px',
            backgroundColor: '#238636',
            border: '1px solid #2ea043',
            color: '#ffffff',
            padding: '5px 12px',
            borderRadius: '4px',
            cursor: 'pointer',
            fontSize: '11px',
            fontWeight: 600,
            transition: 'background 0.1s ease',
          }}
        >
          <Upload size={13} /> Open ASM
        </button>
      </div>
    </header>
  );
};
