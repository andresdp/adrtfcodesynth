"""
Configuration module for ADR Code Synth application.

This module provides classes and functions for managing application settings,
including LLM configuration with multiple provider support (OpenAI, Groq, Gemini),
and project-specific configuration loading from YAML files.

Main Components:
    - LLMProviderType: Enum defining supported LLM providers
    - LLMFactory: Factory pattern for creating LangChain chat models
    - Settings: Pydantic model for environment-based configuration
    - LLMConfig: Manages LLM initialization and instances
    - Global functions: For initializing and accessing configuration state

Supported LLM Providers:
    - openai: OpenAI GPT models (ChatOpenAI)
    - groq: Groq fast inference (ChatGroq)
    - gemini: Google Gemini models (ChatGoogleGenerativeAI)

Usage:
    # Load settings from environment (defaults to OpenAI)
    settings = Settings()
    
    # Initialize LLM (will use configured provider)
    llm = initialize_llm()
    
    # Load project configuration
    project_config = load_project_config("project-inputs/chef")

Environment Variables:
    LLM_PROVIDER: Provider name - "openai", "groq", or "gemini" (default: openai)
    
    # OpenAI Configuration
    OPENAI_API_KEY: OpenAI API key
    OPENAI_MODEL: Model name (default: gpt-4.1-mini)
    OPENAI_BASE_URL: Optional custom endpoint URL
    
    # Groq Configuration
    GROQ_API_KEY: Groq API key
    GROQ_MODEL: Model name (default: llama-3.3-70b-versatile)
    
    # Gemini Configuration
    GOOGLE_API_KEY: Google API key
    GEMINI_MODEL: Model name (default: gemini-1.5-pro)
    
    # Common LLM Parameters (shared across all providers)
    TEMPERATURE: LLM temperature parameter (default: 0.1)
    MAX_TOKENS: Maximum tokens for LLM response (default: None)
"""

from enum import Enum
from langchain_openai import ChatOpenAI
from langchain_groq import ChatGroq
from langchain_google_genai import ChatGoogleGenerativeAI
from pydantic_settings import BaseSettings
from typing import Optional, Dict, Any
import yaml
from pathlib import Path


class LLMProviderType(str, Enum):
    """Enumeration of supported LLM providers."""
    
    OPENAI = "openai"
    GROQ = "groq"
    GEMINI = "gemini"
    
    @classmethod
    def get_default_model(cls, provider: str) -> str:
        """Get default model for a provider."""
        defaults = {
            cls.OPENAI.value: "gpt-4.1-mini",
            cls.GROQ.value: "llama-3.3-70b-versatile",
            cls.GEMINI.value: "gemini-1.5-pro"
        }
        return defaults.get(provider, "gpt-4.1-mini")


