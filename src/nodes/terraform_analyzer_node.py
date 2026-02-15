from state import ADRWorkflowState
from agents.terraform_analyzer import TerraformAnalyzer
from config import get_llm_config

import logging

logger = logging.getLogger(__name__)



def load_file(file_path: str) -> str:
    """
    Utility method to load a file from the given path.
    
    Args:
        file_path: Path to the file to load
        
    Returns:
        The contents of the file as a string. Returns empty string if file cannot be loaded.
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        logger.warning(f"File not found: {file_path}")
        return ""
    except IOError as e:
        logger.warning(f"Error reading file {file_path}: {e}")
        return ""
    except Exception as e:
        logger.warning(f"Unexpected error loading file {file_path}: {e}")
        return ""

async def terraform_analyzer_minor_node(state: ADRWorkflowState, llm = None, include_knowledge = True) -> ADRWorkflowState:
    """LangGraph node: Analyze Terraform file for microservices patterns (minor version)."""

    logger.info(f"STEP: terraform_analyzer_minor_node")

    llm = llm or get_llm_config().llm

    knowledge_base_content = ""
    if include_knowledge:
        knowledge_base_content = load_file(state["knowledge_base"])
        state["knowledge_base"] = ""
    
    terraform_minor_content = load_file(state["terraform_minor"])

    analyzer = TerraformAnalyzer(
        llm=llm,
        knowledge_base=knowledge_base_content
    )

    result = await analyzer.analyze(
        terraform_code=terraform_minor_content,
        context=state["architectural_context"],
        project_structure=state.get("project_structure", "")
    )

    state["terraform_analysis_minor"] = result.model_dump() # result["analysis"]
    return state


async def terraform_analyzer_major_node(state: ADRWorkflowState, llm = None, include_knowledge = True) -> ADRWorkflowState:
    """LangGraph node: Analyze Terraform file for microservices patterns (major version)."""
    
    logger.info(f"STEP: terraform_analyzer_major_node")

    llm = llm or get_llm_config().llm
    
    knowledge_base_content = ""
    if include_knowledge:
        knowledge_base_content = load_file(state["knowledge_base"])
        state["knowledge_base"] = ""
        
    terraform_major_content = load_file(state["terraform_major"])

    analyzer = TerraformAnalyzer(
        llm=llm,
        knowledge_base=knowledge_base_content
    )

    result = await analyzer.analyze(
        terraform_code=terraform_major_content,
        context=state["architectural_context"],
        project_structure=state.get("project_structure", "")
    )

    state["terraform_analysis_major"] = result.model_dump() # result["analysis"]
    return state
