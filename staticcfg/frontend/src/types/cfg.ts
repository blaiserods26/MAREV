export interface Instruction {
  address: number;
  raw_bytes: string[];
  mnemonic: string;
  operands: string;
  target: number | null;
  section: string | null;
  function: string | null;
  line_number: number;
  comment?: string | null;
  is_indirect?: boolean;
}

export interface FunctionSummary {
  name: string;
  address: string;
  start_address: number;
  end_address: number | null;
  instruction_count: number;
  section: string | null;
}

export interface BasicBlock {
  id: string;
  start_address: number;
  end_address: number;
  instructions: Instruction[];
}

export type CFGEdgeType =
  | 'fallthrough'
  | 'true'
  | 'false'
  | 'jump'
  | 'call'
  | 'return'
  | 'indirect'
  | 'unknown';

export interface CFGEdge {
  source: string;
  target: string;
  type: CFGEdgeType;
}

export interface CFG {
  function: string;
  entry: string;
  nodes: BasicBlock[];
  edges: CFGEdge[];
  cyclomatic_complexity: number;
  unreachable_blocks: string[];
}

export interface AnalysisResponse {
  file: string;
  architecture: string;
  sections: string[];
  function_count: number;
}

export interface CallGraphEdge {
  caller: string;
  callee: string;
  address: number;
}

export interface CallGraph {
  nodes: string[];
  edges: CallGraphEdge[];
}
