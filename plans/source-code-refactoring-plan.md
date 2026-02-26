# Source Code Refactoring Plan

## Executive Summary

This document outlines the refactoring plan to separate source code extraction from context creation and support separate minor and major source code branches in the ADR CodeSynth workflow.

## Objectives

1. **Remove source code analysis from context creation**: The `context_generator_node` should only generate theoretical context, not extract source code
2. **Support separate source code branches**: Allow projects to have separate minor and major source code branches
3. **Handle missing branches gracefully**: Skip source code validation for missing branches and use Terraform-only analysis with appropriate warnings
4. **No backward compatibility**: Clean break from old single-ZIP structure

## Current Architecture Issues

### Problem 1: Context Generator Does Too Much
- The `context_generator_node` extracts source code, even though it's only supposed to generate theoretical context
- Source code extraction logic is mixed with context generation

### Problem 2: Single Source Code Branch
- Current configuration only supports one `source_code_zip`
- No way to analyze separate minor and major source code branches

### Problem 3: No Graceful Handling of Missing Branches
- System assumes source code always exists
- Cannot handle projects that only have Terraform without source code

## Proposed Solution Architecture

### New Workflow Flow

```
create_context (theoretical context only)
    ↓
[analyze_terraform_minor, analyze_terraform_major] (parallel)
    ↓
[analyze_source_code_minor, analyze_source_code_major] (parallel)
    Each node:
    - Checks if source code ZIP exists
    - If yes: extracts → analyzes → stores
    - If no: logs warning → uses Terraform-only analysis
    ↓
do_architecture_diff
    ↓
generate_adrs
```

## Detailed Implementation Plan

### 1. Create New Source Code Extractor Agent

**File: `src/agents/source_code_extractor.py`**

Create a dedicated agent for source code extraction by moving extraction logic from `ContextGenerator`:

**Purpose**: Extract project structure and source code from ZIP archives

**Methods**:
- `extract_project_structure(zip_path)` - Analyze directory structure
- `extract_source_code(zip_path, max_files, max_file_size)` - Extract code with optional summarization
- `format_project_structure(structure)` - Format for display

**Features**:
- Supports multiple file types (.py, .ts, .tsx, .js, .java, .php, .xml, .tf)
- Optional file summarization for large files
- Returns structured data with metadata

### 2. Update State Definition

**File: `src/state.py`**

**Remove global source code fields**:
```python
# REMOVE:
source_code: str
source_code_dict: dict
project_structure: str
extraction_metadata: dict
```

**Add version-specific source code fields**:
```python
# ADD:
source_code_zip_minor: Annotated[str, last_value_reducer]
source_code_zip_major: Annotated[str, last_value_reducer]
source_code_minor: Annotated[str, last_value_reducer]
source_code_dict_minor: Annotated[dict, last_value_reducer]
project_structure_minor: Annotated[str, last_value_reducer]
extraction_metadata_minor: Annotated[dict, last_value_reducer]
source_code_major: Annotated[str, last_value_reducer]
source_code_dict_major: Annotated[dict, last_value_reducer]
project_structure_major: Annotated[str, last_value_reducer]
extraction_metadata_major: Annotated[dict, last_value_reducer]
```

### 3. Simplify Context Generator Agent

**File: `src/agents/context_generator.py`**

**Remove extraction methods**:
- `_extract_project_structure()`
- `_extract_source_code()`
- `_summarize_code_file()`
- `_format_project_structure()`
- `_build_file_tree()`
- `_format_tree()`
- `generate_context()` - Remove source code extraction

**Result**: Very lightweight agent that only handles theoretical context generation

**Alternative**: Inline the theoretical context directly in the node

### 4. Update Source Code Analyzer Agent

**File: `src/agents/source_code_analyzer.py`**

**Changes**:
- Import `SourceCodeExtractor`
- Modify `analyze()` method to accept optional `source_code_zip` parameter
- If `source_code_zip` is provided (non-empty string):
  - Call `SourceCodeExtractor` to extract code
  - Perform combined analysis (Terraform + source code)
- If `source_code_zip` is empty or None:
  - Return terraform-only analysis
  - Add metadata indicating source code was not available

**Signature**:
```python
async def analyze(self, 
                  context: str, 
                  previous_analysis: str,
                  source_code_zip: str,  # New parameter
                  version: str,
                  project_config: dict) -> Dict[str, Any]:
```

### 5. Simplify Context Generator Node

**File: `src/nodes/context_generator_node.py`**

**Remove**:
- All source code extraction logic
- Calls to `ContextGenerator.generate_context()`
- State updates for `project_structure`, `source_code`, `source_code_dict`, `extraction_metadata`

**Keep**:
- Theoretical context generation
- State update for `architectural_context`

