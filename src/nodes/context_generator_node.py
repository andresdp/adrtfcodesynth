from state import ADRWorkflowState
from agents.context_generator import ContextGenerator
from config import get_project_config, get_llm_config

from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

import logging

logger = logging.getLogger(__name__)


def _theoretical_architecture_context_prompt() -> str:
    return """
    Generate a detailed theoretical introduction to software architecture, monolithic architecture, and microservices architecture. Format as Markdown."
    """

def _generate_theoretical_context() -> str:
    return """
# Theoretical Introduction to Software Architecture, Monolithic Architecture, and Microservices Architecture

## 1. Software Architecture

### Definition
Software architecture refers to the fundamental structures of a software system and the discipline of creating such structures and systems. It involves the high-level structuring of software components, their relationships, and the principles and guidelines governing their design and evolution over time.

### Purpose and Importance
- **Blueprint for Development:** Acts as a blueprint guiding the design and implementation of the system.
- **Communication Tool:** Facilitates communication among stakeholders including developers, architects, business analysts, and customers.
- **Quality Attributes:** Helps achieve critical system qualities such as scalability, maintainability, performance, security, and reliability.
- **Risk Management:** Identifies and mitigates technical risks early in the development lifecycle.
- **Decision Making:** Provides a framework for making informed design decisions and trade-offs.

### Key Concepts
- **Components:** Modular parts of the system with well-defined interfaces.
- **Connectors:** Communication mechanisms between components.
- **Configurations:** The arrangement or topology of components and connectors.
- **Views and Viewpoints:** Different perspectives (e.g., logical, physical, development, process) to address stakeholder concerns.

### Architectural Styles and Patterns
Common architectural styles include layered architecture, client-server, event-driven, service-oriented, microservices, and monolithic architectures. Patterns such as MVC (Model-View-Controller), repository, and broker are often applied within these styles.

---

## 2. Monolithic Architecture

### Definition
Monolithic architecture is a traditional software design approach where all components of an application are integrated into a single, unified codebase and deployed as a single executable or process.

### Characteristics
- **Single Codebase:** All functionality—UI, business logic, data access—is contained within one codebase.
- **Tight Coupling:** Components are often tightly coupled, sharing memory and resources.
- **Unified Deployment:** The entire application is built, tested, and deployed as a single unit.
- **Shared Database:** Typically uses a single database schema for all modules.

### Advantages
- **Simplicity:** Easier to develop initially due to a unified codebase.
- **Performance:** In-process calls between components are faster than inter-process communication.
- **Testing:** End-to-end testing can be straightforward since the entire system is in one place.
- **Deployment:** Single deployment artifact simplifies release management.

### Disadvantages
- **Scalability Limitations:** Difficult to scale parts of the application independently.
- **Maintainability Challenges:** As the codebase grows, it becomes harder to understand, modify, and extend.
- **Technology Lock-in:** Difficult to adopt new technologies incrementally.
- **Reliability Risks:** A bug in one part can potentially crash the entire application.
- **Slow Development Cycles:** Large codebases can slow down build, test, and deployment processes.

### Use Cases
Monolithic architectures are often suitable for small to medium-sized applications, startups, or projects with limited complexity and scale requirements.

---

## 3. Microservices Architecture

### Definition
Microservices architecture is an architectural style that structures an application as a collection of loosely coupled, independently deployable services. Each service encapsulates a specific business capability and communicates with others through lightweight protocols, typically HTTP/REST or messaging.

### Characteristics
- **Service Independence:** Each microservice is developed, deployed, and scaled independently.
- **Decentralized Data Management:** Each service manages its own database or data storage.
- **Technology Diversity:** Teams can choose different technologies and frameworks per service.
- **Inter-service Communication:** Services interact via APIs or messaging systems.
- **Automated Deployment:** Continuous integration and continuous deployment (CI/CD) pipelines are essential.

### Advantages
- **Scalability:** Services can be scaled independently based on demand.
- **Resilience:** Failure in one service does not necessarily impact others.
- **Flexibility:** Enables use of diverse technologies and faster adoption of new tools.
- **Faster Development:** Smaller codebases per service allow teams to develop and deploy features rapidly.
- **Organizational Alignment:** Teams can be aligned around business capabilities, improving ownership and accountability.

### Disadvantages
- **Complexity:** Increased operational complexity due to distributed nature.
- **Data Consistency:** Managing transactions and consistency across services is challenging.
- **Network Latency:** Inter-service communication introduces latency and potential points of failure.
- **Testing Complexity:** End-to-end testing requires coordination across multiple services.
- **Deployment Overhead:** Requires sophisticated infrastructure for service discovery, load balancing, monitoring, and fault tolerance.

### Use Cases
Microservices are well-suited for large, complex, and evolving applications requiring high scalability, agility, and continuous delivery. They are commonly adopted by enterprises and organizations with mature DevOps practices.

---

# Summary

| Aspect               | Monolithic Architecture                          | Microservices Architecture                      |
|----------------------|-------------------------------------------------|------------------------------------------------|
| **Structure**        | Single unified codebase                          | Multiple independent services                   |
| **Deployment**       | Single deployment unit                           | Independent deployment per service              |
| **Scalability**      | Scale entire application                         | Scale services independently                     |
| **Technology Stack** | Usually homogeneous                             | Polyglot (multiple technologies)                |
| **Complexity**       | Lower initial complexity                         | Higher operational and architectural complexity|
| **Fault Isolation**  | Poor (single point of failure)                   | Better fault isolation                           |
| **Data Management**  | Shared database                                  | Decentralized databases                          |
| **Development Speed**| Slower as application grows                      | Faster with smaller, focused teams               |

Understanding these architectural paradigms is crucial for designing software systems that meet business goals, technical requirements, and operational constraints effectively. The choice between monolithic and microservices architectures depends on factors such as application complexity, team size, scalability needs, and organizational maturity.
"""


