from src.state import ADRWorkflowState
from src.agents.source_code_analyzer import SourceCodeAnalyzer
from src.config import llm

async def source_code_analyzer_minor_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Analyze project structure and validate analysis against source code (minor version)."""

    analyzer = SourceCodeAnalyzer(llm=llm)

    # Use extracted project structure and source code from state (extracted by ContextGenerator)
    project_structure = state.get("project_structure", "")
    source_code = state.get("source_code", "")
    extraction_metadata = state.get("extraction_metadata", {})

    # Determine which version to analyze
    previous_analysis = state["terraform_analysis_minor"]
    version = "minor"

    result = await analyzer.analyze(
        context=state["architectural_context"],
        previous_analysis=previous_analysis,
        source_code=source_code,
        version=version,
        project_structure=project_structure,
        extraction_metadata=extraction_metadata
    )

    state["improved_analysis_minor"] = result["analysis"]
    return state


async def source_code_analyzer_major_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Analyze project structure and validate analysis against source code (major version)."""

    analyzer = SourceCodeAnalyzer(llm=llm)

    # Use extracted project structure and source code from state (extracted by ContextGenerator)
    project_structure = state.get("project_structure", "")
    source_code = state.get("source_code", "")
    extraction_metadata = state.get("extraction_metadata", {})

    # Determine which version to analyze
    previous_analysis = state["terraform_analysis_major"]
    version = "major"

    result = await analyzer.analyze(
        context=state["architectural_context"],
        previous_analysis=previous_analysis,
        source_code=source_code,
        version=version,
        project_structure=project_structure,
        extraction_metadata=extraction_metadata
    )

    state["improved_analysis_major"] = result["analysis"]
    return state
