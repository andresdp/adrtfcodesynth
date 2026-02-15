"""
Agents package for the ADR Code Synth application.

This package contains the LLM-powered agents that perform various analysis
tasks in the workflow. Each agent is specialized for a specific task:

- ContextGenerator: Extracts project structure and source code from ZIP archives
- TerraformAnalyzer: Analyzes Terraform files for microservices patterns
- SourceCodeAnalyzer: Validates and improves architecture analysis using source code
- ArchitectureDiff: Compares two architecture analyses
- ADRGenerator: Generates Architecture Decision Records (ADRs)

These agents use LangChain for LLM interaction and are designed to work
within the LangGraph workflow system.

Usage:
    from agents.context_generator import ContextGenerator
    from agents.terraform_analyzer import TerraformAnalyzer
    from agents.source_code_analyzer import SourceCodeAnalyzer
    from agents.architecture_diff import ArchitectureDiff
    from agents.adr_generator import ADRGenerator
"""

from .context_generator import ContextGenerator
from .terraform_analyzer import TerraformAnalyzer
from .source_code_analyzer import SourceCodeAnalyzer
from .architecture_diff import ArchitectureDiff
from .adr_generator import ADRGenerator, ADR, ADRList

__all__ = [
    "ContextGenerator",
    "TerraformAnalyzer", 
    "SourceCodeAnalyzer",
    "ArchitectureDiff",
    "ADRGenerator",
    "ADR",
    "ADRList",
]
