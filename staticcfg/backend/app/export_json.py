import sys
import os
import time
from app.parser.asm_parser import ASMParser
from app.cache.cache_manager import CacheManager

def export_file_to_json(asm_file_path: str) -> str:
    if not os.path.exists(asm_file_path):
        raise FileNotFoundError(f"File not found: {asm_file_path}")

    print(f"[StaticCFG Export] Reading {asm_file_path}...")
    t0 = time.time()
    with open(asm_file_path, "r", encoding="utf-8", errors="replace") as f:
        content = f.read()

    file_hash = CacheManager.compute_hash(content)
    filename = os.path.basename(asm_file_path)

    # Check if cache already exists
    cached = CacheManager.load_cache(filename, file_hash)
    if cached:
        cache_path = CacheManager.get_cache_path(filename, file_hash)
        print(f"[StaticCFG Export] JSON cache already exists at {cache_path} ({cached.function_count} functions).")
        return cache_path

    print(f"[StaticCFG Export] Parsing assembly & building CFGs...")
    parsed_file = ASMParser.parse_content(content, filename=filename)
    t_parse = time.time() - t0
    print(f"[StaticCFG Export] Parsed {len(parsed_file.functions)} functions in {t_parse:.2f}s.")

    print(f"[StaticCFG Export] Serializing to JSON cache...")
    analysis = CacheManager.build_from_parsed_file(parsed_file, file_hash)
    cache_path = CacheManager.save_cache(filename, file_hash, analysis)

    t_total = time.time() - t0
    print(f"[StaticCFG Export] Done! JSON cache exported in {t_total:.2f}s -> {cache_path}")
    return cache_path

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python -m app.export_json <path_to_asm_file>")
        sys.exit(1)

    path = sys.argv[1]
    export_file_to_json(path)
