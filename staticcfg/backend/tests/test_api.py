import io
from fastapi.testclient import TestClient

def test_health_check(api_client: TestClient):
    response = api_client.get("/api/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "ok"

def test_upload_and_analyze(api_client: TestClient, sample_asm_snippet):
    file_bytes = sample_asm_snippet.encode("utf-8")
    files = {"file": ("test.asm", io.BytesIO(file_bytes), "text/plain")}

    response = api_client.post("/api/analyze", files=files)
    assert response.status_code == 200
    data = response.json()
    assert data["file"] == "test.asm"
    assert data["function_count"] >= 2

def test_get_functions(api_client: TestClient, sample_asm_snippet):
    file_bytes = sample_asm_snippet.encode("utf-8")
    files = {"file": ("test.asm", io.BytesIO(file_bytes), "text/plain")}
    api_client.post("/api/analyze", files=files)

    response = api_client.get("/api/functions")
    assert response.status_code == 200
    funcs = response.json()
    assert len(funcs) >= 2
    names = [f["name"] for f in funcs]
    assert "main" in names

def test_get_cfg_main(api_client: TestClient, sample_asm_snippet):
    file_bytes = sample_asm_snippet.encode("utf-8")
    files = {"file": ("test.asm", io.BytesIO(file_bytes), "text/plain")}
    api_client.post("/api/analyze", files=files)

    response = api_client.get("/api/cfg/main")
    assert response.status_code == 200
    cfg = response.json()
    assert cfg.get("function") == "main" or cfg.get("function_name") == "main"
    assert len(cfg["nodes"]) > 0

def test_get_functions_with_prediction_and_search(api_client: TestClient, sample_asm_snippet):
    file_bytes = sample_asm_snippet.encode("utf-8")
    files = {"file": ("test.asm", io.BytesIO(file_bytes), "text/plain")}
    api_client.post("/api/analyze", files=files)

    response = api_client.get("/api/functions?query=main")
    assert response.status_code == 200
    funcs = response.json()
    assert len(funcs) == 1
    assert funcs[0]["name"] == "main"
    assert "semantic_category" in funcs[0]

def test_get_function_analysis(api_client: TestClient, sample_asm_snippet):
    file_bytes = sample_asm_snippet.encode("utf-8")
    files = {"file": ("test.asm", io.BytesIO(file_bytes), "text/plain")}
    api_client.post("/api/analyze", files=files)

    response = api_client.get("/api/analysis/main")
    assert response.status_code == 200
    data = response.json()
    assert "identification" in data
    assert "fingerprint" in data
    assert "dominators" in data
    assert "loops" in data

