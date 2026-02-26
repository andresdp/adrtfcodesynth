"""
Context Generator Agent for theoretical context generation.

This agent is responsible for generating theoretical architectural context
about software architecture, monolithic architecture, and microservices architecture.

Note: Source code extraction has been moved to SourceCodeExtractor agent.

Usage:
    from agents.context_generator import ContextGenerator
    
    generator = ContextGenerator(llm=chat_openai)
    # This agent now only handles theoretical context generation
"""

import logging

logger = logging.getLogger(__name__)


class ContextGenerator:
    """Agent for generating theoretical architectural context."""

    def __init__(self, llm=None):
        """Initialize the ContextGenerator agent.

        Args:
            llm: ChatOpenAI instance (currently not used, kept for compatibility)
        """
        self.llm = llm
        logger.info("ContextGenerator initialized (theoretical context only - source code extraction moved to SourceCodeExtractor)")