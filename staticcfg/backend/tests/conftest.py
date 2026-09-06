import os
import pytest
from fastapi.testclient import TestClient
from app.main import app
from app.config import settings
from app.parser.asm_parser import ASMParser
from app.ir.models import BinaryProject

SAMPLE_DISASSEMBLY = """
Disassembly of section .text:

0000000000401000 <_start>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	31 ed                	xor    %ebp,%ebp
  401006:	e8 10 00 00 00       	call   40101b <main>
  40100b:	f4                   	hlt    

000000000040101b <main>:
  40101b:	55                   	push   %rbp
  40101c:	48 89 e5             	mov    %rsp,%rbp
  40101f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  401023:	74 09                	je     40102e <main+0x13>
  401025:	b8 01 00 00 00       	mov    $0x1,%eax
  40102a:	eb 05                	jmp    401031 <main+0x16>
  40102e:	b8 00 00 00 00       	mov    $0x0,%eax
  401031:	5d                   	pop    %rbp
  401032:	c3                   	ret    
"""

@pytest.fixture
def validator_asm_path():
    return settings.validator_sample_path

@pytest.fixture
def sample_asm_snippet():
    return SAMPLE_DISASSEMBLY

@pytest.fixture
def parsed_binary_project(sample_asm_snippet) -> BinaryProject:
    parser = ASMParser()
    return parser.parse_content(sample_asm_snippet, filename="test_sample.asm")

@pytest.fixture
def api_client():
    return TestClient(app)
