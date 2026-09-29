from typing import Dict, Any, Set, List, Union
from app.ir.models import CFG
from app.analysis.loops import analyze_loops

def jaccard_similarity(set1: Set[Any], set2: Set[Any]) -> float:
    """Compute Jaccard similarity between two sets."""
    if not set1 and not set2:
        return 1.0
    if not set1 or not set2:
        return 0.0
    intersection = len(set1.intersection(set2))
    union = len(set1.union(set2))
    return intersection / union if union > 0 else 0.0

def ratio_similarity(val1: float, val2: float) -> float:
    """Compute normalized ratio similarity between two numeric values in [0, 1]."""
    if val1 == 0 and val2 == 0:
        return 1.0
    max_v = max(abs(val1), abs(val2))
    if max_v == 0:
        return 1.0
    diff = abs(val1 - val2)
    return max(0.0, 1.0 - (diff / max_v))

def compute_cfg_similarity(cfg1: Union[CFG, Dict[str, Any]], cfg2: Union[CFG, Dict[str, Any]]) -> float:
    """
    Compute structural similarity (0.0 to 1.0) between two CFGs (Pydantic objects or dicts).
    """
    if isinstance(cfg1, CFG):
        blocks1 = len(cfg1.nodes)
        edges1 = len(cfg1.edges)
        cc1 = cfg1.cyclomatic_complexity
        loops1 = len(analyze_loops(cfg1).loops)
    else:
        blocks1 = cfg1.get("block_count", 0)
        edges1 = cfg1.get("edge_count", 0)
        cc1 = cfg1.get("cyclomatic_complexity", 1)
        loops1 = cfg1.get("loop_count", 0)

    if isinstance(cfg2, CFG):
        blocks2 = len(cfg2.nodes)
        edges2 = len(cfg2.edges)
        cc2 = cfg2.cyclomatic_complexity
        loops2 = len(analyze_loops(cfg2).loops)
    else:
        blocks2 = cfg2.get("block_count", 0)
        edges2 = cfg2.get("edge_count", 0)
        cc2 = cfg2.get("cyclomatic_complexity", 1)
        loops2 = cfg2.get("loop_count", 0)

    sim_blocks = ratio_similarity(blocks1, blocks2)
    sim_edges = ratio_similarity(edges1, edges2)
    sim_cc = ratio_similarity(cc1, cc2)
    sim_loops = ratio_similarity(loops1, loops2)

    weights = {"blocks": 0.3, "edges": 0.3, "cc": 0.2, "loops": 0.2}
    total_sim = (
        sim_blocks * weights["blocks"] +
        sim_edges * weights["edges"] +
        sim_cc * weights["cc"] +
        sim_loops * weights["loops"]
    )
    return min(1.0, max(0.0, total_sim))

def compute_fingerprint_similarity(fp1: Dict[str, Any], fp2: Dict[str, Any]) -> float:
    """
    Compute feature fingerprint similarity score (0.0 to 1.0) between two function fingerprints.
    """
    sim_insts = ratio_similarity(fp1.get("instruction_count", 0), fp2.get("instruction_count", 0))
    sim_blocks = ratio_similarity(fp1.get("basic_block_count", 0), fp2.get("basic_block_count", 0))
    sim_calls = ratio_similarity(fp1.get("call_count", 0), fp2.get("call_count", 0))
    sim_branches = ratio_similarity(fp1.get("branch_count", 0), fp2.get("branch_count", 0))

    called1 = set(fp1.get("called_functions", []))
    called2 = set(fp2.get("called_functions", []))
    sim_called = jaccard_similarity(called1, called2)

    strings1 = set(fp1.get("string_references", []))
    strings2 = set(fp2.get("string_references", []))
    sim_strings = jaccard_similarity(strings1, strings2)

    consts1 = set(fp1.get("constants", []))
    consts2 = set(fp2.get("constants", []))
    sim_consts = jaccard_similarity(consts1, consts2)

    cat1 = fp1.get("instruction_category_frequencies") or fp1.get("instruction_categories", {})
    cat2 = fp2.get("instruction_category_frequencies") or fp2.get("instruction_categories", {})
    all_keys = set(cat1.keys()).union(set(cat2.keys()))
    if all_keys:
        cat_sims = [ratio_similarity(cat1.get(k, 0), cat2.get(k, 0)) for k in all_keys]
        sim_cats = sum(cat_sims) / len(cat_sims)
    else:
        sim_cats = 1.0

    weights = {
        "insts": 0.15,
        "blocks": 0.15,
        "calls": 0.15,
        "branches": 0.10,
        "called": 0.15,
        "strings": 0.15,
        "consts": 0.10,
        "cats": 0.05,
    }

    score = (
        sim_insts * weights["insts"] +
        sim_blocks * weights["blocks"] +
        sim_calls * weights["calls"] +
        sim_branches * weights["branches"] +
        sim_called * weights["called"] +
        sim_strings * weights["strings"] +
        sim_consts * weights["consts"] +
        sim_cats * weights["cats"]
    )
    return min(1.0, max(0.0, score))
