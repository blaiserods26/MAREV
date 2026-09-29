import axios from 'axios';
import {
  AnalysisResponse,
  FunctionSummary,
  CFG,
  CallGraph,
  FunctionAnalysisReport,
  FunctionFingerprint,
  IdentificationResult,
} from '../types/cfg';

const API_BASE = '/api';

export async function checkHealth(): Promise<{ status: string; active_file?: string; function_count?: number }> {
  const res = await axios.get(`${API_BASE}/health`);
  return res.data;
}

export async function uploadASMFile(file: File): Promise<AnalysisResponse> {
  const formData = new FormData();
  formData.append('file', file);
  const res = await axios.post<AnalysisResponse>(`${API_BASE}/analyze`, formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  });
  return res.data;
}

export async function getFunctions(params?: {
  query?: string;
  section?: string;
  hide_plt?: boolean;
  hide_cold?: boolean;
}): Promise<FunctionSummary[]> {
  const res = await axios.get<FunctionSummary[]>(`${API_BASE}/functions`, { params });
  return res.data;
}

export async function getFunctionCFG(functionName: string): Promise<CFG> {
  const encoded = encodeURIComponent(functionName);
  const res = await axios.get<CFG>(`${API_BASE}/cfg/${encoded}`);
  return res.data;
}

export async function getFunctionAnalysis(functionName: string): Promise<FunctionAnalysisReport> {
  const encoded = encodeURIComponent(functionName);
  const res = await axios.get<FunctionAnalysisReport>(`${API_BASE}/analysis/${encoded}`);
  return res.data;
}

export async function getFunctionFingerprint(functionName: string): Promise<FunctionFingerprint> {
  const encoded = encodeURIComponent(functionName);
  const res = await axios.get<FunctionFingerprint>(`${API_BASE}/fingerprint/${encoded}`);
  return res.data;
}

export async function getFunctionIdentification(functionName: string): Promise<IdentificationResult> {
  const encoded = encodeURIComponent(functionName);
  const res = await axios.get<IdentificationResult>(`${API_BASE}/identification/${encoded}`);
  return res.data;
}

export async function getIdentifications(): Promise<Record<string, IdentificationResult>> {
  const res = await axios.get<Record<string, IdentificationResult>>(`${API_BASE}/identifications`);
  return res.data;
}

export async function getCallGraph(): Promise<CallGraph> {
  const res = await axios.get<CallGraph>(`${API_BASE}/callgraph`);
  return res.data;
}

export async function agentIdentifyFunction(functionName: string): Promise<IdentificationResult> {
  const encoded = encodeURIComponent(functionName);
  const res = await axios.post<IdentificationResult>(`${API_BASE}/functions/${encoded}/agent-identify`);
  return res.data;
}

export interface AgentProviderOption {
  id: string;
  name: string;
  available: boolean;
  models?: string[];
}

export interface AgentStatusResponse {
  status: string;
  active_provider: string;
  is_available: boolean;
  available_providers: AgentProviderOption[];
}

export async function getAgentStatus(): Promise<AgentStatusResponse> {
  const res = await axios.get<AgentStatusResponse>(`${API_BASE}/agent/status`);
  return res.data;
}

export async function configureAgentProvider(config: {
  provider: string;
  model?: string;
  base_url?: string;
  api_key?: string;
}): Promise<AgentStatusResponse> {
  const res = await axios.post<AgentStatusResponse>(`${API_BASE}/agent/config`, config);
  return res.data;
}


