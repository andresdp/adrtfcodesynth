"""
Architecture Diff Node for the ADR workflow.

This node compares the improved analyses from the minor and major versions
to identify key architectural decisions in the migration path.

The node:
1. Takes both improved analyses from the workflow state
2. Uses the ArchitectureDiff agent to compare them
3. Identifies key architectural decisions and their impacts

State Updates:
- architecture_diff: Comparison text highlighting key decisions

Usage:
    This node runs after both source_code_analyzer nodes complete.
"""

from state import ADRWorkflowState
from agents.architecture_diff import ArchitectureDiff
from config import get_llm_config

import logging

logger = logging.getLogger(__name__)


async def architecture_diff_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    """LangGraph node: Compare two architecture analyses."""

    logger.info(f"STEP: architecture_diff_node")

    llm = llm or get_llm_config().llm

    diff_agent = ArchitectureDiff(llm=llm)

    result = await diff_agent.compare(
        hybrid_analysis=state["improved_analysis_minor"],
        microservices_analysis=state["improved_analysis_major"],
        context=state["architectural_context"]
    )

    state["architecture_diff"] = result["comparison"]
    return state
