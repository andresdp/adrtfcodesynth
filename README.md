# ADR Code Synth

A Python-based system that uses LangGraph for workflow orchestration to analyze Infrastructure as Code (IaC) configurations and generate Architecture Decision Records (ADRs). The system uses a multi-agent architecture with specialized agents for different analysis tasks, powered by multiple LLM providers (OpenAI, Groq, Gemini).

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Configuration](#configuration)
- [LLM Providers](#llm-providers)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Workflow](#workflow)

## Features

- **Multi-Agent Architecture**: Specialized agents for different analysis tasks
- **LangGraph Orchestration**: Graph-based workflow management with parallel execution
- **Multiple LLM Providers**: Support for OpenAI GPT, Groq, and Google Gemini
- **Flexible Configuration**: YAML-based project configuration
- **Source Code Analysis**: Separate analysis for minor and major branches
- **Terraform Analysis**: Infrastructure as Code pattern analysis
- **ADR Generation**: Automated Architecture Decision Record generation

## Architecture

The system uses a multi-agent architecture built on LangGraph:

```
Input Layer (Config, Terraform, Source Code, Knowledge Base)
    ↓
Workflow (ADRWorkflow)
    ├── Create Context
    ├── Analyze Terraform Minor/Major (optional, parallel)
    ├── Analyze Source Code Minor/Major (parallel)
    ├── Architecture Diff
    └── Generate ADRs
    ↓
Output (ADR Files)
```

## Installation

### Prerequisites

- Python 3.11+
- pip package manager

### Setup

1. Clone the repository:
```bash
git clone https://github.com/andresdp/adrtfcodesynth.git
cd adrtfcodesynth
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Configure environment variables:
```bash
cp .env.example .env
# Edit .env with your API keys
```

## Configuration

### Environment Variables

Create a `.env` file from template:

```bash
cp .env.example .env
```

Key environment variables:

- `LLM_PROVIDER`: Choose "openai", "groq", or "gemini" (default: openai)
- `OPENAI_API_KEY`: Your OpenAI API key
- `GROQ_API_KEY`: Your Groq API key
- `GOOGLE_API_KEY`: Your Google API key
- `TEMPERATURE`: LLM temperature parameter (default: 0.1)
- `MAX_TOKENS`: Maximum tokens in response (default: model-specific)

### Project Configuration

Each project has its own `project-config.yaml`:

```yaml
project_name: "my-project"
terraform_minor: "cloud_evolucion_menor.tf"
terraform_major: "cloud_evolucion_mayor.tf"
source_code_zip: "app.zip"
knowledge_base: "knowledge/IAC.txt"

llm:
  provider: "openai"  # Override global provider
  model: "gpt-4o"
  temperature: 0.3
  max_tokens: 2000

context_generation:
  max_files: 10
  max_file_size: 5000
```

## LLM Providers

The system supports multiple LLM providers through a factory pattern, making it easy to switch between providers.

### OpenAI

**Setup:**
1. Get API key: https://platform.openai.com/api-keys
2. Set environment variables:
```bash
LLM_PROVIDER=openai
OPENAI_API_KEY=sk-your-key-here
OPENAI_MODEL=gpt-4o
```

**Available Models:**
- `gpt-4o` - Most capable, latest model
- `gpt-4.1-mini` - Fast, cost-effective (default)
- `gpt-4.1-preview` - Balanced performance

**Pros:**
- Highest quality outputs
- Best for complex analysis
- Well-documented

**Cons:**
- Slower inference
- Higher cost
- Rate limits

### Groq

**Setup:**
1. Get API key: https://console.groq.com/keys
2. Set environment variables:
```bash
LLM_PROVIDER=groq
GROQ_API_KEY=gsk-your-key-here
GROQ_MODEL=llama3-70b-8192
```

**Available Models:**
- `llama3-70b-8192` - Best quality, ~100 tokens/sec (default)
- `mixtral-8x7b-32768` - Good quality, ~150 tokens/sec
- `gemma-7b-it` - Lightweight, ~200 tokens/sec

**Pros:**
- Extremely fast inference
- Very cost-effective
- High throughput
- Good quality for most tasks

**Cons:**
- Slightly lower quality than GPT-4
- Fewer model options

### Gemini

**Setup:**
1. Get API key: https://console.cloud.google.com/apis/credentials
2. Set environment variables:
```bash
LLM_PROVIDER=gemini
GOOGLE_API_KEY=AIza-your-key-here
GEMINI_MODEL=gemini-1.5-pro
```

**Available Models:**
- `gemini-1.5-pro` - Best quality, 128K context window (default)
- `gemini-1.5-flash` - Faster, 1M context window (recommended for large files)

**Pros:**
- Large context windows (128K-1M tokens)
- Fast inference
- Good for large codebases
- Cost-effective

**Cons:**
- Slightly lower quality than GPT-4
- Requires Google Cloud account

### Switching Providers

**Via Environment Variables:**
```bash
# Switch from OpenAI to Groq
export LLM_PROVIDER=groq
export GROQ_API_KEY=gsk-...

# Switch to Gemini
export LLM_PROVIDER=gemini
export GOOGLE_API_KEY=AIza-...
```

**Via Project Config:**
```yaml
# project-inputs/my-project/project-config.yaml
llm:
  provider: "groq"  # or "gemini"
  model: "llama3-70b-8192"
```

### Provider Comparison

| Aspect | OpenAI GPT-4o | Groq Llama3-70b | Gemini 1.5-pro |
|--------|---------------|-----------------|----------------|
| Quality | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Speed | ~30-40 tokens/sec | ~100 tokens/sec | ~50-60 tokens/sec |
| Cost | $5-15/1M tokens | $0.59/1M tokens | $3.5/1M tokens |
| Context | 128K tokens | 8K tokens | 128K tokens |
| Best For | Complex analysis | Fast iteration | Large codebases |

**Recommendation:**
- Use **OpenAI** for: Final production runs, complex analysis
- Use **Groq** for: Development, testing, rapid iteration
- Use **Gemini** for: Large codebases, large context windows

## Usage

### Basic Usage

```python
from workflow import ADRWorkflow

# Create workflow
workflow = ADRWorkflow(project_dir="project-inputs/chef")

# Create workflow graph
initial_state = workflow.create(
    include_terraform=True,
    include_knowledge=True
)

# Run workflow
result = await workflow.run(initial_state)

# Access generated ADRs
for filename, content in result["adr_files"].items():
    print(f"{filename}: {len(content)} chars")
```

### Using Different LLM Providers

```python
from config import Settings, LLMFactory, initialize_llm

# Using OpenAI
settings = Settings(llm_provider="openai", openai_api_key="sk-...")
llm = initialize_llm(settings)

# Using Groq
settings = Settings(llm_provider="groq", groq_api_key="gsk-...")
llm = initialize_llm(settings)

# Using Gemini
settings = Settings(llm_provider="gemini", google_api_key="AIza-...")
llm = initialize_llm(settings)

# Or let environment variables handle it
llm = initialize_llm()  # Uses LLM_PROVIDER env var
```

**Direct LLM instantiation:**

```python
from langchain_openai import ChatOpenAI
from langchain_groq import ChatGroq
from langchain_google_genai import ChatGoogleGenerativeAI
from workflow import ADRWorkflow

# OpenAI
openai_llm = ChatOpenAI(api_key="sk-...", model="gpt-4o")
workflow = ADRWorkflow(project_dir="project-inputs/chef", llm=openai_llm)

# Groq
groq_llm = ChatGroq(api_key="gsk-...", model="llama3-70b-8192")
workflow = ADRWorkflow(project_dir="project-inputs/chef", llm=groq_llm)

# Gemini
gemini_llm = ChatGoogleGenerativeAI(api_key="AIza-...", model="gemini-1.5-pro")
workflow = ADRWorkflow(project_dir="project-inputs/chef", llm=gemini_llm)
```

### Interactive Usage with Jupyter

Open `src/main_workflow.ipynb` for step-by-step workflow demonstration and testing.

## Project Structure

```
adrtfcodesynth/
├── src/                        # Main source code
│   ├── config.py              # Configuration management
│   ├── state.py               # Workflow state definitions
│   ├── workflow.py            # Main workflow orchestration
│   ├── agents/                # LLM agents
│   │   ├── context_generator.py
│   │   ├── terraform_analyzer.py
│   │   ├── source_code_analyzer.py
│   │   ├── source_code_extractor.py
│   │   ├── architecture_diff.py
│   │   └── adr_generator.py
│   └── nodes/                 # LangGraph nodes
│       ├── context_generator_node.py
│       ├── terraform_analyzer_node.py
│       ├── source_code_analyzer_node.py
│       ├── architecture_diff_node.py
│       └── adr_generator_node.py
├── project-inputs/            # Input data for projects
│   ├── project-config.yaml   # Global configuration
│   └── [project-name]/        # Individual projects
│       ├── project-config.yaml
│       ├── *_cloud_evolucion_menor.tf
│       ├── *_cloud_evolucion_mayor.tf
│       └── *_app.zip
├── knowledge/                 # Knowledge base files
│   ├── IAC.txt               # English rules
│   └── IAC-spa.txt           # Spanish rules
├── output-adrs/               # Generated ADR outputs
├── requirements.txt           # Python dependencies
└── .env.example              # Environment template
```

## Workflow

### Workflow Steps

1. **Create Context**: Generate architectural context
2. **Analyze Terraform Minor/Major**: Analyze IaC for microservices patterns (parallel)
3. **Analyze Source Code Minor/Major**: Validate with actual source code (parallel)
4. **Architecture Diff**: Compare minor and major analyses
5. **Generate ADRs**: Create Architecture Decision Records

### Parallel Execution

The workflow leverages LangGraph's parallel execution:
- Terraform analysis nodes run in parallel
- Source code analysis nodes run in parallel
- Architecture diff waits for both analyses
- ADR generation is sequential

### Source Code Branches

Each analysis can have separate source code:
- Minor branch: `source_code_zip_minor` in project config
- Major branch: `source_code_zip_major` in project config
- Either branch can be absent (fallback to Terraform-only analysis)

## Development

### Adding New LLM Providers

1. Add provider to `LLMProviderType` enum in `src/config.py`
2. Create factory method in `LLMFactory` class
3. Add environment variables to `.env.example`
4. Install provider package (e.g., `langchain-google-genai`)
5. Update documentation

Example for Anthropic Claude:

```python
# src/config.py
from langchain_anthropic import ChatAnthropic

class LLMProviderType(str, Enum):
    OPENAI = "openai"
    GROQ = "groq"
    GEMINI = "gemini"
    ANTHROPIC = "anthropic"  # New

class LLMFactory:
    @staticmethod
    def create_anthropic_llm(**kwargs) -> ChatAnthropic:
        return ChatAnthropic(
            api_key=kwargs.get("anthropic_api_key"),
            model=kwargs.get("anthropic_model"),
            temperature=kwargs.get("temperature"),
            max_tokens=kwargs.get("max_tokens")
        )
```

## License

[Add your license here]

## Contributing

[Add contribution guidelines]