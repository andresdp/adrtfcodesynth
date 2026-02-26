"""
Workflow state definitions for the ADR Code Synth application.

This module defines the ADRWorkflowState TypedDict which represents the complete
state that flows through the LangGraph workflow. It contains all inputs,
intermediate results, outputs, and metadata needed to generate Architecture
Decision Records (ADRs).

State Structure:
    - Inputs: terraform_minor, terraform_major, source_code_zip_minor, source_code_zip_major, knowledge_base
    - Intermediate: architectural_context, project_structure_minor/major, source_code_minor/major, etc.
    - Outputs: adr_files
    - Metadata: project_name, timestamp

Usage:
    from state import ADRWorkflowState
    
    # Use as type hint for workflow state
    def process_node(state: ADRWorkflowState) -> ADRWorkflowState:
        ...
"""

from typing import TypedDict, Dict, Annotated
import operator


def last_value_reducer(current_value, new_value):
    """
    Reducer function for LangGraph state updates.
    
    This reducer takes the new value and replaces value,
    which the current is appropriate for single-value fields in the workflow state.
    
    Args:
        current_value: The current value in the state
        new_value: The new value to replace with
        
    Returns:
        The new value (simple replacement strategy)
    """
    return new_value


# https://docs.langchain.com/oss/python/langgraph/errors/INVALID_CONCURRENT_GRAPH_UPDATE

