"""
ADR Generator Agent for creating Architecture Decision Records.

This agent generates Architecture Decision Records (ADRs) based on the comparison
between two architecture versions. It uses the MADR (Markdown ADRs) template format.

Key Features:
1. Multiple ADR generation: Creates up to 5 ADRs for key decisions
2. Structured output: Uses Pydantic models for structured data
3. Markdown format: Outputs well-formatted Markdown ADRs
4. Comprehensive sections: Includes all standard ADR sections

ADR Structure:
- Title: Short descriptive title
- Status: Proposed, Accepted, Rejected, Deprecated, or Superseded
- Motivation: Problem being solved
- Decision Drivers: Functional requirements, non-functional requirements, constraints
- Main Decision: Chosen architecture decision
- Alternatives: Other options considered
- Pros: Advantages of each option
- Cons: Disadvantages of each option
- Consequences: Trade-offs and impact
- Validation: How the decision can be validated
- Additional Information: References and notes

Usage:
    from agents.adr_generator import ADRGenerator
    
    generator = ADRGenerator(llm=chat_openai)
    result = await generator.generate(
        comparison="architecture comparison text",
        context="theoretical context",
        project_name="myproject"
    )
    
    # Returns {"projectname_ADR_1.md": "# ADR: ...", ...}
"""

import json
import re
from typing import Dict, Any, List, Optional

from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

from pydantic import BaseModel, Field


class ADR(BaseModel):
    """Pydantic model for a single Architecture Decision Record."""
    
    adr_name: str = Field(description="Short name of the ADR from the '# ADR:' heading")
    title: str = Field(description="Short and descriptive title of the architecture decision")
    status: str = Field(description="Status of the decision: Proposed, Accepted, Rejected, Deprecated, or Superseded")
    motivation: str = Field(description="Explanation of the problem being solved by the decision")
    decision_drivers: List[str] = Field(description="List of main drivers: functional requirements, non-functional requirements, and constraints")
    main_decision: str = Field(description="Detailed description of the chosen architecture decision")
    alternatives: List[str] = Field(description="List of alternative architecture options that were not chosen")
    pros: str = Field(description="Pros of each decision (main decision and alternatives) with subheadings")
    cons: str = Field(description="Cons of each decision (main decision and alternatives) with subheadings")
    consequences: str = Field(description="Positive and negative consequences and trade-offs of the chosen decision")
    validation: str = Field(description="How the decision can be or has been validated")
    additional_information: str = Field(description="References, links, related ADRs, issue IDs, or other notes")

    def to_markdown(self) -> str:
        """Convert an ADR Pydantic model to Markdown format."""
        lines = [
            f"# ADR: {self.adr_name}",
            "",
            "## Title",
            self.title,
            "",
            "## Status",
            self.status,
            "",
            "## Motivation",
            self.motivation,
            "",
            "## Decision Drivers"
        ]
        
        for driver in self.decision_drivers:
            lines.append(f"- {driver}")
        
        lines.extend([
            "",
            "## Main Decision",
            self.main_decision,
            "",
            "## Alternatives"
        ])
        
        for alt in self.alternatives:
            lines.append(f"- {alt}")
        
        lines.extend([
            "",
            "## Pros",
            self.pros,
            "",
            "## Cons",
            self.cons,
            "",
            "## Consequences",
            self.consequences,
            "",
            "## Validation",
            self.validation,
            "",
            "## Additional Information",
            self.additional_information
        ])
        
        return "\n".join(lines)



class ADRList(BaseModel):
    """Pydantic model for a list of Architecture Decision Records."""
    
    adrs: List[ADR] = Field(description="List of Architecture Decision Records")


