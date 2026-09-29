import React, { useState, useEffect, useRef, useCallback } from "react";
import {
  X, ScanSearch, Sparkles, Loader2, CheckCircle2, AlertTriangle,
  StopCircle, Download, Cpu
} from "lucide-react";
import {
  getStrippedFunctions, startBatchScan, getBatchScanStatus, cancelBatchScan,
  StrippedFunction, BatchScanJob, BatchScanResult,
} from "../services/api";

interface BatchScanModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSelectFunction?: (name: string) => void;
}

const CATEGORY_COLORS: Record<string, string> = {
  STRING_PROCESSING: "#58a6ff",
  MEMORY_MANAGEMENT: "#f0883e",
  CRYPTOGRAPHY: "#bc8cff",
  VALIDATION: "#3fb950",
  FILE_IO: "#f59e0b",
  NETWORKING: "#00d2ff",
  ERROR_HANDLING: "#f85149",
  UTILITY: "#8b949e",
  UNKNOWN: "#30363d",
};

export const BatchScanModal: React.FC<BatchScanModalProps> = ({ isOpen, onClose, onSelectFunction }) => {
  const [phase, setPhase] = useState<"idle" | "preview" | "running" | "done">("idle");
  const [strippedFns, setStrippedFns] = useState<StrippedFunction[]>([]);
  const [strippedCount, setStrippedCount] = useState(0);
  const [isLoadingPreview, setIsLoadingPreview] = useState(false);
  const [maxFunctions, setMaxFunctions] = useState<number | "">("");
  const [skipRecovered, setSkipRecovered] = useState(true);
  const [priorityStrings, setPriorityStrings] = useState(true);
  const [job, setJob] = useState<BatchScanJob | null>(null);
  const [jobId, setJobId] = useState<string | null>(null);
  const [startError, setStartError] = useState<string | null>(null);
  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const stopPolling = useCallback(() => {
    if (pollRef.current) {
      clearInterval(pollRef.current);
      pollRef.current = null;
    }
  }, []);

  useEffect(() => {
    if (!isOpen) { stopPolling(); return; }
    if (phase === "idle") {
      setIsLoadingPreview(true);
      getStrippedFunctions()
        .then((data) => { setStrippedFns(data.functions); setStrippedCount(data.stripped_count); setPhase("preview"); })
        .catch(() => setPhase("preview"))
        .finally(() => setIsLoadingPreview(false));
    }
  }, [isOpen, phase, stopPolling]);

  useEffect(() => {
    if (jobId && phase === "running") {
      pollRef.current = setInterval(async () => {
        try {
          const status = await getBatchScanStatus(jobId);
          setJob(status);
          if (status.status === "done" || status.status === "cancelled") { stopPolling(); setPhase("done"); }
        } catch { stopPolling(); }
      }, 1500);
    }
    return stopPolling;
  }, [jobId, phase, stopPolling]);

  const handleStart = async () => {
    setStartError(null);
    try {
      const resp = await startBatchScan({
        max_functions: maxFunctions !== "" ? Number(maxFunctions) : undefined,
        skip_already_recovered: skipRecovered,
        priority_with_strings: priorityStrings,
      });
      setJobId(resp.job_id);
      setJob(null);
      setPhase("running");
    } catch (err: any) {
      setStartError(err.response?.data?.detail || err.message || "Failed to start batch scan");
    }
  };

  const handleCancel = async () => {
    if (!jobId) return;
    try { await cancelBatchScan(jobId); } catch {}
  };

  const handleReset = () => { setPhase("idle"); setJob(null); setJobId(null); setStartError(null); };

  const handleExportCSV = () => {
    if (!job?.results.length) return;
    const rows = [
      ["original_name", "recovered_name", "confidence", "category", "c_prototype", "summary"],
      ...job.results.map((r) => [r.original_name, r.recovered_name, String(r.confidence), r.semantic_category, `"${r.c_prototype}"`, `"${r.summary}"`]),
    ];
    const csv = rows.map((r) => r.join(",")).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url; a.download = "batch_scan_results.csv"; a.click();
    URL.revokeObjectURL(url);
  };

  if (!isOpen) return null;

  const pendingCount = strippedFns.filter((f) => !f.already_recovered).length;
  const alreadyCount = strippedFns.filter((f) => f.already_recovered).length;
  const stringsCount = strippedFns.filter((f) => f.has_strings).length;
  const effectiveMax = maxFunctions !== "" ? Math.min(pendingCount, Number(maxFunctions)) : pendingCount;

  return (
    <div style={{ position: "fixed", top: 0, left: 0, right: 0, bottom: 0, backgroundColor: "rgba(0,0,0,0.82)", zIndex: 2000, display: "flex", alignItems: "center", justifyContent: "center" }}
      onClick={(e) => e.target === e.currentTarget && onClose()}>
      <div style={{ width: "840px", maxHeight: "88vh", backgroundColor: "#0d1117", border: "1px solid #30363d", borderRadius: "12px", display: "flex", flexDirection: "column", overflow: "hidden", boxShadow: "0 24px 64px rgba(0,0,0,0.7)" }}>
        {/* Header */}
        <div style={{ padding: "14px 20px", background: "linear-gradient(90deg,#161b22,#1a1f2e)", borderBottom: "1px solid #21262d", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <ScanSearch size={18} color="#bc8cff" />
            <span style={{ fontWeight: 800, fontSize: "14px", color: "#e6edf3", fontFamily: "var(--font-mono)" }}>AI Batch Scan — Stripped Function Recovery</span>
            <span style={{ backgroundColor: "#6e40c922", color: "#bc8cff", border: "1px solid #6e40c955", borderRadius: "12px", padding: "2px 10px", fontSize: "11px", fontWeight: 600 }}>{strippedCount} stripped</span>
          </div>
          <button onClick={onClose} style={{ background: "none", border: "none", color: "#8b949e", cursor: "pointer" }}><X size={16} /></button>
        </div>

        {/* Body */}
        <div style={{ flex: 1, overflowY: "auto", padding: "20px" }}>
          {isLoadingPreview && (
            <div style={{ display: "flex", alignItems: "center", gap: "10px", color: "#8b949e", padding: "32px", justifyContent: "center" }}>
              <Loader2 size={20} style={{ animation: "spin 1s linear infinite" }} />
              <span>Scanning binary for stripped function stubs...</span>
            </div>
          )}

          {phase === "preview" && !isLoadingPreview && (
            <>
              {/* Stats */}
              <div style={{ display: "flex", gap: "12px", marginBottom: "20px" }}>
                {[{ label: "Total Stripped", value: strippedCount, color: "#bc8cff" }, { label: "Need Recovery", value: pendingCount, color: "#f0883e" }, { label: "Already Scanned", value: alreadyCount, color: "#3fb950" }, { label: "Have Strings", value: stringsCount, color: "#58a6ff" }].map(({ label, value, color }) => (
                  <div key={label} style={{ flex: 1, backgroundColor: "#161b22", border: "1px solid #21262d", borderRadius: "8px", padding: "12px 16px", textAlign: "center" }}>
                    <div style={{ fontSize: "22px", fontWeight: 800, color, fontFamily: "var(--font-mono)" }}>{value}</div>
                    <div style={{ fontSize: "10px", color: "#8b949e", marginTop: "2px", textTransform: "uppercase", letterSpacing: "0.5px" }}>{label}</div>
                  </div>
                ))}
              </div>

              {/* Settings */}
              <div style={{ backgroundColor: "#161b22", border: "1px solid #21262d", borderRadius: "8px", padding: "16px", marginBottom: "20px", display: "flex", flexDirection: "column", gap: "12px" }}>
                <div style={{ fontSize: "11px", fontWeight: 700, color: "#8b949e", textTransform: "uppercase", letterSpacing: "0.5px" }}>Scan Configuration</div>
                <div style={{ display: "flex", gap: "20px", flexWrap: "wrap", alignItems: "center" }}>
                  <label style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "12px", color: "#c9d1d9", cursor: "pointer" }}>
                    <input type="checkbox" checked={skipRecovered} onChange={(e) => setSkipRecovered(e.target.checked)} style={{ accentColor: "#3fb950" }} />
                    Skip already-recovered functions
                  </label>
                  <label style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "12px", color: "#c9d1d9", cursor: "pointer" }}>
                    <input type="checkbox" checked={priorityStrings} onChange={(e) => setPriorityStrings(e.target.checked)} style={{ accentColor: "#58a6ff" }} />
                    Prioritize string-rich functions
                  </label>
                  <label style={{ display: "flex", alignItems: "center", gap: "8px", fontSize: "12px", color: "#c9d1d9" }}>
                    Max functions:
                    <input type="number" placeholder="All" value={maxFunctions} onChange={(e) => setMaxFunctions(e.target.value === "" ? "" : Number(e.target.value))}
                      style={{ width: "72px", backgroundColor: "#0d1117", border: "1px solid #30363d", borderRadius: "4px", color: "#e6edf3", fontSize: "12px", padding: "3px 6px", outline: "none" }} />
                  </label>
                </div>
                <div style={{ fontSize: "11px", color: "#8b949e", display: "flex", alignItems: "center", gap: "6px" }}>
                  <AlertTriangle size={12} color="#d29922" />
                  Each function = one LLM call. Large binaries may take several minutes. Start small if testing.
                </div>
              </div>

              {startError && <div style={{ backgroundColor: "#f851491a", border: "1px solid #f8514944", borderRadius: "6px", padding: "10px 14px", color: "#f85149", fontSize: "12px", marginBottom: "16px" }}>{startError}</div>}

              {/* Preview Table */}
              {strippedFns.length > 0 && (
                <div style={{ backgroundColor: "#161b22", border: "1px solid #21262d", borderRadius: "8px", overflow: "hidden" }}>
                  <div style={{ padding: "8px 14px", borderBottom: "1px solid #21262d", fontSize: "10px", color: "#8b949e", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.5px", display: "grid", gridTemplateColumns: "2fr 1.5fr 60px 60px 80px" }}>
                    <span>Stripped Name</span><span>Recovered</span><span>Blocks</span><span>Strings</span><span>Status</span>
                  </div>
                  <div style={{ maxHeight: "260px", overflowY: "auto" }}>
                    {strippedFns.map((fn) => (
                      <div key={fn.clean_name}
                        style={{ display: "grid", gridTemplateColumns: "2fr 1.5fr 60px 60px 80px", padding: "7px 14px", borderBottom: "1px solid #1c2128", fontSize: "11px", alignItems: "center", cursor: onSelectFunction ? "pointer" : "default" }}
                        onMouseEnter={(e) => (e.currentTarget.style.background = "#1c2128")}
                        onMouseLeave={(e) => (e.currentTarget.style.background = "transparent")}
                        onClick={() => onSelectFunction?.(fn.name)}>
                        <span style={{ color: "#e6edf3", fontFamily: "var(--font-mono)" }}>{fn.clean_name}</span>
                        <span style={{ color: fn.recovered_name ? "#3fb950" : "#8b949e", fontFamily: "var(--font-mono)", fontStyle: fn.recovered_name ? "normal" : "italic" }}>{fn.recovered_name || "—"}</span>
                        <span style={{ color: "#8b949e" }}>{fn.block_count}</span>
                        <span style={{ color: fn.has_strings ? "#58a6ff" : "#8b949e" }}>{fn.string_count > 0 ? fn.string_count : "—"}</span>
                        <span>{fn.already_recovered
                          ? <span style={{ color: "#3fb950", fontSize: "10px", display: "flex", alignItems: "center", gap: "3px" }}><CheckCircle2 size={11} /> Done</span>
                          : <span style={{ color: "#d29922", fontSize: "10px" }}>Pending</span>}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </>
          )}

          {(phase === "running" || (phase === "done" && job)) && job && (
            <div style={{ display: "flex", flexDirection: "column", gap: "16px" }}>
              {/* Progress */}
              <div style={{ backgroundColor: "#161b22", border: "1px solid #21262d", borderRadius: "8px", padding: "16px 20px" }}>
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "8px" }}>
                  <span style={{ fontSize: "12px", color: "#c9d1d9", fontWeight: 600 }}>
                    {job.status === "done" ? "✅ Scan Complete" : job.status === "cancelled" ? "⛔ Cancelled" : "🔄 Scanning..."}
                  </span>
                  <span style={{ fontSize: "12px", color: "#8b949e", fontFamily: "var(--font-mono)" }}>{job.completed} / {job.total} ({job.progress_pct}%)</span>
                </div>
                <div style={{ height: "6px", backgroundColor: "#21262d", borderRadius: "3px", overflow: "hidden" }}>
                  <div style={{ height: "100%", borderRadius: "3px", width: `${job.progress_pct}%`, background: job.status === "done" ? "linear-gradient(90deg,#238636,#3fb950)" : job.status === "cancelled" ? "#d29922" : "linear-gradient(90deg,#6e40c9,#bc8cff)", transition: "width 0.5s ease" }} />
                </div>
                {job.current_function && (
                  <div style={{ marginTop: "8px", fontSize: "11px", color: "#8b949e", fontFamily: "var(--font-mono)", display: "flex", alignItems: "center", gap: "6px" }}>
                    <Loader2 size={11} style={{ animation: "spin 1s linear infinite" }} />
                    Analyzing: <span style={{ color: "#d2a8ff" }}>{job.current_function}</span>
                  </div>
                )}
                <div style={{ marginTop: "6px", fontSize: "10px", color: "#8b949e", display: "flex", gap: "16px" }}>
                  <span>Elapsed: {job.elapsed_seconds}s</span>
                  {job.failed > 0 && <span style={{ color: "#f85149" }}>Failed: {job.failed}</span>}
                </div>
              </div>

              {/* Results */}
              {job.results.length > 0 && (
                <div style={{ backgroundColor: "#161b22", border: "1px solid #21262d", borderRadius: "8px", overflow: "hidden" }}>
                  <div style={{ padding: "10px 14px", borderBottom: "1px solid #21262d", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                    <span style={{ fontSize: "11px", fontWeight: 700, color: "#c9d1d9", display: "flex", alignItems: "center", gap: "6px" }}>
                      <Sparkles size={13} color="#bc8cff" /> Recovered Functions ({job.results.length})
                    </span>
                    <button onClick={handleExportCSV} style={{ display: "flex", alignItems: "center", gap: "5px", backgroundColor: "#161b22", border: "1px solid #30363d", color: "#58a6ff", padding: "3px 10px", borderRadius: "4px", fontSize: "10px", cursor: "pointer", fontWeight: 600 }}>
                      <Download size={11} /> Export CSV
                    </button>
                  </div>
                  <div style={{ display: "grid", gridTemplateColumns: "1.4fr 1.6fr 55px 100px", padding: "6px 14px", borderBottom: "1px solid #1c2128", fontSize: "10px", color: "#8b949e", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.4px" }}>
                    <span>Original</span><span>Recovered</span><span>Conf.</span><span>Category</span>
                  </div>
                  <div style={{ maxHeight: "320px", overflowY: "auto" }}>
                    {job.results.map((r: BatchScanResult, i: number) => (
                      <div key={i}
                        style={{ display: "grid", gridTemplateColumns: "1.4fr 1.6fr 55px 100px", padding: "7px 14px", borderBottom: "1px solid #1c2128", fontSize: "11px", alignItems: "center", cursor: onSelectFunction ? "pointer" : "default" }}
                        onMouseEnter={(e) => (e.currentTarget.style.background = "#1c2128")}
                        onMouseLeave={(e) => (e.currentTarget.style.background = "transparent")}
                        onClick={() => onSelectFunction?.(r.original_name)}
                        title={r.c_prototype}>
                        <span style={{ color: "#8b949e", fontFamily: "var(--font-mono)", fontSize: "10px" }}>{r.original_name.replace(/^<|>$/g, "")}</span>
                        <span style={{ color: "#7ee787", fontFamily: "var(--font-mono)", fontWeight: 600 }}>{r.recovered_name}</span>
                        <span style={{ color: r.confidence > 0.8 ? "#3fb950" : r.confidence > 0.6 ? "#d29922" : "#f85149", fontWeight: 700 }}>{Math.round(r.confidence * 100)}%</span>
                        <span style={{ fontSize: "9px", fontWeight: 700, padding: "2px 6px", borderRadius: "10px", backgroundColor: `${CATEGORY_COLORS[r.semantic_category] || "#30363d"}22`, color: CATEGORY_COLORS[r.semantic_category] || "#8b949e", border: `1px solid ${CATEGORY_COLORS[r.semantic_category] || "#30363d"}55` }}>
                          {r.semantic_category.replace("_", " ")}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Errors */}
              {job.errors.length > 0 && (
                <div style={{ backgroundColor: "#f851491a", border: "1px solid #f8514933", borderRadius: "8px", padding: "12px 16px" }}>
                  <div style={{ fontSize: "11px", fontWeight: 700, color: "#f85149", marginBottom: "8px", display: "flex", alignItems: "center", gap: "6px" }}>
                    <AlertTriangle size={13} /> {job.errors.length} Functions Failed
                  </div>
                  {job.errors.slice(0, 5).map((e, i) => (
                    <div key={i} style={{ fontSize: "10px", color: "#ff7b72", fontFamily: "var(--font-mono)", marginTop: "2px" }}>{e.function}: {e.error.substring(0, 90)}</div>
                  ))}
                  {job.errors.length > 5 && <div style={{ fontSize: "10px", color: "#8b949e", marginTop: "4px" }}>…and {job.errors.length - 5} more</div>}
                </div>
              )}
            </div>
          )}
        </div>

        {/* Footer */}
        <div style={{ padding: "12px 20px", borderTop: "1px solid #21262d", backgroundColor: "#161b22", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <div style={{ fontSize: "11px", color: "#8b949e", display: "flex", alignItems: "center", gap: "6px" }}>
            <Cpu size={12} color="#bc8cff" />
            {phase === "preview" && `${pendingCount} functions queued for AI recovery`}
            {phase === "running" && job && `${job.completed}/${job.total} processed — ${job.results.length} recovered`}
            {phase === "done" && job && `Scan complete: ${job.results.length} recovered, ${job.failed} failed`}
          </div>
          <div style={{ display: "flex", gap: "8px" }}>
            {phase === "preview" && (
              <>
                <button onClick={onClose} style={{ backgroundColor: "transparent", border: "1px solid #30363d", color: "#8b949e", padding: "6px 16px", borderRadius: "6px", cursor: "pointer", fontSize: "12px" }}>Close</button>
                <button onClick={handleStart} disabled={pendingCount === 0}
                  style={{ display: "flex", alignItems: "center", gap: "7px", backgroundColor: pendingCount > 0 ? "#6e40c9" : "#30363d", border: `1px solid ${pendingCount > 0 ? "#8957e5" : "#30363d"}`, color: "#fff", padding: "6px 18px", borderRadius: "6px", cursor: pendingCount > 0 ? "pointer" : "not-allowed", fontSize: "12px", fontWeight: 700, boxShadow: pendingCount > 0 ? "0 2px 12px rgba(110,64,201,0.5)" : "none" }}>
                  <ScanSearch size={13} /> Start AI Scan ({effectiveMax} functions)
                </button>
              </>
            )}
            {phase === "running" && (
              <button onClick={handleCancel} style={{ display: "flex", alignItems: "center", gap: "6px", backgroundColor: "#f851491a", border: "1px solid #f8514966", color: "#f85149", padding: "6px 16px", borderRadius: "6px", cursor: "pointer", fontSize: "12px", fontWeight: 600 }}>
                <StopCircle size={13} /> Cancel Scan
              </button>
            )}
            {phase === "done" && (
              <>
                <button onClick={handleReset} style={{ backgroundColor: "transparent", border: "1px solid #30363d", color: "#8b949e", padding: "6px 16px", borderRadius: "6px", cursor: "pointer", fontSize: "12px" }}>New Scan</button>
                <button onClick={handleExportCSV} style={{ display: "flex", alignItems: "center", gap: "6px", backgroundColor: "#1c2d3d", border: "1px solid #1f6beb66", color: "#58a6ff", padding: "6px 16px", borderRadius: "6px", cursor: "pointer", fontSize: "12px", fontWeight: 600 }}>
                  <Download size={13} /> Export CSV
                </button>
                <button onClick={onClose} style={{ backgroundColor: "#238636", border: "1px solid #2ea043", color: "#fff", padding: "6px 18px", borderRadius: "6px", cursor: "pointer", fontSize: "12px", fontWeight: 700 }}>Done</button>
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};