**Simplified implementation**:
```python
async def context_generator_node(state: ADRWorkflowState, llm = None, 
                                  reuse_context = True, 
                                  include_knowledge = True) -> ADRWorkflowState:
    logger.info("STEP: context_generator_node")
    
    # Generate theoretical context only
    if not include_knowledge:
        state["architectural_context"] = ""
    elif reuse_context:
        state["architectural_context"] = _generate_theoretical_context()
    else:
        # Generate using LLM
        ...
    
    return state
```

### 6. Update Source Code Analyzer Nodes

**File: `src/nodes/source_code_analyzer_node.py`**

Update both `source_code_analyzer_minor_node` and `source_code_analyzer_major_node`:

**For each node**:
```python
async def source_code_analyzer_minor_node(state: ADRWorkflowState, llm = None) -> ADRWorkflowState:
    logger.info("STEP: source_code_analyzer_minor_node")
    
    # Check if source code branch exists
    source_code_zip_minor = state.get("source_code_zip_minor", "")
    
    if source_code_zip_minor:
        # Source code available - extract and analyze
        extractor = SourceCodeExtractor(llm=llm)
        
        # Extract project structure
        structure = extractor.extract_project_structure(source_code_zip_minor)
        project_structure = extractor.format_project_structure(structure)
        
        # Extract source code
        source_code_dict = await extractor.extract_source_code(
            source_code_zip_minor,
            max_files=10,
            max_file_size=5000
        )
        source_code = "\n\n".join([
            f"=== {filepath} ===\n{content}"
            for filepath, content in source_code_dict.items()
        ])
        
        # Store in state
        state["project_structure_minor"] = project_structure
        state["source_code_minor"] = source_code
        state["source_code_dict_minor"] = source_code_dict
        state["extraction_metadata_minor"] = {
            "total_files": len(source_code_dict),
            "branch": "minor"
        }
        
        # Analyze with source code
        analyzer = SourceCodeAnalyzer(llm=llm)
        result = await analyzer.analyze(
            context=state["architectural_context"],
            previous_analysis=state["terraform_analysis_minor"],
            source_code_zip=source_code_zip_minor,
            version="minor",
            project_config={}
        )
        state["improved_analysis_minor"] = result["analysis"]
        
    else:
        # Source code not available - use terraform-only analysis
        logger.warning("Source code branch [minor] not available, using Terraform-only analysis")
        
        # Store empty values
        state["project_structure_minor"] = ""
        state["source_code_minor"] = ""
        state["source_code_dict_minor"] = {}
        state["extraction_metadata_minor"] = {
            "total_files": 0,
            "branch": "minor",
            "note": "Source code not available"
        }
        
        # Use terraform analysis as improved analysis
        state["improved_analysis_minor"] = state.get("terraform_analysis_minor", "")
    
    return state
```

**Warning logic**:
- Log warning when minor branch is missing
- Log warning when major branch is missing
- Log additional warning if both branches are missing

### 7. Update Workflow Initialization

**File: `src/workflow.py`**

In the `create()` method, update initial state building:

```python
def create(self, include_terraform: bool=True, reuse_context: bool=True, 
           include_knowledge: bool=True) -> ADRWorkflowState:
    # ... existing code ...
    
    # Handle source code ZIP files
    source_code_zip_minor = self.project_config.get("source_code_zip_minor", "")
    source_code_zip_major = self.project_config.get("source_code_zip_major", 
                                                      self.project_config.get("source_code_zip", ""))
    
    # If only one ZIP file is provided (old format), treat it as major
    if source_code_zip_major and not source_code_zip_minor:
        logger.info("Single source code ZIP detected, treating as major branch")
        source_code_zip_major = base_dir + source_code_zip_major
    else:
        if source_code_zip_minor:
            source_code_zip_minor = base_dir + source_code_zip_minor
        if source_code_zip_major:
            source_code_zip_major = base_dir + source_code_zip_major
    
    # Build initial state
    self.initial_state = {
        "project_name": self.project_config.get("project_name", "default"),
        "terraform_minor": base_dir + self.project_config.get("terraform_minor", ""),
        "terraform_major": base_dir + self.project_config.get("terraform_major", ""),
        "source_code_zip_minor": source_code_zip_minor,
        "source_code_zip_major": source_code_zip_major,
        "knowledge_base": self.project_config.get("knowledge_base", "knowledge/IAC.txt"),
        "timestamp": datetime.now().isoformat(),
        # ... other fields ...
    }
    
    return self.initial_state
```

### 8. Update Project Configurations

**Files: `project-inputs/*/project-config.yaml`**

For each project (abelaa, chef, serverlessmike):

**Replace**:
```yaml
source_code_zip: "abelaa_app.zip"
```

**With**:
```yaml
# Source code branches (optional)
source_code_zip_minor: ""  # Leave empty if not available
source_code_zip_major: "abelaa_app.zip"  # Treat as major
```

**Alternative for projects with both branches**:
```yaml
source_code_zip_minor: "abelaa_app_minor.zip"
source_code_zip_major: "abelaa_app_major.zip"
```

**Alternative for terraform-only projects**:
```yaml
source_code_zip_minor: ""
source_code_zip_major: ""
```

