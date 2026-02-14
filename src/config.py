from langchain_openai import ChatOpenAI
from pydantic_settings import BaseSettings
from typing import Optional, Dict, Any
import yaml
from pathlib import Path


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    
    # OpenAI Configuration
    openai_api_key: str
    openai_model: str = "gpt-4.1-mini"
    openai_base_url: Optional[str] = None
    
    # LLM Parameters
    temperature: float = 0.1
    max_tokens: int = 2000
    
    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
        extra = "ignore"


class LLMConfig:
    """LLM configuration and initialization."""
    
    def __init__(self, settings: Settings):
        self.settings = settings
        self._llm: Optional[ChatOpenAI] = None
    
    @property
    def llm(self) -> ChatOpenAI:
        """Get or create LLM instance."""
        if self._llm is None:
            self._llm = ChatOpenAI(
                api_key=self.settings.openai_api_key,
                model=self.settings.openai_model,
                temperature=self.settings.temperature,
                max_tokens=self.settings.max_tokens,
                base_url=self.settings.openai_base_url
            )
        return self._llm
    
    def reset_llm(self):
        """Reset the LLM instance (useful for testing)."""
        self._llm = None


# Global instances
_settings: Optional[Settings] = None
_llm_config: Optional[LLMConfig] = None
llm: Optional[ChatOpenAI] = None
_project_config: Optional[Dict[str, Any]] = None


def initialize_llm(settings: Optional[Settings] = None) -> ChatOpenAI:
    """
    Initialize the global LLM instance.
    
    Args:
        settings: Optional Settings instance. If not provided, will load from environment.
    
    Returns:
        ChatOpenAI: The initialized LLM instance.
    """
    global _settings, _llm_config, llm
    
    if settings is None:
        settings = Settings()
    
    _settings = settings
    _llm_config = LLMConfig(settings)
    llm = _llm_config.llm
    
    return llm


def load_project_config(project_dir: str) -> Dict[str, Any]:
    """
    Load project-specific configuration from YAML file.
    
    Args:
        project_dir: Path to the project directory (e.g., project-inputs/chef)
    
    Returns:
        Dict: Project configuration dictionary.
    """
    global _project_config
    
    config_file = Path(project_dir) / "project-config.yaml"
    
    if not config_file.exists():
        # Return default configuration if file doesn't exist
        return {
            "project_name": Path(project_dir).name,
            "terraform_minor": "cloud_evolucion_menor.tf",
            "terraform_major": "cloud_evolucion_mayor.tf",
            "source_code_zip": "app.zip",
            "knowledge_base": "knowledge/IAC.txt",
            "llm": {
                "model": "gpt-4o",
                "temperature": 0.3,
                "max_tokens": 2000
            },
            "context_generation": {
                "max_files": 10,
                "max_file_size": 5000
            },
            "analysis": {
                "use_spanish_knowledge_base": False,
                "knowledge_base_language": "en"
            }
        }
    
    with open(config_file, 'r') as f:
        config = yaml.safe_load(f)
    
    _project_config = config
    return config


def get_settings() -> Settings:
    """Get the global settings instance."""
    global _settings
    if _settings is None:
        _settings = Settings()
    return _settings


def get_llm_config() -> Optional[LLMConfig]:
    """Get the global LLM config instance."""
    return _llm_config


def get_project_config() -> Optional[Dict[str, Any]]:
    """Get the global project config instance."""
    return _project_config


def reset_global_state():
    """Reset all global state (useful for testing)."""
    global _settings, _llm_config, llm, _project_config
    _settings = None
    _llm_config = None
    llm = None
    _project_config = None
