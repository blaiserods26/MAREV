import React, { memo } from 'react';
import { Handle, Position, NodeProps } from '@xyflow/react';
import { BasicBlock, Instruction } from '../types/cfg';

export interface CFGNodeData extends Record<string, unknown> {
  block: BasicBlock;
  isSelected?: boolean;
  isUnreachable?: boolean;
}

const CONTROL_FLOW_MNEMONICS = new Set([
  'ja', 'jae', 'jb', 'jbe', 'jc', 'je', 'jg', 'jge', 'jl', 'jle',
  'jne', 'jnz', 'jz', 'jmp', 'jmpq', 'call', 'callq', 'ret', 'retq'
]);

function highlightMnemonic(mnemonic: string) {
  const isCf = CONTROL_FLOW_MNEMONICS.has(mnemonic.toLowerCase());
  return (
    <span style={{ color: isCf ? 'var(--color-mnemonic-cf)' : 'var(--color-mnemonic-op)', fontWeight: 600 }}>
      {mnemonic}
    </span>
  );
}

export const CFGNode: React.FC<NodeProps> = memo(({ data, selected }) => {
  const nodeData = data as unknown as CFGNodeData;
  const block = nodeData.block;
  const isUnreachable = nodeData.isUnreachable;
  const isSelected = selected || nodeData.isSelected;

  const isSpecial = block.id === 'EXIT' || block.id === 'UNKNOWN' || block.id.startsWith('EXTERNAL_');

  let borderStyle = '1px solid var(--border-color)';
  let bgHeader = 'var(--bg-header)';

  if (isSelected) {
    borderStyle = '2px solid #58a6ff';
  } else if (isUnreachable) {
    borderStyle = '1px solid #f85149';
  }

  if (block.id === 'EXIT') {
    bgHeader = '#342308';
  } else if (block.id === 'UNKNOWN') {
    bgHeader = '#2a1a38';
  } else if (block.id.startsWith('EXTERNAL_')) {
    bgHeader = '#1c2d3d';
  }

  const instPreview = block.instructions.slice(0, 8);
  const overflowCount = Math.max(0, block.instructions.length - 8);

  return (
    <div
      style={{
        width: '260px',
        backgroundColor: 'var(--bg-panel)',
        border: borderStyle,
        borderRadius: '6px',
        boxShadow: isSelected ? '0 0 12px rgba(88, 166, 255, 0.4)' : '0 4px 12px rgba(0,0,0,0.4)',
        overflow: 'hidden',
        fontSize: '11px',
        fontFamily: 'var(--font-mono)',
        transition: 'all 0.15s ease-in-out'
      }}
    >
      <Handle type="target" position={Position.Top} style={{ background: '#58a6ff', width: 8, height: 8 }} />
      
      {/* Node Header */}
      <div
        style={{
          backgroundColor: bgHeader,
          padding: '6px 10px',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          borderBottom: '1px solid var(--border-color)',
        }}
      >
        <span style={{ fontWeight: 700, fontSize: '12px', color: 'var(--text-bright)' }}>
          {block.id}
        </span>
        {!isSpecial && (
          <span style={{ color: 'var(--color-address)', fontSize: '10px' }}>
            0x{block.start_address.toString(16)} → 0x{block.end_address.toString(16)}
          </span>
        )}
        {isUnreachable && (
          <span style={{ backgroundColor: '#f85149', color: '#fff', fontSize: '9px', padding: '1px 4px', borderRadius: '3px' }}>
            Unreachable
          </span>
        )}
      </div>

      {/* Instruction List Preview */}
      <div style={{ padding: '6px 10px', display: 'flex', flexDirection: 'column', gap: '3px' }}>
        {isSpecial ? (
          <div style={{ color: 'var(--text-muted)', fontStyle: 'italic', padding: '4px 0' }}>
            Synthetic {block.id} node
          </div>
        ) : (
          instPreview.map((inst, idx) => (
            <div
              key={idx}
              style={{
                display: 'flex',
                gap: '8px',
                whiteSpace: 'nowrap',
                overflow: 'hidden',
                textOverflow: 'ellipsis'
              }}
            >
              <span style={{ color: 'var(--color-address)', opacity: 0.8, minWidth: '45px' }}>
                {inst.address.toString(16)}
              </span>
              <span style={{ minWidth: '45px' }}>
                {highlightMnemonic(inst.mnemonic)}
              </span>
              <span style={{ color: 'var(--color-operands)', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                {inst.operands}
              </span>
            </div>
          ))
        )}
        {overflowCount > 0 && (
          <div style={{ color: 'var(--text-muted)', fontSize: '10px', textAlign: 'center', marginTop: '2px' }}>
            + {overflowCount} more instructions...
          </div>
        )}
      </div>

      <Handle type="source" position={Position.Bottom} style={{ background: '#58a6ff', width: 8, height: 8 }} />
    </div>
  );
});

CFGNode.displayName = 'CFGNode';
