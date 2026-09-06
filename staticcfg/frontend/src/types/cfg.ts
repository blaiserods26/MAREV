export type ArchitectureType = 'x86-64' | 'x86' | 'arm64' | 'unknown';

export type InstructionType =
  | 'NORMAL'
  | 'COND_BRANCH'
  | 'UNCOND_BRANCH'
  | 'CALL'
  | 'INDIRECT_CALL'
  | 'RET'
  | 'INDIRECT_JUMP'
  | 'DATA'
  | 'NOP';

export type RefType = 'CALL' | 'JUMP' | 'DATA' | 'STRING';

export interface Reference {
  source_address: number;
  target_address?: number | null;
  target_symbol?: string | null;
  ref_type: RefType;
  description?: string | null;
}

export interface Instruction {
  address: number;
  raw_bytes: string[];
  mnemonic: string;
  operands: string;
  target: number | null;
  target_symbol?: string | null;
  instruction_type?: InstructionType;
  section: string | null;
  function: string | null;
  function_name?: string | null;
  line_number: number;
  comment?: string | null;
  is_indirect?: boolean;
  references?: Reference[];
}

export interface Section {
  name: string;
  start_address: number;
  end_address: number;
  size_bytes: number;
  flags?: string[];
  instructions?: Instruction[];
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
  predecessors?: string[];
  successors?: string[];
  terminator_type?: InstructionType | null;
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
  condition?: string | null;
}

export interface CFG {
  function: string;
  entry: string;
  function_name?: string | null;
  entry_block_id?: string | null;
  exit_block_ids?: string[];
  nodes: BasicBlock[];
  edges: CFGEdge[];
  cyclomatic_complexity: number;
  unreachable_blocks: string[];
}

export interface DominatorTreeInfo {
  entry_block_id: string;
  dominators: Record<string, string[]>;
  immediate_dominators: Record<string, string | null>;
  dominance_frontiers: Record<string, string[]>;
}

export interface BackEdge {
  source: string;
  target: string;
}

export interface NaturalLoop {
  header: string;
  tail: string;
  blocks: string[];
}

export interface LoopAnalysisResult {
  back_edges: BackEdge[];
  loops: NaturalLoop[];
  strongly_connected_components: string[][];
}

export interface FunctionFingerprint {
  function_name: string;
  start_address: number;
  instruction_count: number;
  basic_block_count: number;
  edge_count: number;
  branch_count: number;
  call_count: number;
  return_count: number;
  loop_count: number;
  cyclomatic_complexity: number;
  called_functions: string[];
  imported_apis: string[];
  string_references: string[];
  constants: number[];
  instruction_category_frequencies: Record<string, number>;
  cfg_hash: string;
  feature_vector: Record<string, number>;
}

export interface CallSite {
  function_name: string;
  address: number;
}

export interface FunctionCallInfo {
  function_name: string;
  callers: CallSite[];
  callees: CallSite[];
}

export interface FunctionAnalysisReport {
  function: string;
  start_address: string | null;
  end_address: string | null;
  instruction_count: number;
  basic_block_count: number;
  edge_count: number;
  cyclomatic_complexity: number;
  unreachable_blocks: string[];
  dominators: DominatorTreeInfo;
  loops: LoopAnalysisResult;
  callers: CallSite[];
  callees: CallSite[];
  fingerprint?: FunctionFingerprint | null;
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
  relationships?: Record<string, FunctionCallInfo>;
}
