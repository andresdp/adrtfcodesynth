import zipfile
from typing import Dict, Any
from pathlib import Path
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

class SourceCodeAnalyzer:
    """Agent for analyzing project structure and validating Terraform analysis against source code."""

    def __init__(self, llm: ChatOpenAI):
        self.llm = llm
        self._setup_chains()
    
    def _setup_chains(self):
        """Setup LangChain chains for analysis."""
        # Summary chain for code file summarization
        self.summary_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are an expert software architect specializing in code analysis and architectural pattern recognition. You create concise, structured summaries that capture essential architectural information."),
            ("user", self._get_summary_prompt_template())
        ])
        
        self.summary_chain = self.summary_prompt | self.llm | StrOutputParser()
        
        # Analysis chain for source code validation
        self.analysis_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are a software architect expert in hybrid architectures, Infrastructure as Code, and design patterns. You reason rigorously and write for expert architects."),
            ("user", self._get_analysis_prompt_template())
        ])
        
        self.analysis_chain = self.analysis_prompt | self.llm | StrOutputParser()
    
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
    
    def _get_analysis_prompt_template(self) -> str:
        """Get prompt template for source code analysis."""
        return """
        You are given four sources of information about a {version_type} solution:
        
        1. A theoretical introduction in Markdown about software architecture, monolithic architecture, and microservices architecture.
        2. A previous architecture analysis derived from the Terraform file ({version} evolution).
        3. The actual source code used in the solution (Python and Terraform files).
        4. The project structure showing the organization of files and directories.
        
        Use ALL of them as context.
        
        == THEORETICAL CONTEXT ==
        {context}
        
        == PREVIOUS TERRAFORM-BASED ANALYSIS ({version.upper()}) ==
        {previous_analysis}
        
        == PROJECT STRUCTURE ==
        {project_structure}
        
        == SOURCE CODE (PY / TF) ==
        {source_code}
        
        Your tasks:
        
        1. Analyze the project structure to understand:
           - How the codebase is organized (monolithic vs modular)
           - Separation of concerns between modules
           - Presence of service boundaries
           - Dependency management patterns
        
        2. Validate or correct the previous Terraform-based analysis using:
           - The real source code implementation
           - The project structure and organization
           - Evidence from actual code patterns
        
        3. Identify additional architectures or patterns present by examining:
           - Code organization and module boundaries
           - Communication patterns between components
           - Data access patterns (e.g., separate data stores per service)
           - Deployment configuration in code
           - Design patterns (Strategy, Factory, CQRS, etc.)
        
        4. Write an improved architecture analysis that:
           - Clearly describes the current architecture based on code evidence.
           - Explains how and why it is {version_description}.
           - Highlights key quality attributes (scalability, maintainability, performance, security, etc.).
           - Discusses its potential evolution towards a more microservices-based or serverless architecture.
           - Cites specific code files and patterns that support your analysis.
        
        Target audience: expert software architects.
        Return the answer in well-structured Markdown, with clear headings and sections.
        """

    def _extract_project_structure(self, zip_path: str) -> Dict[str, Any]:
        """Extract and analyze the project structure from ZIP archive."""
        structure = {
            "directories": [],
            "python_files": [],
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
                elif path.suffix == '.tf':
                    structure["terraform_files"].append(str(path))
                elif path.name in ['requirements.txt', 'pyproject.toml', 'setup.py',
                                   'package.json', 'tsconfig.json', 'Dockerfile']:
                    structure["config_files"].append(str(path))
                else:
                    structure["other_files"].append(str(path))

        return structure

    def _extract_source_code(self, zip_path: str, max_files: int = 10,
                          max_file_size: int = 5000) -> Dict[str, str]:
        """Extract source code content from ZIP archive.
        
        Args:
            zip_path: Path to ZIP archive
            max_files: Maximum number of files to extract
            max_file_size: Maximum file size in characters before summarizing (default: 5000)
        
        Returns:
            Dictionary mapping file paths to content (full or summarized)
        """
        source_code = {}
        
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            # Prioritize Python files
            python_files = [f for f in zip_ref.namelist() if f.endswith('.py')]
            
            # Limit number of files to avoid context overflow
            for file_path in python_files[:max_files]:
                try:
                    content = zip_ref.read(file_path).decode('utf-8', errors='ignore')
                    # Summarize large files to fit in context window
                    if len(content) > max_file_size:
                        content = self._summarize_code_file(
                            file_path, content, max_file_size
                        )
                    source_code[file_path] = content
                except Exception as e:
                    continue

            # Add Terraform files if present
            tf_files = [f for f in zip_ref.namelist() if f.endswith('.tf')]
            for file_path in tf_files[:max_files]:
                try:
                    content = zip_ref.read(file_path).decode('utf-8', errors='ignore')
                    # Summarize large Terraform files
                    if len(content) > max_file_size:
                        content = self._summarize_code_file(
                            file_path, content, max_file_size
                        )
                    source_code[file_path] = content
                except Exception as e:
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
        return f"""[SUMMARIZED - Original size: {len(content)} chars, Summary size: {len(summary)} chars]

{summary}
"""

    def _format_project_structure(self, structure: Dict[str, Any]) -> str:
        """Format project structure for prompt."""
        lines = []
        lines.append("PROJECT STRUCTURE ANALYSIS")
        lines.append("=" * 50)
        lines.append(f"\nTotal Directories: {len(structure['directories'])}")
        lines.append(f"Python Files: {len(structure['python_files'])}")
        lines.append(f"Terraform Files: {len(structure['terraform_files'])}")
        lines.append(f"Configuration Files: {len(structure['config_files'])}")
        lines.append(f"Other Files: {len(structure['other_files'])}")
        
        lines.append("\n\nDIRECTORY LAYOUT:")
        for directory in structure['directories']:
            lines.append(f"  {directory}/")
        
        lines.append("\n\nPYTHON SOURCE FILES:")
        for py_file in structure['python_files']:
            lines.append(f"  - {py_file}")
        
        lines.append("\n\nTERRAFORM FILES:")
        for tf_file in structure['terraform_files']:
            lines.append(f"  - {tf_file}")
        
        lines.append("\n\nCONFIGURATION FILES:")
        for config_file in structure['config_files']:
            lines.append(f"  - {config_file}")
        
        return '\n'.join(lines)

    async def analyze(self, context: str, previous_analysis: str,
                  source_code: str, version: str,
                  project_structure: str = "") -> Dict[str, Any]:
        """Validate and improve architecture analysis using source code and project structure."""

        # Determine version type and description
        if version == 'minor':
            version_type = "hybrid"
            version_description = "hybrid (monolith + microservices)"
        else:
            version_type = "microservices-based"
            version_description = "microservices-based"
        
        # Invoke LangChain chain for analysis
        analysis = await self.analysis_chain.ainvoke({
            "version_type": version_type,
            "version": version,
            "version_description": version_description,
            "context": context,
            "previous_analysis": previous_analysis,
            "project_structure": project_structure,
            "source_code": source_code
        })
        
        return {"analysis": analysis}
