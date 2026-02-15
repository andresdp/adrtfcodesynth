"""
Workflow module for the ADR Code Synth application.

This module defines the ADRWorkflow class which orchestrates the entire
ADR generation workflow using LangGraph. It manages:

1. Project initialization: Loads project configuration and initializes LLM
2. Workflow creation: Builds the LangGraph workflow with all nodes
3. Workflow execution: Runs the workflow and returns results

Workflow Steps:
1. create_context: Generate architectural context and extract project structure
2. analyze_terraform_minor: Analyze minor version Terraform (optional)
3. analyze_terraform_major: Analyze major version Terraform (optional)
4. analyze_source_code_minor: Validate minor version with source code
5. analyze_source_code_major: Validate major version with source code
6. do_architecture_diff: Compare both architecture analyses
7. generate_adrs: Generate ADRs from the comparison

Usage:
    # Create and run workflow
    workflow = ADRWorkflow(project_dir="project-inputs/chef")
    initial_state = workflow.create()
    result = await workflow.run(initial_state)
    
    # Access generated ADRs
    adrs = result["adr_files"]

Architecture:
    The workflow uses parallel execution where possible:
    - Terraform analysis nodes run in parallel (if enabled)
    - Source code analysis nodes run in parallel
    - Architecture diff waits for both analyses to complete
    - ADR generation is the final step
"""

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
    """
    Main workflow orchestrator for ADR generation.
    
    This class manages the entire lifecycle of the ADR (Architecture Decision Record)
    generation workflow using LangGraph. It handles project configuration loading,
    LLM initialization, workflow creation, and execution.
    
    Attributes:
        project_dir: Path to the project directory containing project-config.yaml
        project_config: Loaded project configuration dictionary
        llm: ChatOpenAI instance for LLM interactions
        include_terraform: Whether to include Terraform analysis nodes
        include_knowledge: Whether to include knowledge base in analysis
        reuse_context: Whether to reuse pre-generated architectural context
        workflow: Compiled LangGraph workflow
        thread_id: Unique identifier for the workflow execution thread
        initial_state: Initial state dictionary for the workflow
    
    Example:
        >>> workflow = ADRWorkflow(project_dir="project-inputs/chef")
        >>> initial_state = workflow.create()
        >>> result = await workflow.run(initial_state)
        >>> print(result["adr_files"])
    """

    def __init__(self, project_dir: str=None, llm: ChatOpenAI = None):
        """
        Initialize the ADRWorkflow.
        
        Args:
            project_dir: Optional path to the project directory. If not provided,
                        will look for project-config.yaml in current directory.
            llm: Optional ChatOpenAI instance. If not provided, will initialize
                 a new one using environment variables.
        """
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
        """
        Initialize the project by loading configuration and setting up the LLM.
        
        This method:
        1. Loads the project configuration from project-config.yaml
        2. Falls back to default configuration if file doesn't exist
        3. Initializes the LLM if not provided in constructor
        
        Args:
            project_dir: Path to the project directory containing configuration
        """
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
        """
        Create and configure the LangGraph workflow.
        
        This method:
        1. Stores workflow configuration options
        2. Logs project configuration details
        3. Builds the initial state from project configuration
        4. Creates and compiles the LangGraph workflow
        
        Args:
            include_terraform: Whether to include Terraform analysis nodes (default: True)
            reuse_context: Whether to reuse pre-generated context instead of generating new (default: True)
            include_knowledge: Whether to include knowledge base in analysis (default: True)
        
        Returns:
            ADRWorkflowState: Initial state dictionary containing project paths and metadata
        
        Note:
            The initial state includes:
            - project_name: Name of the project
            - terraform_minor: Path to minor evolution Terraform file
            - terraform_major: Path to major evolution Terraform file
            - source_code_zip: Path to source code ZIP archive
            - knowledge_base: Path to knowledge base file
            - timestamp: ISO 8601 timestamp of workflow creation
        """
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
        """
        Get a visualization of the workflow graph.
        
        Returns:
            IPython.display.Image: PNG image of the workflow graph in Mermaid format
        
        Note:
            This method uses LangGraph's Mermaid diagram generation to create
            a visual representation of the workflow nodes and edges.
        """
        return Image(self.workflow.get_graph().draw_mermaid_png())

    async def run(self, initial_state: Dict[str, Any] = None, thread_id: str=None) -> Dict[str, Any]: 
        """
        Execute the ADR workflow.
        
        This method:
        1. Generates a unique thread ID if not provided
        2. Uses provided initial_state or falls back to self.initial_state
        3. Invokes the LangGraph workflow with the initial state
        4. Returns the final workflow state containing generated ADRs
        
        Args:
            initial_state: Optional initial state dictionary. If not provided,
                          uses the state created by create()
            thread_id: Optional thread ID for checkpointing. If not provided,
                      generates a new UUID
        
        Returns:
            Dict: Final workflow state containing:
                  - adr_files: Dictionary of generated ADR files
                  - All intermediate analysis results
                  - project_name and timestamp
        
        Example:
            >>> result = await workflow.run()
            >>> for filename, content in result["adr_files"].items():
            ...     print(f"{filename}: {len(content)} chars")
        """
        thread_id = str(uuid.uuid4()) if thread_id is None else thread_id
        self.thread_id = thread_id

        if initial_state is None:
            initial_state = self.initial_state
        
        return await ADRWorkflow.run_workflow(self.project_dir, initial_state, self.workflow, self.thread_id)   
    
    # Delegate to the corresponding function nodes (which, in turn, rely on the agents)

    async def _create_context(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Create architectural context and extract project structure.
        
        This is the first node in the workflow that:
        1. Generates theoretical architectural context
        2. Extracts project structure from source code ZIP
        3. Stores results in the workflow state
        
        Args:
            state: Current workflow state
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with architectural context
        """
        return await context_generator_node(state, llm=self.llm, reuse_context=self.reuse_context, include_knowledge=self.include_knowledge)

    async def _analyze_terraform_minor(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Analyze minor version Terraform file.
        
        Analyzes the minor evolution Terraform file for microservices patterns.
        
        Args:
            state: Current workflow state containing terraform_minor path
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with terraform_analysis_minor
        """
        return await terraform_analyzer_minor_node(state, llm=self.llm, include_knowledge=self.include_knowledge)
    
    async def _analyze_terraform_major(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Analyze major version Terraform file.
        
        Analyzes the major evolution Terraform file for microservices patterns.
        
        Args:
            state: Current workflow state containing terraform_major path
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with terraform_analysis_major
        """
        return await terraform_analyzer_major_node(state, llm=self.llm, include_knowledge=self.include_knowledge)
    
    async def _analyze_source_code_minor(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Validate and improve minor version analysis with source code.
        
        Uses actual source code to validate and enhance the Terraform analysis.
        
        Args:
            state: Current workflow state with terraform_analysis_minor
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with improved_analysis_minor
        """
        return await source_code_analyzer_minor_node(state, llm=self.llm)
    
    async def _analyze_source_code_major(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Validate and improve major version analysis with source code.
        
        Uses actual source code to validate and enhance the Terraform analysis.
        
        Args:
            state: Current workflow state with terraform_analysis_major
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with improved_analysis_major
        """
        return await source_code_analyzer_major_node(state, llm=self.llm)
    
    async def _do_architecture_diff(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Compare minor and major architecture analyses.
        
        Identifies key architectural decisions in the migration path.
        
        Args:
            state: Current workflow state with improved_analysis_minor and improved_analysis_major
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with architecture_diff
        """
        return await architecture_diff_node(state, llm=self.llm)
    
    async def _generate_adrs(self, state: ADRWorkflowState, config: RunnableConfig) -> ADRWorkflowState:
        """
        LangGraph node: Generate Architecture Decision Records.
        
        Final node that generates ADRs based on the architecture comparison.
        
        Args:
            state: Current workflow state with architecture_diff
            config: LangGraph runnable configuration
        
        Returns:
            Updated workflow state with adr_files dictionary
        """
        return await adr_generator_node(state, llm=self.llm)


    @staticmethod
    def create_workflow(workflow: 'ADRWorkflow', include_terraform=True, checkpointer = None) -> StateGraph:
        """
        Create and compile a LangGraph workflow.
        
        This static method builds the workflow graph by:
        1. Creating a new StateGraph with ADRWorkflowState
        2. Adding all required nodes based on include_terraform flag
        3. Defining edges to control execution flow
        4. Compiling the graph with a MemorySaver checkpointer
        
        The workflow execution path:
        - With Terraform: context -> [terraform_minor, terraform_major] -> 
                         [source_minor, source_major] -> diff -> ADR
        - Without Terraform: context -> [source_minor, source_major] -> diff -> ADR
        
        Args:
            workflow: ADRWorkflow instance containing node implementations
            include_terraform: Whether to include Terraform analysis nodes
            checkpointer: Optional LangGraph checkpointer for state persistence
        
        Returns:
            StateGraph: Compiled LangGraph workflow ready for execution
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
        Execute the compiled LangGraph workflow.
        
        This static method invokes the workflow with:
        1. Thread-based checkpointing for state persistence
        2. The provided initial state dictionary
        
        Args:
            project_dir: Path to the project directory (e.g., project-inputs/chef)
            initial_state: Initial state dictionary containing project paths
            graph: Compiled LangGraph workflow
            thread_id: Unique identifier for this execution thread
        
        Returns:
            Dict: Final workflow state with all analysis results and generated ADRs
        """

        logger.info(f"RUNNING workflow for project: {project_dir} - {thread_id}")
        
        # Run workflow
        config: RunnableConfig = {"configurable": {"thread_id": thread_id}}
        result = await graph.ainvoke(initial_state, config=config)
        
        return result