class LLMFactory:
    """
    Factory for creating LangChain chat model instances.
    
    This factory abstracts away the differences between LLM providers,
    allowing the application to work with multiple providers seamlessly.
    """
    
    @staticmethod
    def create_openai_llm(**kwargs) -> ChatOpenAI:
        """
        Create an OpenAI ChatOpenAI instance.
        
        Args:
            openai_api_key: OpenAI API key
            openai_model: Model name (e.g., gpt-4o, gpt-4.1-mini)
            temperature: Sampling temperature
            max_tokens: Maximum tokens in response
            base_url: Optional custom API endpoint
        
        Returns:
            ChatOpenAI: Configured OpenAI chat model
        """
        return ChatOpenAI(
            api_key=kwargs.get("openai_api_key"),
            model=kwargs.get("openai_model"),
            temperature=kwargs.get("temperature", 0.1),
            max_tokens=kwargs.get("max_tokens", None),
            base_url=kwargs.get("openai_base_url", None)
        )
    
    @staticmethod
    def create_groq_llm(**kwargs) -> ChatGroq:
        """
        Create a Groq ChatGroq instance.
        
        Args:
            groq_api_key: Groq API key
            groq_model: Model name (e.g., llama-3.3-70b-versatile, llama3-70b-8192, mixtral-8x7b-32768)
            temperature: Sampling temperature
            max_tokens: Maximum tokens in response
        
        Returns:
            ChatGroq: Configured Groq chat model
        """
        return ChatGroq(
            api_key=kwargs.get("groq_api_key"),
            model=kwargs.get("groq_model"),
            temperature=kwargs.get("temperature", 0.1),
            max_tokens=kwargs.get("max_tokens", None)
        )
    
    @staticmethod
    def create_gemini_llm(**kwargs) -> ChatGoogleGenerativeAI:
        """
        Create a Gemini ChatGoogleGenerativeAI instance.
        
        Args:
            google_api_key: Google API key
            gemini_model: Model name (e.g., gemini-1.5-pro, gemini-1.5-flash)
            temperature: Sampling temperature
            max_tokens: Maximum tokens in response
        
        Returns:
            ChatGoogleGenerativeAI: Configured Gemini chat model
        """
        return ChatGoogleGenerativeAI(
            api_key=kwargs.get("google_api_key"),
            model=kwargs.get("gemini_model"),
            temperature=kwargs.get("temperature", 0.1),
            max_tokens=kwargs.get("max_tokens", None)
        )
    
    @staticmethod
    def create_llm(provider: str, **kwargs):
        """
        Create an LLM instance based on the specified provider.
        
        This is the main factory method that routes to the appropriate
        provider-specific creation method.
        
        Args:
            provider: Provider name (must be in LLMProviderType)
            **kwargs: Provider-specific configuration parameters
        
        Returns:
            BaseChatModel: Configured chat model instance
        
        Raises:
            ValueError: If provider is not supported
        """
        provider = provider.lower()
        
        if provider == LLMProviderType.OPENAI.value:
            return LLMFactory.create_openai_llm(**kwargs)
        elif provider == LLMProviderType.GROQ.value:
            return LLMFactory.create_groq_llm(**kwargs)
        elif provider == LLMProviderType.GEMINI.value:
            return LLMFactory.create_gemini_llm(**kwargs)
        else:
            supported = [p.value for p in LLMProviderType]
            raise ValueError(
                f"Unsupported LLM provider: '{provider}'. "
                f"Supported providers: {', '.join(supported)}"
            )


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    
    # LLM Provider Selection
    llm_provider: str = LLMProviderType.OPENAI.value
    
    # OpenAI Configuration
    openai_api_key: str
    openai_model: str = LLMProviderType.get_default_model(LLMProviderType.OPENAI.value)
    openai_base_url: Optional[str] = None
    
    # Groq Configuration
    groq_api_key: str = ""
    groq_model: str = LLMProviderType.get_default_model(LLMProviderType.GROQ.value)
    
    # Gemini Configuration
    google_api_key: str = ""
    gemini_model: str = LLMProviderType.get_default_model(LLMProviderType.GEMINI.value)
    
    # Common LLM Parameters (shared across all providers)
    temperature: float = 0.1
    max_tokens: Optional[int] = None  # 2000
    
    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
        extra = "ignore"


class LLMConfig:
    """LLM configuration and initialization."""
    
    def __init__(self, settings: Settings):
        self.settings = settings
        self._llm = None
    
    @property
    def llm(self):
        """
        Get or create LLM instance using the configured provider.
        
        The LLM is created on first access and cached for subsequent calls.
        
        Returns:
            BaseChatModel: The initialized LLM instance
        """
        if self._llm is None:
            # Create LLM using factory based on configured provider
            self._llm = LLMFactory.create_llm(
                provider=self.settings.llm_provider,
                openai_api_key=self.settings.openai_api_key,
                openai_model=self.settings.openai_model,
                openai_base_url=self.settings.openai_base_url,
                groq_api_key=self.settings.groq_api_key,
                groq_model=self.settings.groq_model,
                google_api_key=self.settings.google_api_key,
                gemini_model=self.settings.gemini_model,
                temperature=self.settings.temperature,
                max_tokens=self.settings.max_tokens
            )
        return self._llm
    
    def reset_llm(self):
        """
        Reset the LLM instance (useful for testing or switching providers).
        
        This clears the cached LLM instance, forcing a new instance
        to be created on the next access.
        """
        self._llm = None


# Global instances
_settings: Optional[Settings] = None
_llm_config: Optional[LLMConfig] = None
llm = None
_project_config: Optional[Dict[str, Any]] = None


def initialize_llm(settings: Optional[Settings] = None):
    """
    Initialize the global LLM instance.
    
    Args:
        settings: Optional Settings instance. If not provided, will load from environment.
    
    Returns:
        BaseChatModel: The initialized LLM instance
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
        Dict: Project configuration dictionary
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
                "provider": "openai",
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
    """
    Get the global settings instance.
    
    Returns:
        Settings: The global settings object
    """
    global _settings
    if _settings is None:
        _settings = Settings()
    return _settings


def get_llm_config() -> Optional[LLMConfig]:
    """
    Get the global LLM config instance.
    
    Returns:
        LLMConfig: The global LLM configuration object
    """
    return _llm_config


def get_project_config() -> Optional[Dict[str, Any]]:
    """
    Get the global project config instance.
    
    Returns:
        Dict: The global project configuration dictionary
    """
    return _project_config


def reset_global_state():
    """
    Reset all global state (useful for testing or switching providers).
    
    This clears all cached configuration and LLM instances.
    """
    global _settings, _llm_config, llm, _project_config
    _settings = None
    _llm_config = None
    llm = None
    _project_config = None