# Define workflow state
class ADRWorkflowState(TypedDict):
    """
    TypedDict representing the state of the ADR (Architecture Decision Record) workflow.
    This state flows through the LangGraph workflow and contains all inputs, intermediate
    results, outputs, and metadata needed to generate architecture decision records.
    """

    # Inputs
    terraform_minor: Annotated[str, last_value_reducer] #str
    # terraform_minor: Annotated[List[str], operator.add]
    """
    Path to the Terraform file representing the minor evolution/changes of the infrastructure.
    This typically contains smaller, incremental infrastructure changes.
    
    Example: "project-inputs/abelaa/abelaa_cloud_evolucion_menor.tf"
    """

    terraform_major: Annotated[str, last_value_reducer] #str
    # terraform_major: Annotated[List[str], operator.add]
    """
    Path to the Terraform file representing the major evolution/changes of the infrastructure.
    This typically contains significant architectural changes or new components.
    
    Example: "project-inputs/abelaa/abelaa_cloud_evolucion_mayor.tf"
    """

    source_code_zip_minor: Annotated[str, last_value_reducer] #str
    # source_code_zip_minor: Annotated[List[str], operator.add]
    """
    Path to the ZIP archive containing the minor evolution source code.
    Optional - if not provided, only Terraform analysis will be used for the minor branch.
    
    Example: "project-inputs/abelaa/abelaa_app_minor.zip"
    """

    source_code_zip_major: Annotated[str, last_value_reducer] #str
    # source_code_zip_major: Annotated[List[str], operator.add]
    """
    Path to the ZIP archive containing the major evolution source code.
    Optional - if not provided, only Terraform analysis will be used for the major branch.
    If only one source code ZIP is configured (legacy format), it will be treated as major.
    
    Example: "project-inputs/abelaa/abelaa_app_major.zip"
    """

    knowledge_base: Annotated[str, last_value_reducer] #str
    # knowledge_base: Annotated[List[str], operator.add]
    """
    Path to the knowledge base file containing domain-specific information,
    best practices, and context for generating informed ADRs.
    
    Example: "knowledge/IAC.txt"
    """

    # Intermediate results
    architectural_context: Annotated[str, last_value_reducer] #str
    # architectural_context: Annotated[List[str], operator.add]
    """
    Generated context about the project's architecture, including technology stack,
    design patterns, and architectural decisions. Used to inform ADR generation.
    
    Example: "The project uses a serverless architecture with AWS Lambda functions..."
    """

    # Minor branch source code data
    project_structure_minor: Annotated[str, last_value_reducer] #str
    # project_structure_minor: Annotated[List[str], operator.add]
    """
    Description of the minor evolution project's directory structure and organization.
    Only populated if source_code_zip_minor is provided.
    
    Example: "src/\n  controllers/\n  services/\n  models/\n  utils/"
    """

    source_code_minor: Annotated[str, last_value_reducer] #str
    # source_code_minor: Annotated[List[str], operator.add]
    """
    Concatenated source code content extracted from the minor evolution ZIP archive.
    Only populated if source_code_zip_minor is provided.
    
    Example: "import boto3\n\ndef lambda_handler(event, context):\n    ..."
    """

    source_code_dict_minor: Annotated[dict, last_value_reducer] #dict
    # source_code_dict_minor: Annotated[List[dict], operator.add]
    """
    Dictionary mapping file paths to their source code content for minor evolution.
    Preserves the original structure of extracted source files.
    Only populated if source_code_zip_minor is provided.
    
    Example: {"src/main.py": "import boto3...", "src/utils.py": "def helper()..."}
    """

    extraction_metadata_minor: Annotated[dict, last_value_reducer] #dict
    # extraction_metadata_minor: Annotated[List[dict], operator.add]
    """
    Metadata about the minor evolution source code extraction process.
    Only populated if source_code_zip_minor is provided.
    
    Example: {"total_files": 15, "file_types": [".py", ".json"], "branch": "minor"}
    """

    # Major branch source code data
    project_structure_major: Annotated[str, last_value_reducer] #str
    # project_structure_major: Annotated[List[str], operator.add]
    """
    Description of the major evolution project's directory structure and organization.
    Only populated if source_code_zip_major is provided.
    
    Example: "src/\n  controllers/\n  services/\n  models/\n  utils/"
    """

    source_code_major: Annotated[str, last_value_reducer] #str
    # source_code_major: Annotated[List[str], operator.add]
    """
    Concatenated source code content extracted from the major evolution ZIP archive.
    Only populated if source_code_zip_major is provided.
    
    Example: "import boto3\n\ndef lambda_handler(event, context):\n    ..."
    """

    source_code_dict_major: Annotated[dict, last_value_reducer] #dict
    # source_code_dict_major: Annotated[List[dict], operator.add]
    """
    Dictionary mapping file paths to their source code content for major evolution.
    Preserves the original structure of extracted source files.
    Only populated if source_code_zip_major is provided.
    
    Example: {"src/main.py": "import boto3...", "src/utils.py": "def helper()..."}
    """

    extraction_metadata_major: Annotated[dict, last_value_reducer] #dict
    # extraction_metadata_major: Annotated[List[dict], operator.add]
    """
    Metadata about the major evolution source code extraction process.
    Only populated if source_code_zip_major is provided.
    
    Example: {"total_files": 15, "file_types": [".py", ".json"], "branch": "major"}
    """

    terraform_analysis_minor: Annotated[str, last_value_reducer] #str
    # terraform_analysis_minor: Annotated[List[str], operator.add]
    """
    Analysis of the minor Terraform infrastructure changes.
    Describes what resources are being added, modified, or removed in the minor evolution.
    
    Example: "Minor evolution adds a new S3 bucket for storing logs..."
    """

    terraform_analysis_major: Annotated[str, last_value_reducer] #str
    # terraform_analysis_major: Annotated[List[str], operator.add]
    """
    Analysis of the major Terraform infrastructure changes.
    Describes significant architectural shifts and new infrastructure components.
    
    Example: "Major evolution introduces a new VPC with public and private subnets..."
    """

    source_analysis_minor: Annotated[str, last_value_reducer] #str
    # source_analysis_minor: Annotated[List[str], operator.add]
    """
    Analysis of source code changes corresponding to the minor infrastructure evolution.
    Identifies code modifications that support the minor infrastructure changes.
    
    Example: "Added logging functions to write to the new S3 bucket..."
    """

    source_analysis_major: Annotated[str, last_value_reducer] #str
    # source_analysis_major: Annotated[List[str], operator.add]
    """
    Analysis of source code changes corresponding to the major infrastructure evolution.
    Identifies significant code refactoring or new features supporting major changes.
    
    Example: "Refactored application to use VPC endpoints for improved security..."
    """

    improved_analysis_minor: Annotated[str, last_value_reducer] #str
    # improved_analysis_minor: Annotated[List[str], operator.add]
    """
    Enhanced/consolidated analysis combining Terraform and source code perspectives
    for the minor evolution. Provides a unified view of changes.
    
    Example: "Minor evolution: Added S3 bucket infrastructure + logging code integration..."
    """

    improved_analysis_major: Annotated[str, last_value_reducer] #str
    # improved_analysis_major: Annotated[List[str], operator.add]
    """
    Enhanced/consolidated analysis combining Terraform and source code perspectives
    for the major evolution. Provides a unified view of significant changes.
    
    Example: "Major evolution: New VPC architecture + application security hardening..."
    """

    architecture_diff: Annotated[str, last_value_reducer] #str
    # architecture_diff: Annotated[List[str], operator.add]
    """
    Comparison between the minor and major evolutions, highlighting the key differences
    and the progression of architectural decisions.
    
    Example: "Progression from simple S3-based logging to full VPC with private endpoints..."
    """

    # Outputs
    adr_files: Annotated[dict, last_value_reducer] #dict
    # adr_files: Annotated[List[dict], operator.add]
    """
    Dictionary of paths to generated Architecture Decision Record (ADR) files.
    Each file documents a specific architectural decision with context, alternatives,
    and rationale.
    
    Example: ["output-adrs/abelaa_ADR_1.txt", "output-adrs/abelaa_ADR_2.txt"]
    """

    # Metadata
    project_name: Annotated[str, last_value_reducer] #str
    # project_name: Annotated[List[str], operator.add]
    """
    Name of the project being analyzed. Used for naming output files and organization.
    
    Example: "abelaa", "chef", "serverlessmike"
    """

    timestamp: Annotated[str, last_value_reducer] #str
    # timestamp: Annotated[List[str], operator.add]
    """
    ISO 8601 timestamp indicating when the workflow was executed.
    Useful for tracking and versioning of generated ADRs.
    
    Example: "2026-02-14T15:37:21.611Z"
    """