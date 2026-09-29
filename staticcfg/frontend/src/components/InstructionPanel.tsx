import React, { useState, useEffect, useRef } from 'react';
import { BasicBlock, CFG, FunctionAnalysisReport } from '../types/cfg';
import { getFunctionAnalysis, agentIdentifyFunction } from '../services/api';
import { Terminal, Code, Cpu, X, ChevronRight, Hash, ArrowUpRight, ArrowDownLeft, Shield, AlertTriangle, Sparkles, CheckCircle2, Bot, Loader2 } from 'lucide-react';


interface InstructionPanelProps {
  block: BasicBlock | null;
  cfg: CFG | null;
  functionName: string | null;
  onSelectBlock: (block: BasicBlock | null) => void;
  onSelectFunction: (name: string) => void;
  onClose: () => void;
  analysisReport?: FunctionAnalysisReport | null;
}

export const InstructionPanel: React.FC<InstructionPanelProps> = ({
  block,
  cfg,
  functionName,
  onSelectBlock,
  onSelectFunction,
  onClose,
  analysisReport: analysisReportProp,
}) => {
  const [activeTab, setActiveTab] = useState<'block' | 'raw' | 'analysis'>('block');
  const [internalReport, setInternalReport] = useState<FunctionAnalysisReport | null>(null);
  const [isLoadingAnalysis, setIsLoadingAnalysis] = useState(false);
  const [isAnalyzingWithAgent, setIsAnalyzingWithAgent] = useState(false);
  const [agentError, setAgentError] = useState<string | null>(null);
  const blockRowRefs = useRef<Record<string, HTMLDivElement | null>>({});

  const analysisReport = analysisReportProp ?? internalReport;

  const handleRunAgentIdentification = async () => {
    if (!functionName) return;
    setIsAnalyzingWithAgent(true);
    setAgentError(null);
    try {
      const updatedIdent = await agentIdentifyFunction(functionName);
      if (analysisReport) {
        setInternalReport({
          ...analysisReport,
          identification: updatedIdent
        });
      }
    } catch (err: any) {
      console.error("Agent identification error:", err);
      setAgentError(err.response?.data?.detail || err.message || "Agent reverse engineering failed.");
    } finally {
      setIsAnalyzingWithAgent(false);
    }
  };


  // Auto-scroll to selected block in Raw Assembly view
  useEffect(() => {
    if (block && activeTab === 'raw' && blockRowRefs.current[block.id]) {
      blockRowRefs.current[block.id]?.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    }
  }, [block, activeTab]);

  // Fetch analysis report when function changes if not provided externally
  useEffect(() => {
    if (analysisReportProp) {
      setInternalReport(analysisReportProp);
      return;
    }
    if (functionName) {
      setIsLoadingAnalysis(true);
      getFunctionAnalysis(functionName)
        .then((report) => setInternalReport(report))
        .catch((err) => {
          console.error('Failed to load analysis report:', err);
          setInternalReport(null);
        })
        .finally(() => setIsLoadingAnalysis(false));
    }
  }, [functionName, analysisReportProp]);

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
  const ident = analysisReport?.identification;

  return (
    <div
      style={{
        height: '270px',
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
              <Sparkles size={13} color="#3fb950" />
              Identification & Analysis
            </button>
          </div>

          {functionName && (
            <span style={{ color: 'var(--text-muted)', fontSize: '10px' }}>
              Recovered Symbol: <strong style={{ color: 'var(--text-main)' }}>{ident?.recovered_name || functionName}</strong> ({ident?.formatted_address || '0x0'})
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
            <>
              {/* Dominator & Loop Context Strip */}
              {analysisReport?.dominators && (
                <div
                  style={{
                    padding: '6px 14px',
                    backgroundColor: '#131920',
                    borderBottom: '1px solid var(--border-color)',
                    display: 'flex',
                    flexWrap: 'wrap',
                    alignItems: 'center',
                    gap: '14px',
                    fontSize: '11px',
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                    <span style={{ color: 'var(--text-muted)', fontSize: '10px' }}>Immediate Dominator (idom):</span>
                    {analysisReport.dominators.immediate_dominators[block.id] ? (
                      <button
                        onClick={() => {
                          const idom = analysisReport.dominators.immediate_dominators[block.id];
                          const target = cfg?.nodes.find((n) => n.id === idom);
                          if (target) onSelectBlock(target);
                        }}
                        style={{
                          backgroundColor: '#2e1065',
                          border: '1px solid #a855f7',
                          color: '#c084fc',
                          padding: '1px 6px',
                          borderRadius: '4px',
                          cursor: 'pointer',
                          fontSize: '10px',
                          fontWeight: 700,
                          fontFamily: 'var(--font-mono)',
                        }}
                        title="Jump to Immediate Dominator"
                      >
                        {analysisReport.dominators.immediate_dominators[block.id]}
                      </button>
                    ) : (
                      <span style={{ color: 'var(--text-muted)', fontStyle: 'italic', fontSize: '10px' }}>None (Entry Block)</span>
                    )}
                  </div>

                  <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                    <span style={{ color: 'var(--text-muted)', fontSize: '10px' }}>Dominance Frontier (DF):</span>
                    {analysisReport.dominators.dominance_frontiers[block.id] &&
                    analysisReport.dominators.dominance_frontiers[block.id].length > 0 ? (
                      analysisReport.dominators.dominance_frontiers[block.id].map((df) => (
                        <button
                          key={df}
                          onClick={() => {
                            const target = cfg?.nodes.find((n) => n.id === df);
                            if (target) onSelectBlock(target);
                          }}
                          style={{
                            backgroundColor: '#083344',
                            border: '1px solid #0284c7',
                            color: '#38bdf8',
                            padding: '1px 6px',
                            borderRadius: '4px',
                            cursor: 'pointer',
                            fontSize: '10px',
                            fontWeight: 700,
                            fontFamily: 'var(--font-mono)',
                          }}
                          title="Jump to Dominance Frontier Node"
                        >
                          {df}
                        </button>
                      ))
                    ) : (
                      <span style={{ color: 'var(--text-muted)', fontStyle: 'italic', fontSize: '10px' }}>Empty ∅</span>
                    )}
                  </div>

                  {analysisReport.loops?.loops &&
                    analysisReport.loops.loops
                      .filter((l) => l.blocks.includes(block.id))
                      .map((l, idx) => (
                        <div key={idx} style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                          <span style={{ color: '#f59e0b', fontSize: '10px', fontWeight: 600 }}>Loop:</span>
                          <span
                            style={{
                              backgroundColor: '#2d1b00',
                              border: '1px solid #f59e0b66',
                              color: '#f59e0b',
                              padding: '1px 6px',
                              borderRadius: '4px',
                              fontSize: '10px',
                              fontFamily: 'var(--font-mono)',
                            }}
                          >
                            header {l.header} (tail {l.tail})
                          </span>
                        </div>
                      ))}
                </div>
              )}

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
          </>
        )
        ) : activeTab === 'raw' ? (
          /* Tab 2: Raw Assembly View */
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
          /* Tab 3: Function Identification & Analysis Dashboard */
          isLoadingAnalysis ? (
            <div style={{ padding: '24px', textAlign: 'center', color: 'var(--text-muted)' }}>
              Executing multi-stage function identification pipeline...
            </div>
          ) : !analysisReport ? (
            <div style={{ padding: '24px', textAlign: 'center', color: 'var(--text-muted)' }}>
              Failed to load analysis report.
            </div>
          ) : (
            <div style={{ padding: '12px 16px', display: 'flex', flexDirection: 'column', gap: '12px' }}>
              {/* Function Identification Pipeline Card */}
              {ident && (
                <div
                  style={{
                    backgroundColor: '#161b22',
                    border: '1px solid #30363d',
                    borderRadius: '6px',
                    padding: '12px 16px',
                    display: 'flex',
                    flexDirection: 'column',
                    gap: '10px',
                  }}
                >
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
                    <div>
                      <div style={{ fontSize: '10px', color: 'var(--text-muted)', letterSpacing: '0.5px' }}>
                        RECOVERED FUNCTION IDENTIFIER: <strong style={{ color: '#58a6ff' }}>{ident.recovered_name}</strong> ({ident.formatted_address})
                      </div>
                      <div style={{ fontSize: '16px', fontWeight: 800, color: 'var(--text-bright)', marginTop: '2px', display: 'flex', alignItems: 'center', gap: '8px' }}>
                        Predicted Name: <span style={{ color: '#2f81f7', textDecoration: 'underline' }}>{ident.top_prediction?.predicted_name || ident.recovered_name}</span>
                      </div>
                    </div>

                    <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                      <button
                        onClick={handleRunAgentIdentification}
                        disabled={isAnalyzingWithAgent}
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          gap: '6px',
                          backgroundColor: isAnalyzingWithAgent ? '#30363d' : '#6e40c9',
                          color: '#ffffff',
                          border: '1px solid #8957e5',
                          borderRadius: '6px',
                          padding: '4px 12px',
                          fontSize: '11px',
                          fontWeight: 700,
                          cursor: isAnalyzingWithAgent ? 'not-allowed' : 'pointer',
                          boxShadow: '0 2px 8px rgba(110, 64, 201, 0.4)',
                          transition: 'all 0.2s ease',
                        }}
                      >
                        {isAnalyzingWithAgent ? (
                          <>
                            <Loader2 size={13} style={{ animation: 'spin 1s linear infinite' }} />
                            <span>Agent Analyzing CFG...</span>
                          </>
                        ) : (
                          <>
                            <Sparkles size={13} color="#f0883e" />
                            <span>{ident.recovered_signature ? 'Re-Analyze with AI Agent' : 'Analyze with AI Agent'}</span>
                          </>
                        )}
                      </button>

                      <span
                        style={{
                          backgroundColor: '#1f6beb33',
                          color: '#58a6ff',
                          border: '1px solid #1f6beb66',
                          borderRadius: '12px',
                          padding: '3px 10px',
                          fontSize: '11px',
                          fontWeight: 700,
                          display: 'flex',
                          alignItems: 'center',
                          gap: '4px',
                        }}
                      >
                        <CheckCircle2 size={13} color="#3fb950" />
                        Confidence: {Math.round((ident.top_prediction?.confidence || 0) * 100)}%
                      </span>

                      <span
                        style={{
                          backgroundColor: '#23863633',
                          color: '#3fb950',
                          border: '1px solid #23863666',
                          borderRadius: '4px',
                          padding: '3px 8px',
                          fontSize: '10px',
                          fontWeight: 700,
                          textTransform: 'uppercase',
                        }}
                      >
                        Category: {ident.semantic_category}
                      </span>
                    </div>
                  </div>

                  {agentError && (
                    <div style={{ backgroundColor: '#ff7b7222', border: '1px solid #ff7b7266', borderRadius: '4px', padding: '6px 10px', color: '#ff7b72', fontSize: '11px' }}>
                      {agentError}
                    </div>
                  )}

                  {/* Recovered Typed C-Style Signature Card */}
                  {ident.recovered_signature && (
                    <div style={{
                      backgroundColor: '#090d13',
                      border: '1px solid #8957e5aa',
                      borderRadius: '6px',
                      padding: '12px 14px',
                      display: 'flex',
                      flexDirection: 'column',
                      gap: '8px'
                    }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '6px', color: '#d2a8ff', fontSize: '11px', fontWeight: 700 }}>
                          <Bot size={15} color="#bc8cff" />
                          <span>AGENT RECOVERED C SIGNATURE</span>
                        </div>
                        <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                          <span style={{ fontSize: '10px', color: 'var(--text-muted)' }}>ABI:</span>
                          <span style={{ fontSize: '10px', backgroundColor: '#21262d', padding: '2px 6px', borderRadius: '4px', color: '#58a6ff' }}>
                            {ident.recovered_signature.calling_convention}
                          </span>
                        </div>
                      </div>

                      {/* C Prototype syntax box */}
                      <div style={{
                        backgroundColor: '#161b22',
                        border: '1px solid #30363d',
                        borderRadius: '4px',
                        padding: '8px 12px',
                        fontFamily: 'var(--font-mono)',
                        fontSize: '12px',
                        color: '#7ee787',
                        fontWeight: 600,
                        overflowX: 'auto',
                        letterSpacing: '0.3px',
                      }}>
                        <span style={{ color: '#ff7b72' }}>{ident.recovered_signature.return_type}</span>{' '}
                        <span style={{ color: '#d2a8ff' }}>{ident.recovered_signature.name}</span>
                        (
                        {ident.recovered_signature.parameters.map((p, idx) => (
                          <span key={idx}>
                            <span style={{ color: '#79c0ff' }}>{p.type_name}</span>{' '}
                            <span style={{ color: '#e6edf3' }}>{p.name}</span>
                            {p.register_or_location && (
                              <span style={{ color: '#8b949e', fontSize: '10px' }}> /* {p.register_or_location} */</span>
                            )}
                            {idx < ident.recovered_signature!.parameters.length - 1 ? ', ' : ''}
                          </span>
                        ))}
                        )
                      </div>

                      {/* Summary description */}
                      <div style={{ color: '#c9d1d9', fontSize: '11px', fontStyle: 'italic' }}>
                        "{ident.recovered_signature.summary}"
                      </div>

                      {/* Parameters Breakdown */}
                      {ident.recovered_signature.parameters.length > 0 && (
                        <div style={{ marginTop: '2px' }}>
                          <div style={{ fontSize: '10px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '4px', letterSpacing: '0.5px' }}>
                            DEDUCED PARAMETERS:
                          </div>
                          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))', gap: '6px' }}>
                            {ident.recovered_signature.parameters.map((p, idx) => (
                              <div key={idx} style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '11px', backgroundColor: '#161b22', padding: '4px 8px', borderRadius: '4px', border: '1px solid #21262d' }}>
                                <span style={{ color: '#ff7b72', fontWeight: 700, minWidth: '45px' }}>{p.register_or_location || `arg${idx}`}</span>
                                <span style={{ color: '#79c0ff' }}>{p.type_name}</span>
                                <span style={{ color: '#f0883e', fontWeight: 600 }}>{p.name}</span>
                                {p.description && <span style={{ color: '#8b949e', fontSize: '10px' }}>— {p.description}</span>}
                              </div>
                            ))}
                          </div>
                        </div>
                      )}

                      {/* Nested Callees Explored */}
                      {ident.recovered_signature.nested_callees_analyzed && ident.recovered_signature.nested_callees_analyzed.length > 0 && (
                        <div style={{ marginTop: '4px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                          <span style={{ fontSize: '10px', color: 'var(--text-muted)' }}>Nested Callees Explored:</span>
                          <div style={{ display: 'flex', gap: '4px', flexWrap: 'wrap' }}>
                            {ident.recovered_signature.nested_callees_analyzed.map((cName, idx) => (
                              <span
                                key={idx}
                                onClick={() => onSelectFunction(cName)}
                                style={{
                                  fontSize: '10px',
                                  backgroundColor: '#1f6beb33',
                                  color: '#58a6ff',
                                  border: '1px solid #1f6beb66',
                                  borderRadius: '4px',
                                  padding: '1px 6px',
                                  cursor: 'pointer',
                                  textDecoration: 'underline'
                                }}
                              >
                                {cName}
                              </span>
                            ))}
                          </div>
                        </div>
                      )}
                    </div>
                  )}


                  {/* Evidence & Alternatives Grid */}
                  <div style={{ display: 'grid', gridTemplateColumns: '1.4fr 1fr', gap: '16px', borderTop: '1px solid #21262d', paddingTop: '8px' }}>
                    {/* Explainable Evidence Bullet List */}
                    <div>
                      <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '4px' }}>
                        Explainable Evidence:
                      </div>
                      <div style={{ display: 'flex', flexDirection: 'column', gap: '3px' }}>
                        {(ident.evidence_summary || []).map((ev, i) => (
                          <div key={i} style={{ color: '#7ee787', fontSize: '11px', fontFamily: 'var(--font-mono)' }}>
                            {ev}
                          </div>
                        ))}
                      </div>
                    </div>

                    {/* Alternatives Table */}
                    <div>
                      <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-bright)', marginBottom: '4px' }}>
                        Alternative Candidates:
                      </div>
                      {ident.alternative_candidates && ident.alternative_candidates.length > 0 ? (
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '4px' }}>
                          {ident.alternative_candidates.map((alt, i) => (
                            <div key={i} style={{ display: 'flex', justifyContent: 'space-between', color: 'var(--text-main)', fontSize: '10px' }}>
                              <span>{alt.predicted_name}</span>
                              <span style={{ color: 'var(--text-muted)', fontWeight: 600 }}>{Math.round(alt.confidence * 100)}%</span>
                            </div>
                          ))}
                        </div>
                      ) : (
                        <div style={{ color: 'var(--text-muted)', fontSize: '10px', fontStyle: 'italic' }}>No alternatives found.</div>
                      )}
                    </div>
                  </div>
                </div>
              )}

              {/* Structural Metrics */}
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
