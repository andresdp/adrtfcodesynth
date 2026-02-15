from typing import Dict, Any
from pydantic import BaseModel, Field

from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser, PydanticOutputParser

import logging


logger = logging.getLogger(__name__)


class MicroservicesAnalysis(BaseModel):
    """Structured output for microservices architecture analysis."""
    
    microservices: bool = Field(
        description="Whether the Terraform code describes a microservices architecture pattern"
    )
    confidence: float = Field(
        description="Confidence score between 0 and 1 indicating how certain the analysis is",
        ge=0.0,
        le=1.0
    )
    signals_for: list[str] = Field(
        description="List of signals or indicators that suggest microservices architecture"
    )
    signals_against: list[str] = Field(
        description="List of signals or indicators that suggest monolithic architecture"
    )


class TerraformAnalyzer:
    """Agent for analyzing Terraform files against IaC rules."""
    
    def __init__(self, llm: ChatOpenAI, knowledge_base: str):
        self.llm = llm
        self.knowledge_base = knowledge_base
        self._setup_chains()
    
    def _setup_chains(self):
        """Setup LangChain chains for analysis."""
        # Setup Pydantic output parser for structured output
        # self.parser = PydanticOutputParser(pydantic_object=MicroservicesAnalysis)
        
        self.analysis_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are an expert software architect in Infrastructure as Code and cloud-native microservices. You reason rigorously and write for expert architects."),
            ("user", self._get_analysis_prompt_template())
        ])
        
        self.analysis_chain = self.analysis_prompt | self.llm.with_structured_output(MicroservicesAnalysis) # | self.parser
    
    def _get_analysis_prompt_template(self) -> str:
        """Get prompt template for Terraform analysis."""
        
        return """
        THEORETICAL CONTEXT (Markdown, for expert architects):
        {context}
        
        IAC RULE CATALOG — prioritize this evidence:
        {knowledge_base}
        
        PROJECT STRUCTURE (for context):
        {project_structure}
        
        TERRAFORM CODE:
        {terraform_code}
        
        TASK:
        1) Decide whether Terraform code describes a MICROservices architecture (true/false).
        2) Justify your assessment with explicit evidence, citing from:
           - [R#] for rule references from the IaC catalog, and
           - [C#] for specific code fragments in the Terraform file.
           Cover at least:
           - modularity (modules/reuse),
           - independent deployment of services,
           - communication style (async queues/events/APIs),
           - distributed deployment (networks/subnets, multiple services, orchestrators).
        3) Explicitly mention negative signals that point towards a monolith or tightly-coupled design
           (single deployment unit, one service, strong shared state, etc.).
        4) Provide a clear verdict and a confidence score in [0..1] with a short explanation.
        5) At the very end of the answer, emit a compact JSON mini-report in a single code block,
           with the following structure and no extra commentary:
        
        {{
          "microservices": true/false,
          "confidence": <float between 0 and 1>,
          "signals_for": ["...", "..."],
          "signals_against": ["...", "..."]
        }}
        
        Be concise, technical, and always cite [R#] and/or [C#] in each justification bullet.
        """
    
    async def analyze(self, terraform_code: str, context: str, 
                  project_structure: str = "") -> MicroservicesAnalysis: # -> str: #-> Dict[str, Any]:
        """Analyze Terraform code for microservices patterns."""
        
        # Invoke LangChain chain
        analysis = await self.analysis_chain.ainvoke({
            "context": context,
            "knowledge_base": self.knowledge_base,
            "project_structure": project_structure,
            "terraform_code": terraform_code
        })
        
        # return {
        #     "analysis": analysis,
        #     "json_report": self._extract_json(analysis)
        # }
        return analysis
    
    # def _extract_json(self, content: str) -> Dict[str, Any]:
    #     """Extract JSON mini-report from LLM response."""
    #     import re
    #     import json
        
    #     # Find JSON block in response
    #     json_match = re.search(r'```json\n(.*?)\n```', content, re.DOTALL)
    #     if json_match:
    #         return json.loads(json_match.group(1))
    #     return {}