## State Structure Comparison

### Before Refactoring

```python
class ADRWorkflowState(TypedDict):
    # Single source code branch
    source_code_zip: str
    source_code: str
    source_code_dict: dict
    project_structure: str
    extraction_metadata: dict
    
    # Shared analysis results
    improved_analysis_minor: str
    improved_analysis_major: str
```

### After Refactoring

```python
class ADRWorkflowState(TypedDict):
    # Separate source code branches
    source_code_zip_minor: str
    source_code_zip_major: str
    
    # Minor branch data
    source_code_minor: str
    source_code_dict_minor: dict
    project_structure_minor: str
    extraction_metadata_minor: dict
    
    # Major branch data
    source_code_major: str
    source_code_dict_major: dict
    project_structure_major: str
    extraction_metadata_major: dict
    
    # Shared analysis results
    improved_analysis_minor: str
    improved_analysis_major: str
```

## Risk Assessment

### Low Risk
- Source code extraction logic is being moved, not changed
- Existing projects will work (single ZIP treated as major)
- Workflow graph structure remains the same

### Medium Risk
- State structure changes (but isolated to source code fields)
- Multiple configuration files need updates
- New agent introduces potential for bugs

### Mitigation Strategies
1. Thorough logging to track which branches are being used
2. Clear warnings when source code is missing
3. Test with existing projects to ensure backward compatibility
4. Unit tests for SourceCodeExtractor
5. Integration tests for each workflow path

## Testing Strategy

### Test Case 1: Single ZIP File (Current Projects)
**Setup**:
```yaml
source_code_zip_minor: ""
source_code_zip_major: "abelaa_app.zip"
```

**Expected behavior**:
- Minor analysis: terraform-only (warning logged)
- Major analysis: combined terraform + source code
- Both analyses stored correctly in state

### Test Case 2: Two ZIP Files (Minor and Major)
**Setup**:
```yaml
source_code_zip_minor: "abelaa_app_minor.zip"
source_code_zip_major: "abelaa_app_major.zip"
```

**Expected behavior**:
- Both branches extracted and analyzed
- Both analyses combined with source code
- No warnings logged

### Test Case 3: No Source Code (Terraform Only)
**Setup**:
```yaml
source_code_zip_minor: ""
source_code_zip_major: ""
```

**Expected behavior**:
- Minor analysis: terraform-only (warning logged)
- Major analysis: terraform-only (warning logged)
- Additional warning logged that both branches are missing
- Workflow continues and generates ADRs

### Test Case 4: Only Minor Branch
**Setup**:
```yaml
source_code_zip_minor: "abelaa_app_minor.zip"
source_code_zip_major: ""
```

**Expected behavior**:
- Minor analysis: combined terraform + source code
- Major analysis: terraform-only (warning logged)

## Implementation Checklist

- [ ] Create new `SourceCodeExtractor` agent in `src/agents/source_code_extractor.py`
- [ ] Update `src/state.py` with minor/major source code fields
- [ ] Simplify `ContextGenerator` agent (remove extraction logic)
- [ ] Update `SourceCodeAnalyzer` to use `SourceCodeExtractor`
- [ ] Simplify `context_generator_node` (remove extraction logic)
- [ ] Update `source_code_analyzer_minor_node` with extraction and warning logic
- [ ] Update `source_code_analyzer_major_node` with extraction and warning logic
- [ ] Update `workflow.py` initial state building logic
- [ ] Update `project-inputs/abelaa/project-config.yaml`
- [ ] Update `project-inputs/chef/project-config.yaml`
- [ ] Update `project-inputs/serverlessmike/project-config.yaml`
- [ ] Test with existing single-ZIP projects
- [ ] Test with two-ZIP projects (if available)
- [ ] Test with terraform-only configuration

## Rollback Plan

If issues arise during implementation:

1. Keep old code commented out during transition
2. Use git to easily revert changes
3. Document exact changes for potential rollback
4. Maintain parallel paths during testing phase

## Success Criteria

1. ✅ Context generator no longer extracts source code
2. ✅ Separate minor/major source code branches supported
3. ✅ Missing branches handled gracefully with warnings
4. ✅ Existing projects work with single ZIP treated as major
5. ✅ Terraform-only analysis works when source code is missing
6. ✅ All tests pass
7. ✅ Clear logging of which branches are being used

## Timeline Estimate

- **Phase 1**: Create SourceCodeExtractor agent (2 hours)
- **Phase 2**: Update state and simplify agents (1 hour)
- **Phase 3**: Update nodes with extraction logic (2 hours)
- **Phase 4**: Update workflow and configs (1 hour)
- **Phase 5**: Testing and validation (2 hours)

**Total estimated time**: 8 hours

## Notes

- This refactoring maintains the same workflow graph structure
- No changes to Terraform analysis or ADR generation
- The refactoring is backward compatible for existing projects (single ZIP treated as major)
- Clear warnings will help identify projects that need source code added
- The separation of concerns makes the codebase more maintainable and testable