from state import ADRWorkflowState
from agents.source_code_analyzer import SourceCodeAnalyzer
from config import get_llm_config

import logging

logger = logging.getLogger(__name__)


async def source_code_analyzer_minor_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    """LangGraph node: Analyze project structure and validate analysis against source code (minor version)."""

    logger.info(f"STEP: source_code_analyzer_minor_node")

    llm = llm or get_llm_config().llm

    analyzer = SourceCodeAnalyzer(llm=llm)

    # Use extracted project structure and source code from state (extracted by ContextGenerator)
    project_structure = state.get("project_structure", "")
    source_code = state.get("source_code", "")
    extraction_metadata = state.get("extraction_metadata", {})

    # Determine which version to analyze
    previous_analysis = state.get("terraform_analysis_minor", "")
    version = "minor"

    result = await analyzer.analyze(
        context=state["architectural_context"],
        previous_analysis=previous_analysis,
        source_code=source_code,
        version=version,
        project_structure=project_structure,
        # extraction_metadata=extraction_metadata
    )

    state["improved_analysis_minor"] = result["analysis"]
    return state


async def source_code_analyzer_major_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    """LangGraph node: Analyze project structure and validate analysis against source code (major version)."""

    logger.info(f"STEP: source_code_analyzer_major_node")

    llm = llm or get_llm_config().llm

    analyzer = SourceCodeAnalyzer(llm=llm)

    # Use extracted project structure and source code from state (extracted by ContextGenerator)
    project_structure = state.get("project_structure", "")
    source_code = state.get("source_code", "")
    extraction_metadata = state.get("extraction_metadata", {})

    # Determine which version to analyze
    previous_analysis = state.get("terraform_analysis_major", "")
    version = "major"

    result = await analyzer.analyze(
        context=state["architectural_context"],
        previous_analysis=previous_analysis,
        source_code=source_code,
        version=version,
        project_structure=project_structure,
        # extraction_metadata=extraction_metadata
    )

    state["improved_analysis_major"] = result["analysis"]
    return state
