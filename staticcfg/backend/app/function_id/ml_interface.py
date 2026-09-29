from abc import ABC, abstractmethod
from typing import Dict, Any, List, Optional
from app.function_id.models import CandidatePrediction

class BaseMLClassifier(ABC):
    """
    Abstract interface for machine learning / deep learning function identification models
    (e.g., Asm2Vec, SAFE, GNN embeddings, or transformer-based classifiers).
    """

    @abstractmethod
    def name(self) -> str:
        """Returns the model identifier or name."""
        pass

    @abstractmethod
    def is_available(self) -> bool:
        """Checks if model weights and runtime dependencies are available."""
        pass

    @abstractmethod
    def predict(self, fingerprint: Dict[str, Any], cfg_dict: Dict[str, Any]) -> List[CandidatePrediction]:
        """
        Given function fingerprint and CFG metrics, returns ranked CandidatePredictions.
        """
        pass
