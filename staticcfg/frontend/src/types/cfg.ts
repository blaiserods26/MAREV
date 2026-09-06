export type ArchitectureType = 'x86-64' | 'x86' | 'arm64' | 'unknown';

export type InstructionType =
  | 'NORMAL'
  | 'COND_BRANCH'
  | 'UNCOND_BRANCH'
  | 'CALL'
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

export interface BinaryProject {
  filename: string;
  architecture: ArchitectureType;
  format: string;
  sections: Section[];
  functions: Record<string, FunctionSummary>;
  entry_point?: number | null;
  global_references?: Reference[];
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
