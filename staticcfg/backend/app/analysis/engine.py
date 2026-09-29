from typing import List, Dict, Optional
from app.ir.models import BinaryProject, Function, CFG
from app.models.schemas import FunctionSummary
from app.cfg.builder import CFGBuilder
from app.recovery.engine import FunctionRecoveryEngine
from app.analysis.callgraph import build_call_graph, CallGraph
from app.analysis.fingerprint import generate_fingerprint, FunctionFingerprint
from app.function_id.models import IdentificationResult
from app.function_id.pipeline import IdentificationPipeline
from app.analysis.models import CachedAnalysis

class AnalysisEngine:
    """Deep module orchestrating x86-64 binary analysis pipeline.

    Encapsulates:
    1. Function boundary and attribute refinement
    2. Control Flow Graph construction
    3. Program call graph analysis
    4. Structural and semantic fingerprinting
    5. Multi-stage explainable function identification
    """

    def __init__(
        self,
        cfg_builder: Optional[CFGBuilder] = None,
        recovery_engine: Optional[FunctionRecoveryEngine] = None,
        identification_pipeline: Optional[IdentificationPipeline] = None,
    ):
        self.cfg_builder = cfg_builder or CFGBuilder()
        self.recovery_engine = recovery_engine or FunctionRecoveryEngine()
        self.identification_pipeline = identification_pipeline or IdentificationPipeline()

    def analyze(self, project: BinaryProject, content_hash: str = "") -> CachedAnalysis:
        """Execute complete static analysis pipeline on a BinaryProject IR."""
        # 1. Refine functions and boundaries
        refined_functions_map = self.recovery_engine.recover_functions(project)
        funcs_list = list(refined_functions_map.values())

        func_summaries: List[FunctionSummary] = []
        cfgs: Dict[str, CFG] = {}
        fingerprints: Dict[str, FunctionFingerprint] = {}
        identifications: Dict[str, IdentificationResult] = {}

        # 2. CFG and Fingerprint Generation
        for func in funcs_list:
            summary = FunctionSummary(
                name=func.name,
                address=f"0x{func.start_address:x}",
                start_address=func.start_address,
                end_address=func.end_address,
                instruction_count=func.instruction_count,
                section=func.section_name,
            )
            func_summaries.append(summary)

            cfg = self.cfg_builder.build_cfg(func)
            cfgs[func.name] = cfg

            fp = generate_fingerprint(func, cfg)
            fingerprints[func.name] = fp

        # 3. Call Graph Extraction
        cg = build_call_graph(funcs_list)

        # 4. Multi-stage Function Identification
        for idx, func in enumerate(funcs_list):
            cfg = cfgs[func.name]
            fp = fingerprints[func.name]
            rel = cg.relationships.get(func.name)
            callers = rel.callers if rel else []
            id_result = self.identification_pipeline.identify_function(
                func, cfg, fp, call_graph_callers=callers
            )
            identifications[func.name] = id_result

            if id_result.top_prediction:
                func_summaries[idx].predicted_name = id_result.top_prediction.predicted_name
                func_summaries[idx].confidence = id_result.top_prediction.confidence
                func_summaries[idx].semantic_category = id_result.semantic_category.value
            else:
                func_summaries[idx].semantic_category = id_result.semantic_category.value

        section_names = [sec.name for sec in project.sections]

        return CachedAnalysis(
            file=project.filename,
            file_hash=content_hash,
            architecture=project.architecture.value,
            sections=section_names,
            function_count=len(funcs_list),
            functions=func_summaries,
            cfgs=cfgs,
            fingerprints=fingerprints,
            identifications=identifications,
            callgraph=cg,
        )
