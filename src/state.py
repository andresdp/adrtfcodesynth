from typing import TypedDict

# Define workflow state
class ADRWorkflowState(TypedDict):
    """
    TypedDict representing the state of the ADR (Architecture Decision Record) workflow.
    This state flows through the LangGraph workflow and contains all inputs, intermediate
    results, outputs, and metadata needed to generate architecture decision records.
    """

    # Inputs
    terraform_minor: str
    """
    Path to the Terraform file representing the minor evolution/changes of the infrastructure.
    This typically contains smaller, incremental infrastructure changes.
    
    Example: "project-inputs/abelaa/abelaa_cloud_evolucion_menor.tf"
    """

    terraform_major: str
    """
    Path to the Terraform file representing the major evolution/changes of the infrastructure.
    This typically contains significant architectural changes or new components.
    
    Example: "project-inputs/abelaa/abelaa_cloud_evolucion_mayor.tf"
    """

    source_code_zip: str
    """
    Path to the ZIP archive containing the application source code.
    The code is extracted and analyzed to understand the implementation details.
    
    Example: "project-inputs/abelaa/abelaa_app.zip"
    """

    knowledge_base: str
    """
    Path to the knowledge base file containing domain-specific information,
    best practices, and context for generating informed ADRs.
    
    Example: "knowledge/IAC.txt"
    """

    # Intermediate results
    architectural_context: str
    """
    Generated context about the project's architecture, including technology stack,
    design patterns, and architectural decisions. Used to inform ADR generation.
    
    Example: "The project uses a serverless architecture with AWS Lambda functions..."
    """

    project_structure: str
    """
    Description of the project's directory structure and organization.
    Helps understand how different components are organized and related.
    
    Example: "src/\n  controllers/\n  services/\n  models/\n  utils/"
    """

    source_code: str
    """
    Concatenated source code content extracted from the ZIP archive.
    Contains the actual implementation code for analysis.
    
    Example: "import boto3\n\ndef lambda_handler(event, context):\n    ..."
    """

    source_code_dict: dict
    """
    Dictionary mapping file paths to their source code content.
    Preserves the original structure of extracted source files.
    
    Example: {"src/main.py": "import boto3...", "src/utils.py": "def helper()..."}
    """

    extraction_metadata: dict
    """
    Metadata about the source code extraction process, including file count,
    file types, and extraction statistics.
    
    Example: {"total_files": 15, "file_types": [".py", ".json"], "total_lines": 1234}
    """

    terraform_analysis_minor: str
    """
    Analysis of the minor Terraform infrastructure changes.
    Describes what resources are being added, modified, or removed in the minor evolution.
    
    Example: "Minor evolution adds a new S3 bucket for storing logs..."
    """

    terraform_analysis_major: str
    """
    Analysis of the major Terraform infrastructure changes.
    Describes significant architectural shifts and new infrastructure components.
    
    Example: "Major evolution introduces a new VPC with public and private subnets..."
    """

    source_analysis_minor: str
    """
    Analysis of source code changes corresponding to the minor infrastructure evolution.
    Identifies code modifications that support the minor infrastructure changes.
    
    Example: "Added logging functions to write to the new S3 bucket..."
    """

    source_analysis_major: str
    """
    Analysis of source code changes corresponding to the major infrastructure evolution.
    Identifies significant code refactoring or new features supporting major changes.
    
    Example: "Refactored application to use VPC endpoints for improved security..."
    """

    improved_analysis_minor: str
    """
    Enhanced/consolidated analysis combining Terraform and source code perspectives
    for the minor evolution. Provides a unified view of changes.
    
    Example: "Minor evolution: Added S3 bucket infrastructure + logging code integration..."
    """

    improved_analysis_major: str
    """
    Enhanced/consolidated analysis combining Terraform and source code perspectives
    for the major evolution. Provides a unified view of significant changes.
    
    Example: "Major evolution: New VPC architecture + application security hardening..."
    """

    architecture_diff: str
    """
    Comparison between the minor and major evolutions, highlighting the key differences
    and the progression of architectural decisions.
    
    Example: "Progression from simple S3-based logging to full VPC with private endpoints..."
    """

    # Outputs
    adr_files: list[str]
    """
    List of paths to generated Architecture Decision Record (ADR) files.
    Each file documents a specific architectural decision with context, alternatives,
    and rationale.
    
    Example: ["output-adrs/abelaa_ADR_1.txt", "output-adrs/abelaa_ADR_2.txt"]
    """

    json_collection: dict
    """
    Structured collection of all ADRs in JSON format for programmatic access.
    Contains all generated ADRs with their metadata and content.
    
    Example: {"project_name": "abelaa", "adrs": [{"id": "ADR_1", "title": "..."}, ...]}
    """

    # Metadata
    project_name: str
    """
    Name of the project being analyzed. Used for naming output files and organization.
    
    Example: "abelaa", "chef", "serverlessmike"
    """

    timestamp: str
    """
    ISO 8601 timestamp indicating when the workflow was executed.
    Useful for tracking and versioning of generated ADRs.
    
    Example: "2026-02-14T15:37:21.611Z"
    """
