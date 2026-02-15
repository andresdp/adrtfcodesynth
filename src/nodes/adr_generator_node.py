from state import ADRWorkflowState
from agents.adr_generator import ADRGenerator
from config import get_llm_config

import logging

logger = logging.getLogger(__name__)


async def adr_generator_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    """LangGraph node: Generate ADRs from architecture comparison."""
    
    logger.info(f"STEP: adr_generator_node")

    llm = llm or get_llm_config().llm 

    generator = ADRGenerator(llm=llm)

    result = await generator.generate(
        comparison=state["architecture_diff"],
        context=state["architectural_context"],
        project_name=state["project_name"]
    )

    state["adr_files"] = result
    # state["json_collection"] = result["json_collection"]

    return state
