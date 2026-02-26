"""
Source Code Extractor Agent for extracting project structure and source code.

This agent is responsible for extracting and analyzing the project structure
from a ZIP archive containing the application source code. It provides:

1. Project structure analysis: Identifies directories, source files, 
   configuration files, and their organization
2. Source code extraction: Extracts code content from supported file types
3. Code summarization: Summarizes large files to fit within LLM context limits

Supported file types:
- Python (.py)
- TypeScript (.ts)
- React TypeScript (.tsx)
- JavaScript (.js)
- Java (.java)
- PHP (.php)
- XML (.xml)
- Terraform (.tf)
- Configuration files (requirements.txt, package.json, etc.)

Usage:
    from agents.source_code_extractor import SourceCodeExtractor
    
    extractor = SourceCodeExtractor(llm=chat_openai)
    
    # Extract project structure
    structure = extractor.extract_project_structure("path/to/app.zip")
    project_structure = extractor.format_project_structure(structure)
    
    # Extract source code
    source_code_dict = await extractor.extract_source_code(
        "path/to/app.zip",
        max_files=10,
        max_file_size=5000
    )
"""

import zipfile
from typing import Dict, Any
from pathlib import Path
from pydantic import BaseModel, Field

from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser, PydanticOutputParser

import logging

logger = logging.getLogger(__name__)


