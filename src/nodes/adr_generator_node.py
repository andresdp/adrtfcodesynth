from src.state import ADRWorkflowState
from src.agents.adr_generator import ADRGenerator
from src.config import llm

async def adr_generator_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Generate ADRs from architecture comparison."""

    generator = ADRGenerator(llm=llm)

    result = await generator.generate(
        comparison=state["architecture_diff"],
        context=state["architectural_context"],
        project_name=state["project_name"]
    )

    state["adr_files"] = result["adr_files"]
    state["json_collection"] = result["json_collection"]

    return state
