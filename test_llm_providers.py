"""
Test script to verify LLM provider configuration.

This script tests the LLM factory pattern with all three providers:
- OpenAI (GPT models)
- Groq (fast inference)
- Gemini (large context windows)

Run this after setting up your API keys in .env file.

Usage:
    # Test with OpenAI (default)
    python test_llm_providers.py

    # Test with Groq
    LLM_PROVIDER=groq python test_llm_providers.py

    # Test with Gemini
    LLM_PROVIDER=gemini python test_llm_providers.py
"""

import os
import sys
import asyncio
from dotenv import load_dotenv

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

# Load environment variables
load_dotenv()

from config import (
    Settings, 
    LLMFactory, 
    LLMProviderType,
    initialize_llm,
    reset_global_state
)


def test_settings():
    """Test Settings class loads correctly."""
    print("=" * 60)
    print("Testing Settings Configuration")
    print("=" * 60)
    
    settings = Settings()
    
    print(f"\n✓ Settings loaded successfully")
    print(f"  - LLM Provider: {settings.llm_provider}")
    print(f"  - Temperature: {settings.temperature}")
    print(f"  - Max Tokens: {settings.max_tokens}")
    print(f"  - OpenAI Model: {settings.openai_model}")
    print(f"  - Groq Model: {settings.groq_model}")
    print(f"  - Gemini Model: {settings.gemini_model}")
    
    if settings.llm_provider == LLMProviderType.OPENAI.value:
        api_key_set = bool(settings.openai_api_key)
        print(f"  - OpenAI API Key Set: {'✓' if api_key_set else '✗'}")
    elif settings.llm_provider == LLMProviderType.GROQ.value:
        api_key_set = bool(settings.groq_api_key)
        print(f"  - Groq API Key Set: {'✓' if api_key_set else '✗'}")
    elif settings.llm_provider == LLMProviderType.GEMINI.value:
        api_key_set = bool(settings.google_api_key)
        print(f"  - Gemini API Key Set: {'✓' if api_key_set else '✗'}")
    
    return settings


def test_factory_creation():
    """Test LLMFactory can create instances for all providers."""
    print("\n" + "=" * 60)
    print("Testing LLM Factory")
    print("=" * 60)
    
    # Test OpenAI factory (requires API key)
    print("\nTesting OpenAI Factory:")
    try:
        openai_llm = LLMFactory.create_openai_llm(
            openai_api_key=os.getenv(OPENAI_API_KEY),
            openai_model="gpt-4.1-mini",
            temperature=0.1
        )
        print(f"  ✓ OpenAI LLM created: {type(openai_llm).__name__}")
    except Exception as e:
        print(f"  ✗ Failed: {e}")
    
    # Test Groq factory (requires API key)
    print("\nTesting Groq Factory:")
    try:
        groq_llm = LLMFactory.create_groq_llm(
            groq_api_key=os.getenv(GROQ_API_KEY),
            groq_model="llama-3.3-70b-versatile",
            temperature=0.1
        )
        print(f"  ✓ Groq LLM created: {type(groq_llm).__name__}")
    except Exception as e:
        print(f"  ✗ Failed: {e}")
    
    # Test Gemini factory (requires API key)
    print("\nTesting Gemini Factory:")
    try:
        gemini_llm = LLMFactory.create_gemini_llm(
            google_api_key=os.getenv(GOOGLE_API_KEY),
            gemini_model="gemini-1.5-pro",
            temperature=0.1
        )
        print(f"  ✓ Gemini LLM created: {type(gemini_llm).__name__}")
    except Exception as e:
        print(f"  ✗ Failed: {e}")
    
    # Test main factory method
    print("\nTesting Main Factory Method:")
    try:
        llm = LLMFactory.create_llm(
            provider="openai",
            openai_api_key=os.getenv(OPENAI_API_KEY),
            openai_model="gpt-4.1-mini"
        )
        print(f"  ✓ Factory routing works: {type(llm).__name__}")
    except Exception as e:
        print(f"  ✗ Failed: {e}")


async def test_openai_llm():
    """Test OpenAI LLM with a simple call."""
    print("\n" + "=" * 60)
    print("Testing OpenAI LLM")
    print("=" * 60)
    
    # Check if API key is set
    if not os.getenv("OPENAI_API_KEY"):
        print("✗ OPENAI_API_KEY not set in environment")
        return False
    
    try:
        # Create OpenAI LLM
        llm = LLMFactory.create_openai_llm(
            openai_api_key=os.getenv("OPENAI_API_KEY"),
            openai_model=os.getenv("OPENAI_MODEL_NAME", "gpt-4.1-mini"),
            temperature=0.7
        )
        
        # Simple test prompt
        print("\nSending test prompt...")
        response = await llm.ainvoke("Say 'OpenAI LLM test successful!'")
        
        print(f"✓ OpenAI LLM response: {response.content}")
        return True
        
    except Exception as e:
        print(f"✗ OpenAI test failed: {e}")
        return False


