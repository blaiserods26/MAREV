import React, { useState, useEffect, useCallback, useRef } from 'react';
import { ReactFlowProvider } from '@xyflow/react';
import { FunctionSummary, CFG, BasicBlock, AnalysisResponse, CallGraph } from '../types/cfg';
import { getFunctions, getFunctionCFG, checkHealth, getCallGraph } from '../services/api';
import { Toolbar } from '../components/Toolbar';
import { FunctionList } from '../components/FunctionList';
import { CFGCanvas } from '../components/CFGCanvas';
import { InstructionPanel } from '../components/InstructionPanel';
import { UploadPanel } from '../components/UploadPanel';
import { GitFork, X } from 'lucide-react';

export const Analyzer: React.FC = () => {
  const [activeFile, setActiveFile] = useState<string | null>(null);
  const [functionCount, setFunctionCount] = useState<number>(0);
  const [sections, setSections] = useState<string[]>(['.text', '.plt', '.init', '.fini']);
  const [functions, setFunctions] = useState<FunctionSummary[]>([]);
  const [selectedFunction, setSelectedFunction] = useState<string | null>(null);
  const [cfg, setCfg] = useState<CFG | null>(null);
  const [selectedBlock, setSelectedBlock] = useState<BasicBlock | null>(null);

  const [isLoadingFunctions, setIsLoadingFunctions] = useState(false);
  const [isLoadingCFG, setIsLoadingCFG] = useState(false);
  const [showUnreachable, setShowUnreachable] = useState(false);

  const [isUploadOpen, setIsUploadOpen] = useState(false);
  const [isCallGraphOpen, setIsCallGraphOpen] = useState(false);
  const [callGraphData, setCallGraphData] = useState<CallGraph | null>(null);

  // Client-side in-memory CFG cache to make switching functions instantaneous
  const cfgCache = useRef<Map<string, CFG>>(new Map());

  // Load functions from active session
  const loadFunctions = useCallback(async () => {
    setIsLoadingFunctions(true);
    cfgCache.current.clear();
    try {
      const list = await getFunctions();
      setFunctions(list);
      if (list.length > 0) {
        const defaultFunc = list.find((f) => f.name === '_init') || list.find((f) => f.name === 'main') || list[0];
        setSelectedFunction(defaultFunc.name);
      }
    } catch (err) {
      console.error('Failed to load functions:', err);
    } finally {
      setIsLoadingFunctions(false);
    }
  }, []);

  // Initial startup check
  useEffect(() => {
    checkHealth().then((health) => {
      if (health.active_file) {
        setActiveFile(health.active_file);
        setFunctionCount(health.function_count || 0);
        loadFunctions();
      } else {
        setIsUploadOpen(true);
      }
    });
  }, [loadFunctions]);

  // Load CFG when selected function changes (with 0ms client-side cache)
  useEffect(() => {
    if (!selectedFunction) {
      setCfg(null);
      setSelectedBlock(null);
      return;
    }

    setSelectedBlock(null);

    // Instant load from client-side memory cache if available
    if (cfgCache.current.has(selectedFunction)) {
      setCfg(cfgCache.current.get(selectedFunction)!);
      setIsLoadingCFG(false);
      return;
    }

    setIsLoadingCFG(true);

    getFunctionCFG(selectedFunction)
      .then((cfgData) => {
        cfgCache.current.set(selectedFunction, cfgData);
        setCfg(cfgData);
      })
      .catch((err) => {
        console.error(`Failed to load CFG for ${selectedFunction}:`, err);
        setCfg(null);
      })
      .finally(() => {
        setIsLoadingCFG(false);
      });
  }, [selectedFunction]);

  const handleUploadSuccess = (res: AnalysisResponse) => {
    setActiveFile(res.file);
    setFunctionCount(res.function_count);
    setSections(res.sections);
    loadFunctions();
  };

  const handleOpenCallGraph = async () => {
    try {
      const cg = await getCallGraph();
      setCallGraphData(cg);
      setIsCallGraphOpen(true);
    } catch (err) {
      console.error('Failed to fetch call graph:', err);
    }
  };

  return (
    <div style={{ width: '100vw', height: '100vh', display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
      {/* Top Header Toolbar */}
      <Toolbar
        activeFile={activeFile}
        functionCount={functionCount}
        currentFunction={selectedFunction}
        cyclomaticComplexity={cfg ? cfg.cyclomatic_complexity : null}
        unreachableCount={cfg ? cfg.unreachable_blocks.length : 0}
        showUnreachable={showUnreachable}
        onToggleUnreachable={() => setShowUnreachable(!showUnreachable)}
        onOpenUploadModal={() => setIsUploadOpen(true)}
        onOpenCallGraph={handleOpenCallGraph}
      />

      {/* Main Workspace Layout */}
      <div style={{ flex: 1, display: 'flex', overflow: 'hidden' }}>
        {/* Left Function Browser Sidebar */}
        <FunctionList
          functions={functions}
          sections={sections}
          selectedFunction={selectedFunction}
          onSelectFunction={(name) => setSelectedFunction(name)}
          isLoading={isLoadingFunctions}
        />

        {/* Central Graph & Inspection Area */}
        <div style={{ flex: 1, display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
          {/* CFG Canvas */}
          <div style={{ flex: 1, position: 'relative', overflow: 'hidden' }}>
            {isLoadingCFG && (
              <div
                style={{
                  position: 'absolute',
                  top: '12px',
                  left: '50%',
                  transform: 'translateX(-50%)',
                  backgroundColor: 'var(--bg-panel)',
                  border: '1px solid var(--border-color)',
                  color: 'var(--text-main)',
                  padding: '4px 12px',
                  borderRadius: '12px',
                  fontSize: '11px',
                  zIndex: 10,
                  fontFamily: 'var(--font-mono)',
                  boxShadow: '0 2px 8px rgba(0,0,0,0.5)',
                }}
              >
                Loading CFG for {selectedFunction}...
              </div>
            )}
            <ReactFlowProvider>
              <CFGCanvas
                cfg={cfg}
                selectedBlockId={selectedBlock ? selectedBlock.id : null}
                onSelectBlock={(block) => setSelectedBlock(block)}
                showUnreachable={showUnreachable}
              />
            </ReactFlowProvider>
          </div>

          {/* Bottom Instruction Inspector Panel */}
          <InstructionPanel
            block={selectedBlock}
            functionName={selectedFunction}
            onClose={() => setSelectedBlock(null)}
          />
        </div>
      </div>

      {/* Upload Modal */}
      <UploadPanel
        isOpen={isUploadOpen}
        onClose={() => setIsUploadOpen(false)}
        onUploadSuccess={handleUploadSuccess}
      />

      {/* Call Graph Modal */}
      {isCallGraphOpen && (
        <div
          style={{
            position: 'fixed',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.75)',
            zIndex: 1000,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
          }}
        >
          <div
            style={{
              width: '750px',
              height: '500px',
              backgroundColor: 'var(--bg-panel)',
              border: '1px solid var(--border-color)',
              borderRadius: '8px',
              display: 'flex',
              flexDirection: 'column',
              overflow: 'hidden',
            }}
          >
            <div style={{ padding: '12px 16px', backgroundColor: 'var(--bg-header)', borderBottom: '1px solid var(--border-color)', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span style={{ fontWeight: 700, fontSize: '13px', color: 'var(--text-bright)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                <GitFork size={16} color="var(--color-accent)" /> Program Call Graph ({callGraphData?.edges.length || 0} direct calls)
              </span>
              <button onClick={() => setIsCallGraphOpen(false)} style={{ background: 'transparent', border: 'none', color: 'var(--text-muted)', cursor: 'pointer' }}>
                <X size={16} />
              </button>
            </div>
            <div style={{ flex: 1, overflowY: 'auto', padding: '12px', fontFamily: 'var(--font-mono)', fontSize: '11px' }}>
              {callGraphData && callGraphData.edges.length > 0 ? (
                <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
                  <thead>
                    <tr style={{ color: 'var(--text-muted)', borderBottom: '1px solid #21262d' }}>
                      <th style={{ padding: '6px' }}>Call Address</th>
                      <th style={{ padding: '6px' }}>Caller Function</th>
                      <th style={{ padding: '6px' }}>Callee Function</th>
                    </tr>
                  </thead>
                  <tbody>
                    {callGraphData.edges.map((e, idx) => (
                      <tr key={idx} style={{ borderBottom: '1px solid #1c2128' }}>
                        <td style={{ padding: '6px', color: 'var(--color-address)' }}>0x{e.address.toString(16)}</td>
                        <td style={{ padding: '6px', color: 'var(--color-mnemonic-op)' }}>{e.caller}</td>
                        <td style={{ padding: '6px', color: '#58a6ff', fontWeight: 600 }}>{e.callee}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              ) : (
                <div style={{ padding: '20px', textAlign: 'center', color: 'var(--text-muted)' }}>
                  No direct function calls detected in disassembly.
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
