from typing import Dict, Any
from pathlib import Path
import uuid
from datetime import datetime

from IPython.display import Image

from langgraph.graph import StateGraph, END
from langgraph.checkpoint.memory import MemorySaver
from langchain_core.runnables import RunnableConfig
from langchain_openai import ChatOpenAI

from state import ADRWorkflowState
from config import initialize_llm, load_project_config, get_project_config
from nodes.context_generator_node import context_generator_node
from nodes.terraform_analyzer_node import terraform_analyzer_minor_node, terraform_analyzer_major_node
from nodes.source_code_analyzer_node import source_code_analyzer_minor_node, source_code_analyzer_major_node
from nodes.architecture_diff_node import architecture_diff_node
from nodes.adr_generator_node import adr_generator_node

import logging

logger = logging.getLogger(__name__)


class ADRWorkflow:

    def __init__(self, project_dir: str=None, llm: ChatOpenAI = None):
        
        self.project_dir = project_dir
        self.project_config = None
        self.llm = llm
        self.include_terraform = True
        self.include_knowledge = True
        self.reuse_context = True

        self.workflow = None
        self.thread_id = None
        self.initial_state = None 
        
        self.initialize_project(project_dir)
    
    def initialize_project(self, project_dir: str):
        
        self.project_dir = project_dir
        # Load project configuration
        self.project_config = load_project_config(self.project_dir)

        # Load project configuration if project_dir is provided
        if self.project_dir:
            self.project_config = load_project_config(self.project_dir)
        else:
            # Look for project-config.yaml in current directory
            current_dir = Path.cwd()
            config_file = current_dir / "project-config.yaml"
            if config_file.exists():
                self.project_config = load_project_config(str(current_dir))
        # Initialize LLM
        if self.llm is None:
            self.llm = initialize_llm()
            logger.info("\nLLM initialized:")
            logger.info(f"  Model: {self.llm.model_name}")
            logger.info(f"  Temperature: {self.llm.temperature}")

    def create(self, include_terraform: bool=True, reuse_context: bool=True, include_knowledge: bool=True) -> ADRWorkflowState:
        
        self.include_terraform = include_terraform
        self.reuse_context = reuse_context
        self.include_knowledge = include_knowledge

        logger.info("\nProject configuration loaded:")
        logger.info(f"  Project Name: {self.project_config['project_name']}")
        logger.info(f"  Terraform Minor: {self.project_config['terraform_minor']}")
        logger.info(f"  Terraform Major: {self.project_config['terraform_major']}")
        logger.info(f"  Source Code ZIP: {self.project_config['source_code_zip']}")
        logger.info(f"  Knowledge Base: {self.project_config['knowledge_base']}")
        logger.info(f"  LLM Model: {self.project_config['llm']['model']}")
        
        # Build initial state from project config
        base_dir = self.project_dir if self.project_dir.endswith("/") else self.project_dir + "/"
        self.initial_state = {
            "project_name": self.project_config.get("project_name", "default"),
            "terraform_minor": base_dir + self.project_config.get("terraform_minor", ""),
            "terraform_major": base_dir + self.project_config.get("terraform_major", ""),
            "source_code_zip": base_dir + self.project_config.get("source_code_zip", ""),
            "knowledge_base": self.project_config.get("knowledge_base", "knowledge/IAC.txt"),
            "timestamp": datetime.now().isoformat()
        }

        logger.info(f"Initial state: {self.initial_state}")

        self.workflow = ADRWorkflow.create_workflow(self, self.include_terraform)

        return self.initial_state
    
    def get_graph(self) -> Image:
        return Image(self.workflow.get_graph().draw_mermaid_png())

    async def run(self, initial_state: Dict[str, Any] = None, thread_id: str=None) -> Dict[str, Any]: 
        
        thread_id = str(uuid.uuid4()) if thread_id is None else thread_id
        self.thread_id = thread_id

        if initial_state is None:
            initial_state = self.initial_state
        
        return await ADRWorkflow.run_workflow(self.project_dir, initial_state, self.workflow, self.thread_id)   
    
    # Delegate to the corresponding function nodes (which, in turn, rely on the agents)

    async def _create_context(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await context_generator_node(state, llm=self.llm, reuse_context=self.reuse_context, include_knowledge=self.include_knowledge)

    async def _analyze_terraform_minor(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await terraform_analyzer_minor_node(state, llm=self.llm, include_knowledge=self.include_knowledge)
    
    async def _analyze_terraform_major(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await terraform_analyzer_major_node(state, llm=self.llm, include_knowledge=self.include_knowledge)
    
    async def _analyze_source_code_minor(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await source_code_analyzer_minor_node(state, llm=self.llm)
    
    async def _analyze_source_code_major(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await source_code_analyzer_major_node(state, llm=self.llm)
    
    async def _do_architecture_diff(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await architecture_diff_node(state, llm=self.llm)
    
    async def _generate_adrs(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        return await adr_generator_node(state, llm=self.llm)


    @staticmethod
    def create_workflow(workflow: 'ADRWorkflow', include_terraform=True, checkpointer = None) -> StateGraph:
        """
        Create and compile a LangGraph workflow.
        
        Args:
            project_dir: Optional path to the project directory. If not provided,
                    will look for project-config.yaml in current directory.
        
        Returns:
            StateGraph: The compiled workflow.
        """
        
        # Create workflow graph
        graph = StateGraph(ADRWorkflowState)

        logger.info(f"Creating workflow terraform={include_terraform}")
        
        # Add nodes
        graph.add_node("create_context", workflow._create_context)
        if include_terraform:
            graph.add_node("analyze_terraform_minor", workflow._analyze_terraform_minor)
            graph.add_node("analyze_terraform_major", workflow._analyze_terraform_major)
        graph.add_node("analyze_source_code_minor", workflow._analyze_source_code_minor)
        graph.add_node("analyze_source_code_major", workflow._analyze_source_code_major)
        graph.add_node("do_architecture_diff", workflow._do_architecture_diff)
        graph.add_node("generate_adrs", workflow._generate_adrs)
        
        # Define edges (workflow)
        graph.set_entry_point("create_context")
        
        if include_terraform:
            # After context, run both Terraform analyzers in parallel
            graph.add_edge("create_context", "analyze_terraform_minor")
            graph.add_edge("create_context", "analyze_terraform_major")
        
            # After Terraform analysis, validate with source code (parallel)
            graph.add_edge("analyze_terraform_minor", "analyze_source_code_minor")
            graph.add_edge("analyze_terraform_major", "analyze_source_code_major")
            
        else: # No terraform configured
            # After context, run both source code analyzers in parallel
            graph.add_edge("create_context", "analyze_source_code_minor")
            graph.add_edge("create_context", "analyze_source_code_major")
        
        # After validation, compare results (sequential - wait for both to complete)
        graph.add_edge("analyze_source_code_minor", "do_architecture_diff")
        graph.add_edge("analyze_source_code_major", "do_architecture_diff")
        
        # Generate ADRs from comparison
        graph.add_edge("do_architecture_diff", "generate_adrs")
        
        # End workflow
        graph.add_edge("generate_adrs", END)

        if checkpointer is None:
            checkpointer = MemorySaver()
        
        # Compile with checkpoint support
        app = graph.compile(checkpointer=checkpointer)
    
        return app


    @staticmethod
    async def run_workflow(project_dir: str, initial_state: Dict[str, Any] = None, graph = None, thread_id: str=None) -> Dict[str, Any]:
        """
        Run the workflow for a specific project.
        
        Args:
            project_dir: Path to the project directory (e.g., project-inputs/chef)
            initial_state: Optional initial state dictionary. If not provided, will load from project config.
        
        Returns:
            Dict: The final workflow state.
        """

        logger.info(f"RUNNING workflow for project: {project_dir} - {thread_id}")
        
        # Run workflow
        config: RunnableConfig = {"configurable": {"thread_id": thread_id}}
        result = await graph.ainvoke(initial_state, config=config)
        
        return result