async def context_generator_node(state: ADRWorkflowState, llm = None, reuse_context = True, include_knowledge = True) -> ADRWorkflowState:
    """LangGraph node: Generate architectural context and extract project structure."""

    logger.info(f"STEP: context_generator_node")

    llm = llm or get_llm_config().llm
    
    # Generate architectural context only if not reusing existing context
    if not include_knowledge:
        state["architectural_context"] = ""
    elif reuse_context:
        state["architectural_context"] = _generate_theoretical_context()
    else:   
        # Generate architectural context using LangChain
        context_prompt = ChatPromptTemplate.from_messages([
            ("system", "You are an expert software architect. Generate comprehensive theoretical context about software architecture, monolithic architecture, and microservices architecture."),
            ("user", _theoretical_architecture_context_prompt())
        ])

        context_chain = context_prompt | llm | StrOutputParser()
    
        architectural_context = await context_chain.ainvoke({})
        state["architectural_context"] = architectural_context

    # Get project configuration for context generation settings
    project_config = get_project_config()
    context_gen_config = project_config.get("context_generation", {})
    
    # Extract context generation settings with defaults
    max_files = context_gen_config.get("max_files", 10)
    max_file_size = context_gen_config.get("max_file_size", 5000)
    summarize_large_files = context_gen_config.get("summarize_large_files", True)

    # Extract project structure and source code using ContextGenerator agent
    context_gen = ContextGenerator(llm=llm, summarize_large_files=summarize_large_files)
    project_context = await context_gen.generate_context(
        state["source_code_zip"],
        max_files=max_files,
        max_file_size=max_file_size
    )
    
    # Store extracted context in workflow state for all downstream agents
    state["project_structure"] = project_context["project_structure"]
    state["source_code"] = project_context["source_code"]
    state["source_code_dict"] = project_context["source_code_dict"]
    state["extraction_metadata"] = project_context["metadata"]

    path_knowledge_base = state['knowledge_base']
    state['knowledge_base'] = "../" +  path_knowledge_base if not path_knowledge_base.startswith("../") else path_knowledge_base

    return state
