from app.basic_block.engine import BasicBlockEngine

def find_leaders(instructions):
    engine = BasicBlockEngine()
    return list(engine.find_leaders(instructions))