class SourceCodeExtractor:
    """Agent for extracting project structure and source code context."""

    # Supported source code file extensions
    SUPPORTED_CODE_EXTENSIONS = {'.py', '.ts', '.tsx', '.js', '.java', '.xml', '.php'}

    def __init__(self, llm: ChatOpenAI, summarize_large_files: bool = True):
        """Initialize the SourceCodeExtractor agent.

        Args:
            llm: ChatOpenAI instance for generating summaries
            summarize_large_files: Whether to summarize files that exceed max_file_size.
                                   If False, large files will be included in full.
        """
        self.llm = llm
        self.summarize_large_files = summarize_large_files
        self._setup_chains()
    
    def _setup_chains(self):
        """Setup LangChain chains for context generation."""
        # Summary chain for code file summarization
        self.summary_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are an expert software architect specializing in code analysis and architectural pattern recognition. You create concise, structured summaries that capture essential architectural information."),
            ("user", self._get_summary_prompt_template())
        ])
        
        self.summary_chain = self.summary_prompt | self.llm | StrOutputParser()
    
    def _get_summary_prompt_template(self) -> str:
        """Get prompt template for code file summarization."""
        return """
        Summarize the following {file_type} file for architectural analysis.
        
        File: {file_path}
        Approximate size: {content_length} characters (~{estimated_tokens} tokens)
        
        Your task:
        {summary_tasks}
        
        Keep the summary under {target_size} characters.
        Format as structured text with clear sections.
        
        CODE TO SUMMARIZE:
        {content}
        """
    
    def extract_project_structure(self, zip_path: str) -> Dict[str, Any]:
        """Extract and analyze the project structure from ZIP archive.
        
        Args:
            zip_path: Path to ZIP archive
            
        Returns:
            Dictionary containing categorized file lists
        """
        structure = {
            "directories": [],
            "python_files": [],
            "typescript_files": [],
            "tsx_files": [],
            "javascript_files": [],
            "php_files": [],
            "java_files": [],
            "xml_files": [],
            "terraform_files": [],
            "config_files": [],
            "other_files": []
        }

        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            for file_info in zip_ref.infolist():
                path = Path(file_info.filename)
                
                if file_info.is_dir():
                    structure["directories"].append(str(path))
                elif path.suffix == '.py':
                    structure["python_files"].append(str(path))
                elif path.suffix == '.ts':
                    structure["typescript_files"].append(str(path))
                elif path.suffix == '.tsx':
                    structure["tsx_files"].append(str(path))
                elif path.suffix == '.js':
                    structure["javascript_files"].append(str(path))
                elif path.suffix == '.php':
                    structure["php_files"].append(str(path))
                elif path.suffix == '.java':
                    structure["java_files"].append(str(path))
                elif path.suffix == '.xml':
                    structure["xml_files"].append(str(path))
                elif path.suffix == '.tf':
                    structure["terraform_files"].append(str(path))
                elif path.name in ['requirements.txt', 'pyproject.toml', 'setup.py',
                                   'package.json', 'tsconfig.json', 'Dockerfile',
                                   'pom.xml', 'build.gradle', 'gradle.properties',
                                   'composer.json', 'composer.lock']:
                    structure["config_files"].append(str(path))
                else:
                    structure["other_files"].append(str(path))

        return structure

    async def extract_source_code(self, zip_path: str, max_files: int = 10,
                                  max_file_size: int = 5000) -> Dict[str, str]:
        """Extract source code content from ZIP archive with optional summarization.

        Args:
            zip_path: Path to ZIP archive
            max_files: Maximum number of files to extract
            max_file_size: Maximum file size in characters before summarizing (if summarize_large_files is True)

        Returns:
            Dictionary mapping file paths to content (full or summarized)
        """
        source_code = {}
        
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            # Collect all supported code files
            code_files = []
            for ext in self.SUPPORTED_CODE_EXTENSIONS:
                code_files.extend([f for f in zip_ref.namelist() if f.endswith(ext)])
            
            # Also add Terraform files
            tf_files = [f for f in zip_ref.namelist() if f.endswith('.tf')]
            code_files.extend(tf_files)
            
            # Sort by path for consistent ordering
            code_files.sort()
            
            # Limit number of files to avoid context overflow
            for file_path in code_files[:max_files]:
                try:
                    content = zip_ref.read(file_path).decode('utf-8', errors='ignore')
                    # Summarize large files if both conditions are met:
                    # 1. File size exceeds max_file_size
                    # 2. summarize_large_files flag is True
                    if len(content) > max_file_size and self.summarize_large_files:
                        logger.info(f"Summarizing file: {file_path}")
                        content = await self._summarize_code_file(
                            file_path, content, max_file_size
                        )
                    source_code[file_path] = content
                except Exception as e:
                    logger.warning(f"Failed to process file {file_path}: {str(e)}")
                    continue

        return source_code

    async def _summarize_code_file(self, file_path: str, content: str,
                                  target_size: int) -> str:
        """Summarize a large code file to fit within context window.
        
        Args:
            file_path: Path to the code file
            content: Full content of the code file
            target_size: Target size in characters for the summary
        
        Returns:
            Summarized version of the code file
        """
        # Calculate approximate token count (rough estimate: 4 chars per token)
        estimated_tokens = len(content) // 4
        
        # Determine summary strategy based on file type
        file_ext = Path(file_path).suffix
        
        if file_ext == '.py':
            file_type = "Python"
            summary_tasks = """
            1. Identify the main purpose and responsibility of this module
            2. List key classes and their responsibilities
            3. List key functions and their purposes
            4. Identify important imports and external dependencies
            5. Note any architectural patterns or design patterns used
            6. Identify communication patterns (API calls, database access, messaging, etc.)
            """
        elif file_ext == '.ts':
            file_type = "TypeScript"
            summary_tasks = """
            1. Identify the main purpose and responsibility of this module
            2. List key interfaces, types, and their roles
            3. List key classes and functions with their purposes
            4. Identify important imports and external dependencies
            5. Note any architectural patterns or design patterns used
            6. Identify communication patterns (API calls, database access, messaging, etc.)
            """
        elif file_ext == '.tsx':
            file_type = "TypeScript React (TSX)"
            summary_tasks = """
            1. Identify the main purpose and responsibility of this component
            2. List key props/interfaces and their types
            3. List key state variables and their purposes
            4. Identify important imports and external dependencies (React hooks, libraries)
            5. Note any architectural patterns or design patterns used
            6. Identify communication patterns (API calls, event handlers, parent-child communication)
            7. List key child components and their roles
            """
        elif file_ext == '.js':
            file_type = "JavaScript"
            summary_tasks = """
            1. Identify the main purpose and responsibility of this module
            2. List key functions and their purposes
            3. Identify important imports and external dependencies
            4. Note any architectural patterns or design patterns used
            5. Identify communication patterns (API calls, database access, messaging, etc.)
            """
        elif file_ext == '.php':
            file_type = "PHP"
            summary_tasks = """
            1. Identify the main purpose and responsibility of this module
            2. List key classes, interfaces, and their responsibilities
            3. List key functions and methods with their purposes
            4. Identify important use statements and external dependencies
            5. Note any architectural patterns or design patterns used
            6. Identify communication patterns (API calls, database access, HTTP requests, etc.)
            """
        elif file_ext == '.java':
            file_type = "Java"
            summary_tasks = """
            1. Identify the main purpose and responsibility of this class/module
            2. List key classes, interfaces, and their responsibilities
            3. List key methods and their purposes
            4. Identify important imports and external dependencies
            5. Note any architectural patterns or design patterns used
            6. Identify communication patterns (API calls, database access, messaging, etc.)
            """
        elif file_ext == '.xml':
            file_type = "XML"
            summary_tasks = """
            1. Identify the main purpose and structure of this XML file
            2. List key elements and their roles
            3. Identify important attributes and configurations
            4. Note any dependencies or references to other files
            5. Identify the schema or structure being used
            """
        elif file_ext == '.tf':
            file_type = "Terraform"
            summary_tasks = """
            1. Identify the main resources being defined
            2. List key modules and their purposes
            3. Identify cloud services being used
            4. Note networking and security configurations
            5. Identify communication patterns between resources
            """
        else:
            file_type = "code"
            summary_tasks = """
            1. Identify the main purpose and responsibility
            2. List key components and their roles
            3. Identify important dependencies
            4. Note any architectural patterns
            """
        
        # Invoke LangChain chain for summarization
        summary = await self.summary_chain.ainvoke({
            "file_type": file_type,
            "file_path": file_path,
            "content_length": len(content),
            "estimated_tokens": estimated_tokens,
            "summary_tasks": summary_tasks,
            "target_size": target_size,
            "content": content
        })
        
        # Add metadata about the summarization
        return f"""[SUMMARIZED - Original size: {len(content)} chars, Summary size: {len(summary)} chars] {summary}"""

    def format_project_structure(self, structure: Dict[str, Any]) -> str:
        """Format project structure for prompt with tree-like representation.
        
        Args:
            structure: Dictionary containing file lists by type
            
        Returns:
            Formatted string representation of project structure
        """
        lines = []
        lines.append("PROJECT STRUCTURE ANALYSIS")
        lines.append("=" * 50)
        lines.append(f"\nTotal Directories: {len(structure['directories'])}")
        lines.append(f"Python Files: {len(structure['python_files'])}")
        lines.append(f"TypeScript Files: {len(structure['typescript_files'])}")
        lines.append(f"TSX Files: {len(structure['tsx_files'])}")
        lines.append(f"JavaScript Files: {len(structure['javascript_files'])}")
        lines.append(f"PHP Files: {len(structure['php_files'])}")
        lines.append(f"Java Files: {len(structure['java_files'])}")
        lines.append(f"XML Files: {len(structure['xml_files'])}")
        lines.append(f"Terraform Files: {len(structure['terraform_files'])}")
        lines.append(f"Configuration Files: {len(structure['config_files'])}")
        lines.append(f"Other Files: {len(structure['other_files'])}")
        
        # Build tree-like structure
        lines.append("\n\nPROJECT FILE TREE:")
        tree_lines = self._build_file_tree(structure)
        lines.extend(tree_lines)
        
        lines.append("\n\nFILE TYPE BREAKDOWN:")
        
        if structure['python_files']:
            lines.append("\n  Python Source Files:")
            for py_file in structure['python_files']:
                lines.append(f"    - {py_file}")
        
        if structure['typescript_files']:
            lines.append("\n  TypeScript Source Files:")
            for ts_file in structure['typescript_files']:
                lines.append(f"    - {ts_file}")
        
        if structure['tsx_files']:
            lines.append("\n  TSX (React) Files:")
            for tsx_file in structure['tsx_files']:
                lines.append(f"    - {tsx_file}")
        
        if structure['javascript_files']:
            lines.append("\n  JavaScript Source Files:")
            for js_file in structure['javascript_files']:
                lines.append(f"    - {js_file}")
        
        if structure['php_files']:
            lines.append("\n  PHP Source Files:")
            for php_file in structure['php_files']:
                lines.append(f"    - {php_file}")
        
        if structure['java_files']:
            lines.append("\n  Java Source Files:")
            for java_file in structure['java_files']:
                lines.append(f"    - {java_file}")
        
        if structure['xml_files']:
            lines.append("\n  XML Files:")
            for xml_file in structure['xml_files']:
                lines.append(f"    - {xml_file}")
        
        if structure['terraform_files']:
            lines.append("\n  Terraform Files:")
            for tf_file in structure['terraform_files']:
                lines.append(f"    - {tf_file}")
        
        if structure['config_files']:
            lines.append("\n  Configuration Files:")
            for config_file in structure['config_files']:
                lines.append(f"    - {config_file}")
        
        if structure['other_files']:
            lines.append("\n  Other Files:")
            for other_file in structure['other_files']:
                lines.append(f"    - {other_file}")
        
        return '\n'.join(lines)
    
    def _build_file_tree(self, structure: Dict[str, Any]) -> list[str]:
        """Build a tree-like representation of the project structure.
        
        Args:
            structure: Dictionary containing file lists by type
            
        Returns:
            List of strings representing the tree structure
        """
        # Collect all files and directories
        all_paths = []
        
        # Add directories
        for directory in structure['directories']:
            all_paths.append((directory, True))
        
        # Add all files
        for file_type in ['python_files', 'typescript_files', 'tsx_files', 
                          'javascript_files', 'php_files', 'java_files', 
                          'xml_files', 'terraform_files', 'config_files', 'other_files']:
            for file_path in structure[file_type]:
                all_paths.append((file_path, False))
        
        # Sort paths for consistent tree structure
        all_paths.sort(key=lambda x: x[0])
        
        # Build tree
        tree = {}
        for path, is_dir in all_paths:
            parts = Path(path).parts
            current = tree
            for i, part in enumerate(parts):
                if part not in current:
                    current[part] = {} if i < len(parts) - 1 or is_dir else None
                current = current[part]
        
        # Format tree as strings
        return self._format_tree(tree)
    
    def _format_tree(self, tree: dict, prefix: str = "", is_last: bool = True) -> list[str]:
        """Format tree dictionary as indented strings.
        
        Args:
            tree: Nested dictionary representing the tree structure
            prefix: Current indentation prefix
            is_last: Whether this is the last item at current level
            
        Returns:
            List of formatted strings
        """
        lines = []
        items = sorted(tree.items())
        
        for i, (name, children) in enumerate(items):
            is_last_item = i == len(items) - 1
            
            # Choose appropriate tree characters
            if prefix == "":
                connector = "" if is_last_item else ""
            else:
                connector = "└── " if is_last_item else "├── "
            
            lines.append(f"{prefix}{connector}{name}")
            
            # Format children
            if children is not None:
                # Calculate new prefix
                if prefix == "":
                    new_prefix = "    " if is_last_item else "│   "
                else:
                    new_prefix = prefix + ("    " if is_last_item else "│   ")
                
                child_lines = self._format_tree(children, new_prefix, is_last_item)
                lines.extend(child_lines)
        
        return lines