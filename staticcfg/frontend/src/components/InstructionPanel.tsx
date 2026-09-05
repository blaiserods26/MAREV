import React from 'react';
import { BasicBlock, Instruction } from '../types/cfg';
import { Terminal, X } from 'lucide-react';

interface InstructionPanelProps {
  block: BasicBlock | null;
  functionName: string | null;
  onClose: () => void;
}

export const InstructionPanel: React.FC<InstructionPanelProps> = ({
  block,
  functionName,
  onClose,
}) => {
  if (!block) {
    return (
      <div
        style={{
          height: '180px',
          backgroundColor: 'var(--bg-panel)',
          borderTop: '1px solid var(--border-color)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          color: 'var(--text-muted)',
          fontSize: '11px',
          fontFamily: 'var(--font-mono)',
        }}
      >
        Click any Basic Block node in the graph to inspect full assembly instructions.
      </div>
    );
  }

  const isSpecial = block.id === 'EXIT' || block.id === 'UNKNOWN' || block.id.startsWith('EXTERNAL_');

  return (
    <div
      style={{
        height: '210px',
        backgroundColor: 'var(--bg-panel)',
        borderTop: '1px solid var(--border-color)',
        display: 'flex',
        flexDirection: 'column',
        fontFamily: 'var(--font-mono)',
        fontSize: '11px',
      }}
    >
      {/* Panel Header */}
      <div
        style={{
          padding: '6px 12px',
          backgroundColor: 'var(--bg-header)',
          borderBottom: '1px solid var(--border-color)',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
        }}
      >
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <Terminal size={14} color="var(--color-accent)" />
          <span style={{ fontWeight: 700, color: 'var(--text-bright)' }}>
            Selected Block: {block.id}
          </span>
          {functionName && (
            <span style={{ color: 'var(--text-muted)', fontSize: '10px' }}>
              Function: {functionName}
            </span>
          )}
          {!isSpecial && (
            <span style={{ color: 'var(--color-address)', fontSize: '10px', marginLeft: '8px' }}>
              Address Range: 0x{block.start_address.toString(16)} → 0x{block.end_address.toString(16)} ({block.instructions.length} instructions)
            </span>
          )}
        </div>

        <button
          onClick={onClose}
          style={{
            background: 'transparent',
            border: 'none',
            color: 'var(--text-muted)',
            cursor: 'pointer',
            padding: '2px',
            display: 'flex',
            alignItems: 'center',
          }}
          title="Close Inspector"
        >
          <X size={14} />
        </button>
      </div>

      {/* Instruction Table */}
      <div style={{ flex: 1, overflowY: 'auto', padding: '4px 0' }}>
        {isSpecial ? (
          <div style={{ padding: '16px', color: 'var(--text-muted)', fontStyle: 'italic' }}>
            Synthetic node {block.id}. No internal instructions.
          </div>
        ) : (
          <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
            <thead>
              <tr style={{ color: 'var(--text-muted)', borderBottom: '1px solid #21262d', fontSize: '10px' }}>
                <th style={{ padding: '4px 12px', width: '80px' }}>Address</th>
                <th style={{ padding: '4px 12px', width: '150px' }}>Bytes</th>
                <th style={{ padding: '4px 12px', width: '90px' }}>Mnemonic</th>
                <th style={{ padding: '4px 12px' }}>Operands</th>
                <th style={{ padding: '4px 12px', width: '200px' }}>Comment</th>
              </tr>
            </thead>
            <tbody>
              {block.instructions.map((inst, idx) => (
                <tr
                  key={idx}
                  style={{
                    borderBottom: '1px solid #1c2128',
                    backgroundColor: idx % 2 === 0 ? 'transparent' : 'rgba(255, 255, 255, 0.01)',
                  }}
                >
                  <td style={{ padding: '4px 12px', color: 'var(--color-address)' }}>
                    0x{inst.address.toString(16)}
                  </td>
                  <td style={{ padding: '4px 12px', color: 'var(--color-bytes)' }}>
                    {inst.raw_bytes.join(' ')}
                  </td>
                  <td style={{ padding: '4px 12px', color: 'var(--color-mnemonic-cf)', fontWeight: 600 }}>
                    {inst.mnemonic}
                  </td>
                  <td style={{ padding: '4px 12px', color: 'var(--color-operands)' }}>
                    {inst.operands}
                  </td>
                  <td style={{ padding: '4px 12px', color: 'var(--color-comment)', fontStyle: 'italic' }}>
                    {inst.comment ? `# ${inst.comment}` : ''}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
};
