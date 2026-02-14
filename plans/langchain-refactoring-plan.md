# LangChain Refactoring Plan

## Overview
Refactor the ADR CodeSynth codebase to use LangChain instead of directly using AsyncOpenAI from the openai library. This will make it easier to switch LLM providers in the future.

## Current Architecture
- Agents use `AsyncOpenAI` directly from `openai` library
- Nodes import and use `AsyncOpenAI` instances
- LLM configuration is scattered across multiple files

## Target Architecture
- Agents use LangChain's `ChatOpenAI` class
- Nodes use LangChain chains for prompt management
- Centralized LLM configuration via a config module
- Easy provider switching (OpenAI, Anthropic, etc.)

## Files to Refactor

### 1. Configuration Module (NEW)
**File**: `src/config.py`

**Purpose**: Centralize LLM configuration and initialization

**Responsibilities**:
- Load environment variables (API keys, model names)
- Initialize LangChain ChatOpenAI instance
- Provide LLM instance to all agents and nodes
- Support easy provider switching

**Implementation**:
```python
from langchain_openai import ChatOpenAI
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    openai_api_key: str
    openai_model: str = "gpt-4o"
    temperature: float = 0.3
    max_tokens: int = 2000

    class Config:
        env_file = ".env"

class LLMConfig:
    """LLM configuration and initialization."""
    
    def __init__(self, settings: Settings):
        self.settings = settings
        self._llm = None
    
    @property
    def llm(self) -> ChatOpenAI:
        """Get or create the LLM instance."""
        if self._llm is None:
            self._llm = ChatOpenAI(
                api_key=self.settings.openai_api_key,
                model=self.settings.openai_model,
                temperature=self.settings.temperature,
                max_tokens=self.settings.max_tokens
            )
        return self._llm

# Global LLM instance
llm_config: LLMConfig = None
llm: ChatOpenAI = None

def initialize_llm():
    """Initialize the global LLM instance."""
    global llm_config, llm
    settings = Settings()
    llm_config = LLMConfig(settings)
    llm = llm_config.llm
    return llm
```

### 2. Agent Refactoring

#### 2.1 TerraformAnalyzer
**File**: `src/agents/terraform_analyzer.py`

**Changes**:
- Replace `from openai import AsyncOpenAI` with `from langchain_openai import ChatOpenAI`
- Replace `llm: AsyncOpenAI` with `llm: ChatOpenAI`
- Replace `await self.llm.chat.completions.create()` with LangChain chain invocation
- Use LangChain prompts for better prompt management

**New Implementation**:
```python
from typing import Dict, Any
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser, JsonOutputParser

class TerraformAnalyzer:
    """Agent for analyzing Terraform files against IaC rules."""
    
    def __init__(self, llm: ChatOpenAI, knowledge_base: str):
        self.llm = llm
        self.knowledge_base = knowledge_base
        self._setup_chains()
    
    def _setup_chains(self):
        """Setup LangChain chains for analysis."""
        self.analysis_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are an expert software architect in Infrastructure as Code and cloud-native microservices. You reason rigorously and write for expert architects."),
            ("user", self._get_analysis_prompt_template())
        ])
        
        self.analysis_chain = self.analysis_prompt | self.llm | StrOutputParser()
    
    def _get_analysis_prompt_template(self) -> str:
        """Get the prompt template for Terraform analysis."""
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
                  project_structure: str = "") -> Dict[str, Any]:
        """Analyze Terraform code for microservices patterns."""
        
        # Invoke the LangChain chain
        analysis = await self.analysis_chain.ainvoke({
            "context": context,
            "knowledge_base": self.knowledge_base,
            "project_structure": project_structure,
            "terraform_code": terraform_code
        })
        
        return {
            "analysis": analysis,
            "json_report": self._extract_json(analysis)
        }
    
    def _extract_json(self, content: str) -> Dict[str, Any]:
        """Extract JSON mini-report from LLM response."""
        import re
        import json
        
        # Find JSON block in response
        json_match = re.search(r'```json\n(.*?)\n```', content, re.DOTALL)
        if json_match:
            return json.loads(json_match.group(1))
        return {}
```

#### 2.2 SourceCodeAnalyzer
**File**: `src/agents/source_code_analyzer.py`

**Changes**:
- Replace `from openai import AsyncOpenAI` with `from langchain_openai import ChatOpenAI`
- Replace `llm: AsyncOpenAI` with `llm: ChatOpenAI`
- Replace `await self.llm.chat.completions.create()` with LangChain chain invocation
- Use LangChain prompts for better prompt management

#### 2.3 ArchitectureDiff
**File**: `src/agents/architecture_diff.py`

**Changes**:
- Replace `from openai import AsyncOpenAI` with `from langchain_openai import ChatOpenAI`
- Replace `llm: AsyncOpenAI` with `llm: ChatOpenAI`
- Replace `await self.llm.chat.completions.create()` with LangChain chain invocation

#### 2.4 ADRGenerator
**File**: `src/agents/adr_generator.py`

**Changes**:
- Replace `from openai import AsyncOpenAI` with `from langchain_openai import ChatOpenAI`
- Replace `llm: AsyncOpenAI` with `llm: ChatOpenAI`
- Replace `await self.llm.chat.completions.create()` with LangChain chain invocation

#### 2.5 ContextGenerator
**File**: `src/agents/context_generator.py`

**Changes**:
- Replace `from openai import AsyncOpenAI` with `from langchain_openai import ChatOpenAI`
- Replace `llm: AsyncOpenAI` with `llm: ChatOpenAI`
- Replace `await self.llm.chat.completions.create()` with LangChain chain invocation