class ADRGenerator:
    """Agent for generating Architecture Decision Records."""
    
    def __init__(self, llm: ChatOpenAI):
        self.llm = llm
        self._setup_chains()
    
    def _setup_chains(self):
        """Setup LangChain chains for ADR generation."""
        self.adr_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are a software architect expert in documenting architecture decisions (ADR) using MADR-inspired templates. You reason rigorously and write for expert architects."),
            ("user", self._get_adr_prompt_template())
        ])
        
        # Use structured output with Pydantic model
        self.adr_chain = self.adr_prompt | self.llm.with_structured_output(ADRList)
    
    def _get_adr_prompt_template(self) -> str:
        """Get prompt template for ADR generation."""
        return """
        You are given a comparison of two architecture analyses for the same application.
        Based on this comparison, you must generate Architecture Decision Records (ADRs)
        for the most important decisions identified in the migration.
        
        == ARCHITECTURE COMPARISON ==
        {comparison}
        
        == THEORETICAL CONTEXT (if context available) ==
        {context}
        
        Your task is:
        
        For each important decision identified in the comparison, write a complete ADR
        using the following template, which combines MADR-style elements with
        expert-recommended sections.
        
        For each ADR, follow these rules:
        
        - Start the ADR with a top-level heading of the form:
          "# ADR: <short decision name>"
        
        - Then, include the following sections in this exact order, with these headings:
        
        ## Title
        ## Status
        ## Motivation
        ## Decision Drivers
        ## Main Decision
        ## Alternatives
        ## Pros
        ## Cons
        ## Consequences
        ## Validation
        ## Additional Information
        
        SECTION DEFINITIONS AND RULES
        -----------------------------
        
        - **Title**
          - Short and descriptive of the purpose of the architecture decision.
          - Avoid unnecessary technology names that are not central to the decision.
        
        - **Status**
          - Must be one of: Proposed, Accepted, Rejected, Deprecated, Superseded.
          - Choose the one that best matches the information you can infer.
        
        - **Motivation**
          - Explain the problem being solved by the decision.
          - Blend system context, constraints, and requirements.
          - Clearly describe WHY a decision is needed now.
          - Write continuous prose (no bullet points).
        
        - **Decision Drivers**
          - Bullet list of the main drivers of the decision:
            - functional requirements,
            - non-functional requirements (quality attributes),
            - constraints (organizational, technical, regulatory, etc.).
        
        - **Main Decision**
          - Describe the chosen architecture decision in detail.
          - Explain how it addresses the motivation and decision drivers.
          - Include any relevant assumptions and clarifications.
          - Write continuous prose (no bullet points).
        
        - **Alternatives**
          - List other architecture options that could have addressed the same problem,
            but were not chosen.
          - Do NOT repeat the main decision here.
          - For each alternative, provide a short name and a brief one-line description.
        
        - **Pros**
          - For EACH decision (main decision and alternatives):
            - Create a subheading with the decision/option name and list its advantages.
          - Example structure:
            - Main decision:
              - Pros:
                - ...
                  - ...
            - Alternative 1:
              - Pros:
                - ...
                  - ...
        
        - **Cons**
          - For EACH decision (main decision and alternatives):
            - Create a subheading with the decision/option name and list its disadvantages.
          - Example structure:
            - Main decision:
              - Cons:
                - ...
                  - ...
            - Alternative 1:
              - Cons:
                - ...
                  - ...
        
        - **Consequences**
          - Describe the positive and negative consequences and trade-offs of the chosen
            main decision, including:
            - short-term vs long-term impact,
            - impact on key quality attributes (scalability, performance, maintainability,
              security, resilience, etc.).
        
        - **Validation**
          - Include this section only if you can reasonably infer how the decision can be
            or has been validated (e.g., tests, prototypes, benchmarks, reviews).
          - If nothing is known, you may write:
            - "Validation to be defined in future iterations."
        
        - **Additional Information**
          - Use this section only for:
            - references,
            - links,
            - related ADRs,
            - issue or pull request IDs,
            - other notes that do not fit in previous sections.
          - If there is nothing relevant, you may leave it empty or omit it.
        
        Additional guidelines:
        
        - Focus on decisions that are clearly implied by the differences between the HYBRID
          and MICROSERVICES versions (for example, migration strategy, decomposition approach,
          communication style, deployment model, data management).
        - Do not invent technologies or details that are not supported by the analyses.
        - Limit the output to at most 5 ADRs that capture the key decisions in this migration.
        - If you detect more than one important decision, produce multiple ADRs, one after another.
        - Separate each ADR visually by starting each one with a line that begins with "# ADR:".
        
        Return ONLY the ADRs in Markdown format, with no additional explanation or commentary.
        """
    
    async def generate(self, comparison: str, context: str, project_name: str) -> Dict[str, Any]:
        """Generate ADRs from architecture comparison."""
        
        # Invoke LangChain chain for ADR generation with structured output
        adr_list: ADRList = await self.adr_chain.ainvoke({
            "comparison": comparison,
            "context": context
        })
        
        # Save each ADR to a separate file
        adr_files = dict()
        for idx, adr in enumerate(adr_list.adrs, start=1):
            filename = f"{project_name}_ADR_{idx}.md"
            adr_files[filename] = adr.to_markdown()
        
        # Convert ADR objects to dictionaries for JSON output
        # adr_json_list = []
        # for idx, adr in enumerate(adr_list.adrs, start=1):
        #     adr_dict = adr.model_dump()
        #     adr_dict["source_file"] = f"output-adrs/{project_name}_ADR_{idx}.txt"
        #     adr_json_list.append(adr_dict)
        
        return adr_files
    

