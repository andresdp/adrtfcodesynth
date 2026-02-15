from typing import Dict, Any
from pathlib import Path
import uuid

from langgraph.graph import StateGraph, END
from langgraph.checkpoint.memory import MemorySaver
from langchain_core.runnables import RunnableConfig


from state import ADRWorkflowState
from config import initialize_llm, load_project_config, get_project_config
from nodes.context_generator_node import context_generator_node
from nodes.terraform_analyzer_node import terraform_analyzer_minor_node, terraform_analyzer_major_node
from nodes.source_code_analyzer_node import source_code_analyzer_minor_node, source_code_analyzer_major_node
from nodes.architecture_diff_node import architecture_diff_node
from nodes.adr_generator_node import adr_generator_node

import logging

logger = logging.getLogger(__name__)


def create_workflow(project_dir: str = None, include_terraform=True) -> StateGraph:
    """
    Create and compile a LangGraph workflow.
    
    Args:
        project_dir: Optional path to the project directory. If not provided,
                   will look for project-config.yaml in current directory.
    
    Returns:
        StateGraph: The compiled workflow.
    """
    # Load project configuration if project_dir is provided
    project_config = None
    if project_dir:
        project_config = load_project_config(project_dir)
    else:
        # Look for project-config.yaml in current directory
        current_dir = Path.cwd()
        config_file = current_dir / "project-config.yaml"
        if config_file.exists():
            project_config = load_project_config(str(current_dir))
    
    # Initialize LLM
    llm = initialize_llm()
    
    # Create workflow graph
    workflow = StateGraph(ADRWorkflowState)

    logger.info(f"Creating workflow terraform={include_terraform}")
    
    # Add nodes
    workflow.add_node("context_generator", context_generator_node)
    if include_terraform:
        workflow.add_node("terraform_analyzer_minor", terraform_analyzer_minor_node)
        workflow.add_node("terraform_analyzer_major", terraform_analyzer_major_node)
    workflow.add_node("source_code_analyzer_minor", source_code_analyzer_minor_node)
    workflow.add_node("source_code_analyzer_major", source_code_analyzer_major_node)
    workflow.add_node("architecture_diff", architecture_diff_node)
    workflow.add_node("adr_generator", adr_generator_node)
    
    # Define edges (workflow)
    workflow.set_entry_point("context_generator")
    
    if include_terraform:
        # After context, run both Terraform analyzers in parallel
        workflow.add_edge("context_generator", "terraform_analyzer_minor")
        workflow.add_edge("context_generator", "terraform_analyzer_major")
    
        # After Terraform analysis, validate with source code (parallel)
        workflow.add_edge("terraform_analyzer_minor", "source_code_analyzer_minor")
        workflow.add_edge("terraform_analyzer_major", "source_code_analyzer_major")
        
    else: # No terraform configured
        # After context, run both source code analyzers in parallel
        workflow.add_edge("context_generator", "source_code_analyzer_minor")
        workflow.add_edge("context_generator", "source_code_analyzer_major")
    
    # After validation, compare results (sequential - wait for both to complete)
    workflow.add_edge("source_code_analyzer_minor", "architecture_diff")
    workflow.add_edge("source_code_analyzer_major", "architecture_diff")
    
    # Generate ADRs from comparison
    workflow.add_edge("architecture_diff", "adr_generator")
    
    # End workflow
    workflow.add_edge("adr_generator", END)
    
    # Compile with checkpoint support
    app = workflow.compile(checkpointer=MemorySaver())
    
    return app


async def run_workflow(project_dir: str, initial_state: Dict[str, Any] = None, workflow = None, thread_id: str=None) -> Dict[str, Any]:
    """
    Run the workflow for a specific project.
    
    Args:
        project_dir: Path to the project directory (e.g., project-inputs/chef)
        initial_state: Optional initial state dictionary. If not provided, will load from project config.
    
    Returns:
        Dict: The final workflow state.
    """
    # Load project configuration
    project_config = load_project_config(project_dir)
    
    # Build initial state from project config
    if initial_state is None:
        initial_state = {
            "project_name": project_config.get("project_name", "default"),
            "terraform_minor": project_config.get("terraform_minor", ""),
            "terraform_major": project_config.get("terraform_major", ""),
            "source_code_zip": project_config.get("source_code_zip", ""),
            "knowledge_base": project_config.get("knowledge_base", "knowledge/IAC.txt")
        }
    
    # Create and run workflow
    if workflow is None:
        workflow = create_workflow(project_dir)
    
    # Run workflow
    thread_id = str(uuid.uuid4()) if thread_id is None else thread_id
    config: RunnableConfig = {"configurable": {"thread_id": "1"}}
    result = await workflow.ainvoke(initial_state, config=config)
    
    return result
