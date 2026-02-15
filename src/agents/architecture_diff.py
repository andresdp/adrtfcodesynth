from typing import Dict, Any
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

class ArchitectureDiff:
    """Agent for comparing architecture analyses."""
    
    def __init__(self, llm: ChatOpenAI):
        self.llm = llm
        self._setup_chains()
    
    def _setup_chains(self):
        """Setup LangChain chains for comparison."""
        self.comparison_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are a software architect expert in architecture evolution and decision analysis. You reason rigorously and write for expert architects."),
            ("user", self._get_comparison_prompt_template())
        ])
        
        self.comparison_chain = self.comparison_prompt | self.llm | StrOutputParser()
    
    def _get_comparison_prompt_template(self) -> str:
        """Get prompt template for architecture comparison."""
        
        return """
        You are given two versions of an architecture analysis for the same application,
        each one coming from a different implementation and infrastructure:
        
        - The hybrid analysis describes a hybrid architecture with a monolithic component and a single Lambda function.
        - The microservices analysis describes the same application fully migrated to a microservices-based architecture, with multiple Lambda functions and an API Gateway.
        
        If available, you may also use the following theoretical introduction
        about software architecture, monolithic architecture, and microservices architecture:
        
        == THEORETICAL CONTEXT (if context available) ==
        {context}
        
        == ARCHITECTURE ANALYSIS - HYBRID VERSION ==
        {hybrid_analysis}
        
        == ARCHITECTURE ANALYSIS - MICROSERVICES VERSION ==
        {microservices_analysis}
        
        Your task is:
        
        1. Identify the most important architecture decisions involved in the migration
           from the HYBRID version to the MICROSERVICES version.
        2. For each of these decisions, provide:
           - A brief description of the decision
           - The key differences that necessitated this decision
           - The architectural impact of this decision
        
        Focus on decisions that are clearly implied by the differences between the HYBRID
        and MICROSERVICES versions (for example, migration strategy, decomposition approach,
        communication style, deployment model, data management).
        
        Do not invent technologies or details that are not supported by the analyses.
        Limit the output to at most 5 key decisions.
        
        Return the answer in well-structured Markdown, with clear headings for each decision. Do not include a markdown tag at the beginning, just plain markdown format.
        """
    
    async def compare(self, hybrid_analysis: str, microservices_analysis: str, 
                 context: str) -> Dict[str, Any]:
        """Compare hybrid and microservices architecture analyses."""
        
        # Invoke LangChain chain for comparison
        comparison = await self.comparison_chain.ainvoke({
            "context": context,
            "hybrid_analysis": hybrid_analysis,
            "microservices_analysis": microservices_analysis
        })
        
        return {"comparison": comparison}
