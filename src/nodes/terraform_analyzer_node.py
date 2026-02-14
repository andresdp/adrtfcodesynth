from src.state import ADRWorkflowState
from src.agents.terraform_analyzer import TerraformAnalyzer
from src.config import llm

async def terraform_analyzer_minor_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Analyze Terraform file for microservices patterns (minor version)."""

    analyzer = TerraformAnalyzer(
        llm=llm,
        knowledge_base=state["knowledge_base"]
    )

    result = await analyzer.analyze(
        terraform_code=state["terraform_minor"],
        context=state["architectural_context"],
        project_structure=state.get("project_structure", "")
    )

    state["terraform_analysis_minor"] = result["analysis"]
    return state


async def terraform_analyzer_major_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Analyze Terraform file for microservices patterns (major version)."""

    analyzer = TerraformAnalyzer(
        llm=llm,
        knowledge_base=state["knowledge_base"]
    )

    result = await analyzer.analyze(
        terraform_code=state["terraform_major"],
        context=state["architectural_context"],
        project_structure=state.get("project_structure", "")
    )

    state["terraform_analysis_major"] = result["analysis"]
    return state
