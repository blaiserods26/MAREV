import pytest
from fastapi.testclient import TestClient
from app.main import app
from app.parser.asm_parser import ASMParser
from app.analysis.engine import AnalysisEngine
from app.api.session import SessionStore
from app.function_id.agent.tools import FunctionInspectionToolset
from app.function_id.agent.engine import AgenticFunctionIdentifier
from app.function_id.agent.providers.mock import MockDeterministicProvider
from app.function_id.models import RecoveredSignature, ParameterSignature

SAMPLE_STRIPPED_ASM = """
file format elf64-x86-64

Disassembly of section .text:

0000000000401000 <sub_401000>:
  401000:	55                   	push   %rbp
  401001:	48 89 e5             	mov    %rsp,%rbp
  401004:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  401008:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40100c:	0f b6 00             	movzbl (%rax),%eax
  40100f:	84 c0                	test   %al,%al
  401011:	74 12                	je     401025 <sub_401000+0x25>
  401013:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401017:	48 8d 35 e2 0f 00 00 	lea    0xfe2(%rip),%rsi        # 402000 <_IO_stdin_used+0x4>
  40101e:	e8 20 00 00 00       	call   401043 <sub_401043>
  401023:	eb 05                	jmp    40102a <sub_401000+0x2a>
  401025:	b8 00 00 00 00       	mov    $0x0,%eax
  40102a:	5d                   	pop    %rbp
  40102b:	c3                   	ret

0000000000401043 <sub_401043>:
  401043:	55                   	push   %rbp
  401044:	48 89 e5             	mov    %rsp,%rbp
  401047:	b8 01 00 00 00       	mov    $0x1,%eax
  40104c:	5d                   	pop    %rbp
  40104d:	c3                   	ret
"""

@pytest.fixture
def analyzed_session():
    parser = ASMParser()
    project = parser.parse_content(SAMPLE_STRIPPED_ASM, filename="test_agent.asm")
    analysis = AnalysisEngine().analyze(project, "test_hash_123")
    store = SessionStore.get_instance()
    store.set_active_analysis("session_test", analysis)
    return analysis

def test_inspection_toolset_extraction(analyzed_session):
    toolset = FunctionInspectionToolset(analyzed_session)
    report = toolset.inspect_function("sub_401000")

    assert report["function_name"] == "sub_401000"
    assert report["block_count"] >= 3
    assert "rdi" in report["observed_arg_registers"]
    assert report["estimated_arg_count"] >= 1
    assert report["returns_value"] is True
    assert len(report["callees"]) == 1
    assert "sub_401043" in report["callees"][0]["function_name"]

def test_fetch_nested_callee_code(analyzed_session):
    toolset = FunctionInspectionToolset(analyzed_session)
    callee_info = toolset.fetch_nested_or_callee_code("sub_401043")

    assert "error" not in callee_info
    assert callee_info["function_name"] == "sub_401043"
    assert callee_info["block_count"] >= 1
    assert len(callee_info["blocks"]) > 0

def test_agentic_function_identifier_engine(analyzed_session):
    provider = MockDeterministicProvider()
    identifier = AgenticFunctionIdentifier(analyzed_session, provider=provider)
    result = identifier.identify_function("sub_401000")

    assert result.recovered_name == "sub_401000"
    assert result.recovered_signature is not None
    sig = result.recovered_signature
    assert isinstance(sig, RecoveredSignature)
    assert len(sig.c_prototype) > 0
    assert len(sig.parameters) >= 1
    assert sig.calling_convention == "System V AMD64"
    assert sig.confidence > 0.5
    assert len(sig.reasoning) > 0

def test_api_agent_endpoints(analyzed_session):
    client = TestClient(app)

    # 1. Test Agent Status
    status_resp = client.get("/api/agent/status")
    assert status_resp.status_code == 200
    status_data = status_resp.json()
    assert status_data["status"] == "ready"
    assert "provider" in status_data

    # 2. Test On-Demand Agent Identification
    ident_resp = client.post("/api/functions/sub_401000/agent-identify")
    assert ident_resp.status_code == 200
    ident_data = ident_resp.json()
    assert ident_data["recovered_name"] == "sub_401000"
    assert "recovered_signature" in ident_data
    assert ident_data["recovered_signature"]["name"] is not None
    assert len(ident_data["recovered_signature"]["parameters"]) >= 1

    # 3. Test 404 on non-existent function
    missing_resp = client.post("/api/functions/non_existent_func/agent-identify")
    assert missing_resp.status_code == 404
