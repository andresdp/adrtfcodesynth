import json
import re
from typing import Dict, Any, List
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

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
        
        self.adr_chain = self.adr_prompt | self.llm | StrOutputParser()
    
    def _get_adr_prompt_template(self) -> str:
        """Get prompt template for ADR generation."""
        return """
        You are given a comparison of two architecture analyses for the same application.
        Based on this comparison, you must generate Architecture Decision Records (ADRs)
        for the most important decisions identified in the migration.
        
        == ARCHITECTURE COMPARISON ==
        {comparison}
        
        == THEORETICAL CONTEXT ==
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
    
    async def generate(self, comparison: str, context: str, 
                  project_name: str) -> Dict[str, Any]:
        """Generate ADRs from architecture comparison."""
        
        # Invoke LangChain chain for ADR generation
        adrs_text = await self.adr_chain.ainvoke({
            "comparison": comparison,
            "context": context
        })
        
        # Parse ADRs from response
        adr_blocks = self._split_adrs(adrs_text)
        
        # Save each ADR to a separate file
        adr_files = []
        for idx, block in enumerate(adr_blocks, start=1):
            filename = f"output-adrs/{project_name}_ADR_{idx}.txt"
            with open(filename, "w", encoding="utf-8") as f:
                f.write(block)
            adr_files.append(filename)
        
        # Parse ADRs to JSON
        adr_json_list = []
        for adr_file in adr_files:
            with open(adr_file, "r", encoding="utf-8") as f:
                content = f.read()
            adr_obj = self._parse_adr_markdown(content)
            adr_obj["source_file"] = adr_file
            adr_json_list.append(adr_obj)
        
        # Save JSON collection
        json_output = f"project-inputs/{project_name}_adr_collection.json"
        with open(json_output, "w", encoding="utf-8") as f:
            json.dump(adr_json_list, f, ensure_ascii=False, indent=2)
        
        return {
            "adr_files": adr_files,
            "json_collection": {
                "filename": json_output,
                "adrs": adr_json_list
            }
        }
    
    def _split_adrs(self, text: str) -> List[str]:
        """Split ADRs by detecting lines that start with '# ADR:'."""
        adr_blocks = []
        current_adr_lines = []
        
        for line in text.split('\n'):
            if line.strip().lower().startswith('# adr'):
                if current_adr_lines:
                    adr_blocks.append('\n'.join(current_adr_lines))
                current_adr_lines = [line]
            else:
                current_adr_lines.append(line)
        
        if current_adr_lines:
            adr_blocks.append('\n'.join(current_adr_lines))
        
        return adr_blocks
    
    def _parse_adr_markdown(self, text: str) -> Dict[str, Any]:
        """Parse a single ADR in Markdown and return a dict with the main fields."""
        lines = text.split('\n')
        sections = {}
        current_section = None
        current_content = []
        
        for line in lines:
            stripped = line.strip()
            
            # Top-level ADR heading
            if stripped.lower().startswith('# adr'):
                adr_name = stripped.replace('# ADR:', '').replace('# ADR', '').strip()
                sections['adr_name'] = adr_name
                current_section = None
                current_content = []
            # Section heading
            elif stripped.startswith('## '):
                if current_section:
                    sections[current_section] = '\n'.join(current_content).strip()
                current_section = stripped[3:].strip()
                current_content = []
            # Accumulate content
            elif current_section:
                current_content.append(line)
        
        # Add last section
        if current_section:
            sections[current_section] = '\n'.join(current_content).strip()
        
        def parse_bullet_list(section_name: str) -> List[str]:
            raw_lines = sections.get(section_name, '').split('\n')
            items = []
            for line in raw_lines:
                s = line.strip()
                if s.startswith('-') or s.startswith('*'):
                    items.append(s.lstrip('-* ').strip())
            return items
        
        return {
            'adr_name': sections.get('adr_name', ''),
            'title': sections.get('Title', ''),
            'status': sections.get('Status', ''),
            'motivation': sections.get('Motivation', ''),
            'decision_drivers': parse_bullet_list('Decision Drivers'),
            'main_decision': sections.get('Main Decision', ''),
            'alternatives': parse_bullet_list('Alternatives'),
            'pros': sections.get('Pros', ''),
            'cons': sections.get('Cons', ''),
            'consequences': sections.get('Consequences', ''),
            'validation': sections.get('Validation', ''),
            'additional_information': sections.get('Additional Information', '')
        }
