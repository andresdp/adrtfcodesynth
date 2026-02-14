from src.state import ADRWorkflowState
from src.agents.architecture_diff import ArchitectureDiff
from src.config import llm

async def architecture_diff_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Compare two architecture analyses."""

    diff_agent = ArchitectureDiff(llm=llm)

    result = await diff_agent.compare(
        hybrid_analysis=state["improved_analysis_minor"],
        microservices_analysis=state["improved_analysis_major"],
        context=state["architectural_context"]
    )

    state["architecture_diff"] = result["comparison"]
    return state
