"""
Source Code Analyzer Nodes for ADR workflow.

This module provides two nodes for validating and improving architecture analysis:
- source_code_analyzer_minor_node: Validates minor version analysis
- source_code_analyzer_major_node: Validates major version analysis

Each node:
1. Checks if source code ZIP exists for the branch
2. If ZIP exists: extracts code and performs combined analysis
3. If ZIP doesn't exist: uses Terraform-only analysis with warning
4. Provides an enhanced analysis combining infrastructure and code perspectives

State Updates:
- improved_analysis_minor: Enhanced analysis for minor version
- improved_analysis_major: Enhanced analysis for major version

Usage:
    These nodes run after terraform_analyzer nodes in the workflow.
"""

from state import ADRWorkflowState
from agents.source_code_analyzer import SourceCodeAnalyzer
from agents.source_code_extractor import SourceCodeExtractor
from config import get_llm_config, get_project_config

import logging

logger = logging.getLogger(__name__)

# Track which branches have been analyzed
_missing_branches = set()


async def source_code_analyzer_minor_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    """LangGraph node: Extract and analyze source code for minor version."""

    logger.info("STEP: source_code_analyzer_minor_node")

    llm = llm or get_llm_config().llm

    # Check if source code ZIP exists for minor branch
    source_code_zip = state.get("source_code_zip_minor", "")
    
    if source_code_zip:
        # Source code available - extract and analyze
        logger.info(f"Source code found for minor branch: {source_code_zip}")
        
        # Get project configuration for extraction settings
        project_config = get_project_config()
        context_gen_config = project_config.get("context_generation", {})
        max_files = context_gen_config.get("max_files", 10)
        max_file_size = context_gen_config.get("max_file_size", 5000)
        summarize_large_files = context_gen_config.get("summarize_large_files", True)

        # Extract source code using SourceCodeExtractor
        extractor = SourceCodeExtractor(llm=llm, summarize_large_files=summarize_large_files)
        
        # Extract project structure
        structure = extractor.extract_project_structure(source_code_zip)
        project_structure = extractor.format_project_structure(structure)
        
        # Extract source code
        source_code_dict = await extractor.extract_source_code(
            source_code_zip,
            max_files=max_files,
            max_file_size=max_file_size
        )
        source_code = "\n\n".join([
            f"=== {filepath} ===\n{content}"
            for filepath, content in source_code_dict.items()
        ])
        
        # Store in state
        state["project_structure_minor"] = project_structure
        state["source_code_minor"] = source_code
        state["source_code_dict_minor"] = source_code_dict
        state["extraction_metadata_minor"] = {
            "total_files": len(source_code_dict),
            "summarized_files": sum(1 for c in source_code_dict.values() if "[SUMMARIZED" in c),
            "full_files": sum(1 for c in source_code_dict.values() if "[SUMMARIZED" not in c),
            "branch": "minor"
        }
        
        logger.info(f"Extracted {len(source_code_dict)} files for minor branch")
        
        # Analyze with source code
        analyzer = SourceCodeAnalyzer(llm=llm)
        result = await analyzer.analyze(
            context=state["architectural_context"],
            previous_analysis=state.get("terraform_analysis_minor", ""),
            source_code=source_code,
            project_structure=project_structure,
            version="minor"
        )
        state["improved_analysis_minor"] = result["analysis"]
        
    else:
        # Source code not available - use terraform-only analysis
        logger.warning("Source code branch [minor] not available, using Terraform-only analysis")
        _missing_branches.add("minor")
        
        # Store empty values
        state["project_structure_minor"] = ""
        state["source_code_minor"] = ""
        state["source_code_dict_minor"] = {}
        state["extraction_metadata_minor"] = {
            "total_files": 0,
            "branch": "minor",
            "note": "Source code not available"
        }
        
        # Use terraform analysis as improved analysis
        state["improved_analysis_minor"] = state.get("terraform_analysis_minor", "")
    
    # Check if both branches are missing
    if len(_missing_branches) == 2:
        logger.warning("Both minor and major source code branches are missing. Using Terraform-only analysis for both branches.")
    
    return state


async def source_code_analyzer_major_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    """LangGraph node: Extract and analyze source code for major version."""

    logger.info("STEP: source_code_analyzer_major_node")

    llm = llm or get_llm_config().llm

    # Check if source code ZIP exists for major branch
    source_code_zip = state.get("source_code_zip_major", "")
    
    if source_code_zip:
        # Source code available - extract and analyze
        logger.info(f"Source code found for major branch: {source_code_zip}")
        
        # Get project configuration for extraction settings
        project_config = get_project_config()
        context_gen_config = project_config.get("context_generation", {})
        max_files = context_gen_config.get("max_files", 10)
        max_file_size = context_gen_config.get("max_file_size", 5000)
        summarize_large_files = context_gen_config.get("summarize_large_files", True)

        # Extract source code using SourceCodeExtractor
        extractor = SourceCodeExtractor(llm=llm, summarize_large_files=summarize_large_files)
        
        # Extract project structure
        structure = extractor.extract_project_structure(source_code_zip)
        project_structure = extractor.format_project_structure(structure)
        
        # Extract source code
        source_code_dict = await extractor.extract_source_code(
            source_code_zip,
            max_files=max_files,
            max_file_size=max_file_size
        )
        source_code = "\n\n".join([
            f"=== {filepath} ===\n{content}"
            for filepath, content in source_code_dict.items()
        ])
        
        # Store in state
        state["project_structure_major"] = project_structure
        state["source_code_major"] = source_code
        state["source_code_dict_major"] = source_code_dict
        state["extraction_metadata_major"] = {
            "total_files": len(source_code_dict),
            "summarized_files": sum(1 for c in source_code_dict.values() if "[SUMMARIZED" in c),
            "full_files": sum(1 for c in source_code_dict.values() if "[SUMMARIZED" not in c),
            "branch": "major"
        }
        
        logger.info(f"Extracted {len(source_code_dict)} files for major branch")
        
        # Analyze with source code
        analyzer = SourceCodeAnalyzer(llm=llm)
        result = await analyzer.analyze(
            context=state["architectural_context"],
            previous_analysis=state.get("terraform_analysis_major", ""),
            source_code=source_code,
            project_structure=project_structure,
            version="major"
        )
        state["improved_analysis_major"] = result["analysis"]
        
    else:
        # Source code not available - use terraform-only analysis
        logger.warning("Source code branch [major] not available, using Terraform-only analysis")
        _missing_branches.add("major")
        
        # Store empty values
        state["project_structure_major"] = ""
        state["source_code_major"] = ""
        state["source_code_dict_major"] = {}
        state["extraction_metadata_major"] = {
            "total_files": 0,
            "branch": "major",
            "note": "Source code not available"
        }
        
        # Use terraform analysis as improved analysis
        state["improved_analysis_major"] = state.get("terraform_analysis_major", "")
    
    # Check if both branches are missing
    if len(_missing_branches) == 2:
        logger.warning("Both minor and major source code branches are missing. Using Terraform-only analysis for both branches.")
    
    return state