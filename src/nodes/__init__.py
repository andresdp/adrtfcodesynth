"""
Nodes package for the ADR Code Synth application.

This package contains LangGraph node functions that define the workflow steps.
Each node wraps an agent and integrates it into the LangGraph workflow.

Nodes:
- context_generator_node: Generates architectural context and extracts project structure
- terraform_analyzer_minor_node: Analyzes minor Terraform version
- terraform_analyzer_major_node: Analyzes major Terraform version
- source_code_analyzer_minor_node: Validates minor version analysis with source code
- source_code_analyzer_major_node: Validates major version analysis with source code
- architecture_diff_node: Compares architecture analyses
- adr_generator_node: Generates ADRs from the comparison

Usage:
    from nodes.context_generator_node import context_generator_node
    from nodes.terraform_analyzer_node import terraform_analyzer_minor_node
    # etc.
"""

from .context_generator_node import context_generator_node
from .terraform_analyzer_node import terraform_analyzer_minor_node, terraform_analyzer_major_node
from .source_code_analyzer_node import source_code_analyzer_minor_node, source_code_analyzer_major_node
from .architecture_diff_node import architecture_diff_node
from .adr_generator_node import adr_generator_node

__all__ = [
    "context_generator_node",
    "terraform_analyzer_minor_node",
    "terraform_analyzer_major_node",
    "source_code_analyzer_minor_node",
    "source_code_analyzer_major_node",
    "architecture_diff_node",
    "adr_generator_node",
]
