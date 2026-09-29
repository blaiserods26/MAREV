"""Tests for function identification pipeline, signature matching, and semantic classification."""

import pytest
from app.parser.asm_parser import ASMParser
from app.cfg.builder import CFGBuilder
from app.analysis.fingerprint import generate_fingerprint
from app.function_id.models import SemanticCategory
from app.function_id.database import SignatureDatabase, KnownFunctionSignature
from app.function_id.semantic_classifier import SemanticClassifier
from app.function_id.similarity import compute_cfg_similarity, compute_fingerprint_similarity
from app.function_id.pipeline import IdentificationPipeline

VALIDATOR_ASM = """
0000000000401820 <sub_401820>:
  401820:	55                   	push   rbp
  401821:	48 89 e5             	mov    rbp,rsp
  401824:	48 83 ec 10          	sub    rsp,0x10
  401828:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 40182f <sub_401820+0xf> "password"
  40182f:	e8 00 00 00 00       	call   401834 <strcmp>
  401834:	85 c0                	test   eax,eax
  401836:	74 05                	je     40183d <sub_401820+0x1d>
  401838:	b8 00 00 00 00       	mov    eax,0x0
  40183d:	b8 01 00 00 00       	mov    eax,0x1
  401842:	c9                   	leave  
  401843:	c3                   	ret    
"""

def test_signature_database_defaults():
    db = SignatureDatabase()
    assert len(db.signatures) > 5
    val_sigs = db.get_signatures_by_category(SemanticCategory.VALIDATION)
    assert any(s.name == "validate_password" for s in val_sigs)

def test_semantic_classifier():
    parser = ASMParser()
    project = parser.parse_content(VALIDATOR_ASM, filename="validator.asm")
    func = project.functions["sub_401820"]
    cfg = CFGBuilder().build_cfg(func)
    fp = generate_fingerprint(func, cfg)

    classifier = SemanticClassifier()
    category, evidence, scores = classifier.classify(func, fp)

    assert category in [SemanticCategory.VALIDATION, SemanticCategory.STRING_PROCESSING]
    assert len(evidence) > 0

def test_identification_pipeline():
    parser = ASMParser()
    project = parser.parse_content(VALIDATOR_ASM, filename="validator.asm")
    func = project.functions["sub_401820"]
    cfg = CFGBuilder().build_cfg(func)
    fp = generate_fingerprint(func, cfg)

    pipeline = IdentificationPipeline()
    result = pipeline.identify_function(func, cfg, fp)

    assert result.recovered_name == "sub_401820"
    assert result.formatted_address == "0x401820"
    assert result.top_prediction is not None
    assert result.top_prediction.predicted_name in ["validate_password", "check_password", "verify_credentials"]
    assert result.top_prediction.confidence >= 0.40
    assert len(result.evidence_summary) > 0
    assert any("strcmp" in e for e in result.evidence_summary)
    assert len(result.alternative_candidates) >= 1

def test_cfg_similarity():
    parser = ASMParser()
    project = parser.parse_content(VALIDATOR_ASM, filename="validator.asm")
    func = project.functions["sub_401820"]
    cfg = CFGBuilder().build_cfg(func)

    sim = compute_cfg_similarity(cfg, cfg)
    assert sim == 1.0

def test_fingerprint_similarity():
    parser = ASMParser()
    project = parser.parse_content(VALIDATOR_ASM, filename="validator.asm")
    func = project.functions["sub_401820"]
    cfg = CFGBuilder().build_cfg(func)
    fp = generate_fingerprint(func, cfg)

    fp_dict = fp.model_dump()
    sim = compute_fingerprint_similarity(fp_dict, fp_dict)
    assert sim == 1.0