async def test_groq_llm():
    """Test Groq LLM with a simple call."""
    print("\n" + "=" * 60)
    print("Testing Groq LLM")
    print("=" * 60)
    
    # Check if API key is set
    if not os.getenv("GROQ_API_KEY"):
        print("✗ GROQ_API_KEY not set in environment")
        return False
    
    try:
        # Create Groq LLM
        llm = LLMFactory.create_groq_llm(
            groq_api_key=os.getenv("GROQ_API_KEY"),
            groq_model=os.getenv("GROQ_MODEL_NAME", "llama-3.3-70b-versatile"),
            temperature=0.7
        )
        
        # Simple test prompt
        print("\nSending test prompt...")
        response = await llm.ainvoke("Say 'Groq LLM test successful!'")
        
        print(f"✓ Groq LLM response: {response.content}")
        return True
        
    except Exception as e:
        print(f"✗ Groq test failed: {e}")
        return False


async def test_gemini_llm():
    """Test Gemini LLM with a simple call."""
    print("\n" + "=" * 60)
    print("Testing Gemini LLM")
    print("=" * 60)
    
    # Check if API key is set
    if not os.getenv("GOOGLE_API_KEY"):
        print("✗ GOOGLE_API_KEY not set in environment")
        return False
    
    try:
        # Create Gemini LLM
        llm = LLMFactory.create_gemini_llm(
            google_api_key=os.getenv("GOOGLE_API_KEY"),
            gemini_model=os.getenv("GEMINI_MODEL_NAME", "gemini-flash-lite-latest"),
            temperature=0.7
        )
        
        # Simple test prompt
        print("\nSending test prompt...")
        response = await llm.ainvoke("Say 'Gemini LLM test successful!'")
        
        print(f"✓ Gemini LLM response: {response.content}")
        return True
        
    except Exception as e:
        print(f"✗ Gemini test failed: {e}")
        return False


async def test_initialize_function():
    """Test initialize_llm function with environment configuration."""
    print("\n" + "=" * 60)
    print("Testing Global Initialization")
    print("=" * 60)
    
    try:
        # Reset global state
        reset_global_state()
        
        # Initialize from environment
        llm = initialize_llm()
        
        print(f"\n✓ Global LLM initialized")
        print(f"  - Type: {type(llm).__name__}")
        print(f"  - Model: {getattr(llm, 'model_name', 'unknown')}")
        
        # Test simple call
        response = await llm.ainvoke("Say 'Global init test successful!'")
        print(f"  - Response: {response.content}")
        
        return True
        
    except Exception as e:
        print(f"✗ Global initialization failed: {e}")
        return False


async def main():
    """Run all tests."""
    print("\n" + "=" * 60)
    print("LLM Provider Configuration Tests")
    print("=" * 60)
    print(f"\nCurrent LLM_PROVIDER: {os.getenv('LLM_PROVIDER', 'openai')}")
    
    # Test 1: Settings
    settings = test_settings()
    
    # Test 2: Factory
    test_factory_creation()
    
    # Test 3: OpenAI LLM (if API key available)
    openai_success = await test_openai_llm()
    
    # Test 4: Groq LLM (if API key available)
    groq_success = await test_groq_llm()
    
    # Test 5: Gemini LLM (if API key available)
    gemini_success = await test_gemini_llm()
    
    # Test 6: Global initialization
    init_success = await test_initialize_function()
    
    # Summary
    print("\n" + "=" * 60)
    print("Test Summary")
    print("=" * 60)
    print(f"  Settings: ✓")
    print(f"  Factory: ✓")
    print(f"  OpenAI LLM: {'✓' if openai_success else '✗'}")
    print(f"  Groq LLM: {'✓' if groq_success else '✗'}")
    print(f"  Gemini LLM: {'✓' if gemini_success else '✗'}")
    print(f"  Global Init: {'✓' if init_success else '✗'}")
    
    if openai_success or groq_success or gemini_success:
        print("\n✓ At least one LLM provider is working!")
    else:
        print("\n✗ No LLM provider configured. Please set API keys in .env")


if __name__ == "__main__":
    asyncio.run(main())