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
        
        # Analysis chain for source code validation
        self.analysis_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are a software architect expert in hybrid architectures, Infrastructure as Code, and design patterns. You reason rigorously and write for expert architects."),
            ("user", self._get_analysis_prompt_template())
        ])
        
        self.analysis_chain = self.analysis_prompt | self.llm | StrOutputParser()
    
    
    def _get_analysis_prompt_template(self) -> str:
        """Get prompt template for source code analysis."""
        return """
        You are given four sources of information about a {version_type} solution:
        
        1. A theoretical introduction in Markdown about software architecture, monolithic architecture, and microservices architecture.
        2. A previous architecture analysis derived from the Terraform file ({version} evolution), if available.
        3. The actual source code used in the solution (Python and Terraform files).
        4. The project structure showing the organization of files and directories.
        
        Use ALL of them as context.
        
        == THEORETICAL CONTEXT ==
        {context}
        
        == PREVIOUS TERRAFORM-BASED ANALYSIS ({version}) ==
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
        Return the answer in well-structured Markdown, with clear headings and sections. Do not include a Markdown tag at the beginning, just plain markdown format. 
        """  

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
            "version": version.upper(),
            "version_description": version_description,
            "context": context,
            "previous_analysis": previous_analysis,
            "project_structure": project_structure,
            "source_code": source_code
        })
        
        return {"analysis": analysis}
