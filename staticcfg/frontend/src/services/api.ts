import axios from 'axios';
import { AnalysisResponse, FunctionSummary, CFG, CallGraph } from '../types/cfg';

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

export async function getCallGraph(): Promise<CallGraph> {
  const res = await axios.get<CallGraph>(`${API_BASE}/callgraph`);
  return res.data;
}
