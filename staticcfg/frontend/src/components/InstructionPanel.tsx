import React, { useState, useEffect, useRef } from 'react';
import { BasicBlock, CFG, FunctionAnalysisReport } from '../types/cfg';
import { getFunctionAnalysis } from '../services/api';
import { Terminal, Code, Cpu, X, ChevronRight, Hash, ArrowUpRight, ArrowDownLeft, Shield, AlertTriangle } from 'lucide-react';

interface InstructionPanelProps {
  block: BasicBlock | null;
  cfg: CFG | null;
  functionName: string | null;
  onSelectBlock: (block: BasicBlock | null) => void;
  onSelectFunction: (name: string) => void;
  onClose: () => void;
}

export const InstructionPanel: React.FC<InstructionPanelProps> = ({
  block,
  cfg,
  functionName,
  onSelectBlock,
  onSelectFunction,
  onClose,
}) => {
  const [activeTab, setActiveTab] = useState<'block' | 'raw' | 'analysis'>('block');
  const [analysisReport, setAnalysisReport] = useState<FunctionAnalysisReport | null>(null);
  const [isLoadingAnalysis, setIsLoadingAnalysis] = useState(false);
  const blockRowRefs = useRef<Record<string, HTMLDivElement | null>>({});

  // Auto-scroll to selected block in Raw Assembly view
  useEffect(() => {
    if (block && activeTab === 'raw' && blockRowRefs.current[block.id]) {
      blockRowRefs.current[block.id]?.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }
  }, [block, activeTab]);

  // Fetch analysis report when function changes or analysis tab is opened
  useEffect(() => {
    if (functionName && activeTab === 'analysis') {
      setIsLoadingAnalysis(true);
      getFunctionAnalysis(functionName)
        .then((report) => setAnalysisReport(report))
        .catch((err) => {
          console.error('Failed to load analysis report:', err);
          setAnalysisReport(null);
        })
        .finally(() => setIsLoadingAnalysis(false));
    }
  }, [functionName, activeTab]);

  if (!cfg && !block) {
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
        Select a function to inspect basic block instructions and structural analysis.
      </div>
    );
  }

  const isSpecial = block && (block.id === 'EXIT' || block.id === 'UNKNOWN' || block.id.startsWith('EXTERNAL_'));
  const fp = analysisReport?.fingerprint;

  return (
    <div
      style={{
        height: '240px',
        backgroundColor: 'var(--bg-panel)',
        borderTop: '1px solid var(--border-color)',
        display: 'flex',
        flexDirection: 'column',
        fontFamily: 'var(--font-mono)',
        fontSize: '11px',
        userSelect: 'text',
      }}
    >
      {/* Panel Header Bar & Tabs */}
      <div
        style={{
          padding: '4px 12px',
          backgroundColor: 'var(--bg-header)',
          borderBottom: '1px solid var(--border-color)',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
        }}
      >
        <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
          {/* Tab buttons */}
          <div style={{ display: 'flex', gap: '4px' }}>
            <button
              onClick={() => setActiveTab('block')}
              style={{
                backgroundColor: activeTab === 'block' ? 'var(--bg-card)' : 'transparent',
                color: activeTab === 'block' ? 'var(--text-bright)' : 'var(--text-muted)',
                border: activeTab === 'block' ? '1px solid var(--border-color)' : '1px solid transparent',
                borderRadius: '4px',
                padding: '3px 10px',
                fontSize: '11px',
                fontWeight: 600,
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                gap: '6px',
              }}
            >
              <Terminal size={13} color="var(--color-accent)" />
              Block Inspector {block ? `(${block.id})` : ''}
            </button>

            <button
              onClick={() => setActiveTab('raw')}
              style={{
                backgroundColor: activeTab === 'raw' ? 'var(--bg-card)' : 'transparent',
                color: activeTab === 'raw' ? 'var(--text-bright)' : 'var(--text-muted)',
                border: activeTab === 'raw' ? '1px solid var(--border-color)' : '1px solid transparent',
                borderRadius: '4px',
                padding: '3px 10px',
                fontSize: '11px',
                fontWeight: 600,
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                gap: '6px',
              }}
            >
              <Code size={13} color="#a371f7" />
              Raw Assembly View
            </button>

            <button
              onClick={() => setActiveTab('analysis')}
              style={{
                backgroundColor: activeTab === 'analysis' ? 'var(--bg-card)' : 'transparent',
                color: activeTab === 'analysis' ? 'var(--text-bright)' : 'var(--text-muted)',
                border: activeTab === 'analysis' ? '1px solid var(--border-color)' : '1px solid transparent',
                borderRadius: '4px',
                padding: '3px 10px',
                fontSize: '11px',
                fontWeight: 600,
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                gap: '6px',
              }}
            >
              <Cpu size={13} color="#3fb950" />
              Analysis & Fingerprint
            </button>
          </div>

          {functionName && (
            <span style={{ color: 'var(--text-muted)', fontSize: '10px' }}>
              Function: <strong style={{ color: 'var(--text-main)' }}>{functionName}</strong>
            </span>
          )}
          {block && !isSpecial && (
            <span style={{ color: 'var(--color-address)', fontSize: '10px' }}>
              Range: 0x{block.start_address.toString(16)} → 0x{block.end_address.toString(16)}
            </span>
          )}
        </div>

        {block && (
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
            title="Deselect Block"
          >
            <X size={14} />
          </button>
        )}
      </div>

      {/* Tab Content Area */}
      <div style={{ flex: 1, overflowY: 'auto', padding: '0' }}>
        {activeTab === 'block' ? (
          /* Tab 1: Selected Block Inspector Table */
          !block ? (
            <div style={{ padding: '24px', textAlign: 'center', color: 'var(--text-muted)' }}>
              Click any Basic Block node on the CFG canvas to view its instructions.
            </div>
          ) : isSpecial ? (
            <div style={{ padding: '24px', color: 'var(--text-muted)', fontStyle: 'italic' }}>
              Synthetic node {block.id}. No internal instructions.
            </div>
          ) : (
            <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
              <thead>
                <tr style={{ color: 'var(--text-muted)', borderBottom: '1px solid #21262d', fontSize: '10px', backgroundColor: 'var(--bg-dark)' }}>
                  <th style={{ padding: '4px 12px', width: '90px' }}>Address</th>
                  <th style={{ padding: '4px 12px', width: '160px' }}>Hex Bytes</th>
                  <th style={{ padding: '4px 12px', width: '100px' }}>Mnemonic</th>
                  <th style={{ padding: '4px 12px' }}>Operands</th>
                  <th style={{ padding: '4px 12px', width: '220px' }}>Comment</th>
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
          )
        ) : activeTab === 'raw' ? (
          /* Tab 2: Raw Assembly View with Synchronized Block Highlighting */
          <div style={{ display: 'flex', flexDirection: 'column' }}>
            {cfg?.nodes.map((nodeBlock) => {
              const isSelectedBlock = block?.id === nodeBlock.id;
              return (
                <div
                  key={nodeBlock.id}
                  ref={(el) => (blockRowRefs.current[nodeBlock.id] = el)}
                  onClick={() => onSelectBlock(nodeBlock)}
                  style={{
                    borderBottom: '1px solid #21262d',
                    backgroundColor: isSelectedBlock ? '#1e293b' : 'transparent',
                    borderLeft: isSelectedBlock ? '3px solid #58a6ff' : '3px solid transparent',
                    cursor: 'pointer',
                  }}
                >
                  <div
                    style={{
                      padding: '3px 12px',
                      backgroundColor: isSelectedBlock ? '#2d3748' : '#161b22',
                      color: 'var(--text-bright)',
                      fontWeight: 700,
                      fontSize: '10px',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '6px',
                      borderTop: '1px solid #21262d',
                    }}
                  >
                    <ChevronRight size={12} color="#58a6ff" />
                    <span>{nodeBlock.id}</span>
                    <span style={{ color: 'var(--color-address)', opacity: 0.8, fontSize: '9px' }}>
                      (0x{nodeBlock.start_address.toString(16)} - 0x{nodeBlock.end_address.toString(16)})
                    </span>
                  </div>

                  {nodeBlock.instructions.map((inst, iIdx) => (
                    <div
                      key={iIdx}
                      style={{
                        padding: '3px 12px 3px 28px',
                        display: 'flex',
                        gap: '12px',
                        fontSize: '11px',
                        backgroundColor: isSelectedBlock ? 'rgba(88, 166, 255, 0.05)' : 'transparent',
                      }}
                    >
                      <span style={{ color: 'var(--color-address)', minWidth: '70px' }}>
                        0x{inst.address.toString(16)}
                      </span>
                      <span style={{ color: 'var(--color-bytes)', minWidth: '120px' }}>
                        {inst.raw_bytes.join(' ')}
                      </span>
                      <span style={{ color: 'var(--color-mnemonic-cf)', fontWeight: 600, minWidth: '70px' }}>
                        {inst.mnemonic}
                      </span>
                      <span style={{ color: 'var(--color-operands)', flex: 1 }}>
                        {inst.operands}
                      </span>
                      {inst.comment && (
                        <span style={{ color: 'var(--color-comment)', fontStyle: 'italic' }}>
                          # {inst.comment}
                        </span>
                      )}
                    </div>
                  ))}
                </div>
              );
            })}
          </div>
        ) : (
          /* Tab 3: Function Analysis & Fingerprint Dashboard */
          isLoadingAnalysis ? (
            <div style={{ padding: '24px', textAlign: 'center', color: 'var(--text-muted)' }}>
              Computing dominators, loops, back-edges, and function fingerprint...
            </div>
          ) : !analysisReport ? (
            <div style={{ padding: '24px', textAlign: 'center', color: 'var(--text-muted)' }}>
              Failed to load analysis report.
            </div>
          ) : (
            <div style={{ padding: '12px 16px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
              {/* Summary Cards Row */}
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(6, 1fr)', gap: '8px' }}>
                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '6px 10px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ color: 'var(--text-muted)', fontSize: '9px' }}>INSTRUCTIONS</div>
                  <div style={{ fontSize: '14px', fontWeight: 700, color: 'var(--text-bright)' }}>{fp?.instruction_count || 0}</div>
                </div>

                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '6px 10px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ color: 'var(--text-muted)', fontSize: '9px' }}>BASIC BLOCKS</div>
                  <div style={{ fontSize: '14px', fontWeight: 700, color: 'var(--color-accent)' }}>{fp?.basic_block_count || 0}</div>
                </div>

                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '6px 10px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ color: 'var(--text-muted)', fontSize: '9px' }}>FLOW EDGES</div>
                  <div style={{ fontSize: '14px', fontWeight: 700, color: 'var(--text-bright)' }}>{fp?.edge_count || 0}</div>
                </div>

                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '6px 10px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ color: 'var(--text-muted)', fontSize: '9px' }}>CYCLOMATIC COMP.</div>
                  <div style={{ fontSize: '14px', fontWeight: 700, color: '#3fb950' }}>{fp?.cyclomatic_complexity || 1}</div>
                </div>

                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '6px 10px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ color: 'var(--text-muted)', fontSize: '9px' }}>LOOPS / BACK-EDGES</div>
                  <div style={{ fontSize: '14px', fontWeight: 700, color: '#d29922' }}>{fp?.loop_count || 0} / {analysisReport.loops.back_edges.length}</div>
                </div>

                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '6px 10px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ color: 'var(--text-muted)', fontSize: '9px' }}>CFG HASH</div>
                  <div style={{ fontSize: '11px', fontWeight: 700, color: '#a371f7', textOverflow: 'ellipsis', overflow: 'hidden' }}>{fp?.cfg_hash || 'N/A'}</div>
                </div>
              </div>

              {/* Grid 2: Callers, Callees & Fingerprints */}
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1.2fr', gap: '12px' }}>
                {/* Incoming Callers */}
                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '8px 12px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '6px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                    <ArrowDownLeft size={13} color="#38bdf8" /> Incoming Callers ({analysisReport.callers.length})
                  </div>
                  {analysisReport.callers.length > 0 ? (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '4px', maxHeight: '100px', overflowY: 'auto' }}>
                      {analysisReport.callers.map((c, idx) => (
                        <div
                          key={idx}
                          onClick={() => onSelectFunction(c.function_name)}
                          style={{ cursor: 'pointer', color: '#58a6ff', fontSize: '10px', display: 'flex', justifyContent: 'space-between' }}
                        >
                          <span>{c.function_name}</span>
                          <span style={{ color: 'var(--color-address)' }}>0x{c.address.toString(16)}</span>
                        </div>
                      ))}
                    </div>
                  ) : (
                    <div style={{ color: 'var(--text-muted)', fontSize: '10px', fontStyle: 'italic' }}>No callers detected.</div>
                  )}
                </div>

                {/* Outgoing Callees */}
                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '8px 12px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '6px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                    <ArrowUpRight size={13} color="#3fb950" /> Outgoing Callees ({analysisReport.callees.length})
                  </div>
                  {analysisReport.callees.length > 0 ? (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '4px', maxHeight: '100px', overflowY: 'auto' }}>
                      {analysisReport.callees.map((c, idx) => (
                        <div
                          key={idx}
                          onClick={() => onSelectFunction(c.function_name)}
                          style={{ cursor: 'pointer', color: '#3fb950', fontSize: '10px', display: 'flex', justifyContent: 'space-between' }}
                        >
                          <span>{c.function_name}</span>
                          <span style={{ color: 'var(--color-address)' }}>0x{c.address.toString(16)}</span>
                        </div>
                      ))}
                    </div>
                  ) : (
                    <div style={{ color: 'var(--text-muted)', fontSize: '10px', fontStyle: 'italic' }}>No outgoing calls.</div>
                  )}
                </div>

                {/* Category Frequencies */}
                <div style={{ backgroundColor: 'var(--bg-dark)', padding: '8px 12px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                  <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '6px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                    <Shield size={13} color="#a371f7" /> Instruction Categories
                  </div>
                  {fp && (
                    <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '4px', fontSize: '10px' }}>
                      {Object.entries(fp.instruction_category_frequencies).map(([cat, count]) => (
                        count > 0 && (
                          <div key={cat} style={{ display: 'flex', justifyContent: 'space-between', color: 'var(--text-muted)' }}>
                            <span>{cat}:</span>
                            <span style={{ color: 'var(--text-bright)', fontWeight: 600 }}>{count}</span>
                          </div>
                        )
                      ))}
                    </div>
                  )}
                </div>
              </div>

              {/* Grid 3: Strings & Constants */}
              {(fp && (fp.string_references.length > 0 || fp.constants.length > 0)) && (
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '12px' }}>
                  {fp.string_references.length > 0 && (
                    <div style={{ backgroundColor: 'var(--bg-dark)', padding: '8px 12px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                      <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '4px' }}>String References</div>
                      <div style={{ color: 'var(--color-operands)', fontSize: '10px', maxHeight: '60px', overflowY: 'auto' }}>
                        {fp.string_references.join(', ')}
                      </div>
                    </div>
                  )}
                  {fp.constants.length > 0 && (
                    <div style={{ backgroundColor: 'var(--bg-dark)', padding: '8px 12px', borderRadius: '4px', border: '1px solid var(--border-color)' }}>
                      <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '4px' }}>Numeric Constants</div>
                      <div style={{ color: 'var(--color-address)', fontSize: '10px', maxHeight: '60px', overflowY: 'auto' }}>
                        {fp.constants.map(c => `0x${c.toString(16)} (${c})`).join(', ')}
                      </div>
                    </div>
                  )}
                </div>
              )}
            </div>
          )
        )}
      </div>
    </div>
  );
};