### 3. Node Refactoring

#### 3.1 All Nodes
**Files**:
- `src/nodes/context_generator_node.py`
- `src/nodes/terraform_analyzer_node.py`
- `src/nodes/source_code_analyzer_node.py`
- `src/nodes/architecture_diff_node.py`
- `src/nodes/adr_generator_node.py`

**Changes**:
- Replace `from openai import AsyncOpenAI` with `from langchain_openai import ChatOpenAI`
- Replace `llm: AsyncOpenAI` with `llm: ChatOpenAI`
- Remove `set_llm()` function (LLM is now globally configured)
- Import LLM from `src.config` instead of using global variable

**New Implementation Pattern**:
```python
from src.state import ADRWorkflowState
from src.agents.terraform_analyzer import TerraformAnalyzer
from src.config import llm

async def terraform_analyzer_minor_node(state: ADRWorkflowState) -> ADRWorkflowState:
    """LangGraph node: Analyze Terraform file for microservices patterns (minor version)."""

    analyzer = TerraformAnalyzer(
        llm=llm,
        knowledge_base=state["knowledge_base"]
    )

    result = await analyzer.analyze(
        terraform_code=state["terraform_minor"],
        context=state["architectural_context"],
        project_structure=state.get("project_structure", "")
    )

    state["terraform_analysis_minor"] = result["analysis"]
    return state
```

### 4. Workflow Refactoring

**File**: `src/workflow.py`

**Changes**:
- Import LLM from `src.config`
- Initialize LLM before creating workflow
- No changes to workflow structure

**New Implementation**:
```python
from typing import Dict, Any
from langgraph.graph import StateGraph, END
from langgraph.checkpoint.memory import MemorySaver

from src.state import ADRWorkflowState
from src.config import initialize_llm
from src.nodes.context_generator_node import context_generator_node
from src.nodes.terraform_analyzer_node import terraform_analyzer_minor_node, terraform_analyzer_major_node
from src.nodes.source_code_analyzer_node import source_code_analyzer_minor_node, source_code_analyzer_major_node
from src.nodes.architecture_diff_node import architecture_diff_node
from src.nodes.adr_generator_node import adr_generator_node

def create_workflow() -> StateGraph:
    """Create and compile a LangGraph workflow."""
    
    # Initialize LLM
    initialize_llm()
    
    # Create workflow graph
    workflow = StateGraph(ADRWorkflowState)
    
    # Add nodes
    workflow.add_node("context_generator", context_generator_node)
    workflow.add_node("terraform_analyzer_minor", terraform_analyzer_minor_node)
    workflow.add_node("terraform_analyzer_major", terraform_analyzer_major_node)
    workflow.add_node("source_code_analyzer_minor", source_code_analyzer_minor_node)
    workflow.add_node("source_code_analyzer_major", source_code_analyzer_major_node)
    workflow.add_node("architecture_diff", architecture_diff_node)
    workflow.add_node("adr_generator", adr_generator_node)
    
    # Define edges (workflow)
    workflow.set_entry_point("context_generator")
    
    # After context, run both Terraform analyzers in parallel
    workflow.add_edge("context_generator", "terraform_analyzer_minor")
    workflow.add_edge("context_generator", "terraform_analyzer_major")
    
    # After Terraform analysis, validate with source code (parallel)
    workflow.add_edge("terraform_analyzer_minor", "source_code_analyzer_minor")
    workflow.add_edge("terraform_analyzer_major", "source_code_analyzer_major")
    
    # After validation, compare results (sequential - wait for both to complete)
    workflow.add_edge("source_code_analyzer_minor", "architecture_diff")
    workflow.add_edge("source_code_analyzer_major", "architecture_diff")
    
    # Generate ADRs from comparison
    workflow.add_edge("architecture_diff", "adr_generator")
    
    # End workflow
    workflow.add_edge("adr_generator", END)
    
    # Compile with checkpoint support
    app = workflow.compile(checkpointer=MemorySaver())
    
    return app
```

## Dependencies

### New Dependencies
Add to `requirements.txt`:
```
langchain>=0.1.0
langchain-openai>=0.0.5
langchain-core>=0.1.0
pydantic-settings>=2.0.0
python-dotenv>=1.0.0
```

### Removed Dependencies
- `openai` (replaced by `langchain-openai`)

## Benefits of This Refactoring

1. **Easy Provider Switching**: Can switch between OpenAI, Anthropic, Cohere, etc. by changing one line
2. **Better Prompt Management**: LangChain's prompt templates provide better structure and reusability
3. **Centralized Configuration**: All LLM settings in one place
4. **Improved Testing**: Easier to mock LLM for unit tests
5. **Better Observability**: LangChain provides built-in tracing and logging
6. **Future-Proof**: LangChain ecosystem continues to grow with new features

## Migration Steps

1. Create `src/config.py` with LLM configuration
2. Update `requirements.txt` with new dependencies
3. Refactor each agent to use LangChain
4. Refactor each node to import from config
5. Update `src/workflow.py` to initialize LLM
6. Test all agents and nodes
7. Verify workflow execution

## Future Enhancements

1. Add support for multiple LLM providers (Anthropic, Cohere, etc.)
2. Implement LangChain's tracing and observability
3. Add LangChain's memory capabilities for conversation history
4. Implement LangChain's tools for function calling
5. Add LangChain's retrieval capabilities for RAG implementation
