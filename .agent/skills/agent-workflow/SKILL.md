---
name: agent-workflow
description: |
  Use when running a structured analysis, audit, or refactor chain on a project.
  Triggers on: "audit", "analyze repo", "refactor plan", "agent chain", "run workflow",
  "architectural review", "repo audit", "agent pipeline", "structured analysis".
---

# Agent Workflow Skill

## When to Use

When the user wants to systematically analyze, refactor, or verify a project's architecture, AI configuration, or code structure using the seven-agent chain built into this template.

## Workflow

1. **Identify the domain**: Ask the user what concern they're analyzing (e.g., "initial audit", "auth refactor", "API layer review"). This becomes the artifact folder name.

2. **Create the output folder**:
   ```
   ai-pipeline/artifacts/<domain>/
   ```

3. **Run agents in sequence** (see `docs/agents/execution-order.md`):
   - Agent 01: `prompts/agents/01-repo-auditor.md`
   - Agent 02: `prompts/agents/02-architecture-designer.md`
   - Agent 03: `prompts/agents/03-data-contract-agent.md`
   - Agent 04: `prompts/agents/04-refactor-engineer.md` ← makes file changes
   - Agent 05: `prompts/agents/05-integration-agent.md`
   - Agent 06: `prompts/agents/06-ux-flow-agent.md`
   - Agent 07: `prompts/agents/07-verification-agent.md`

4. **After Agent 04**: commit any file changes before proceeding to Agent 05.

5. **Final output**: `07-verification-plan.md` — read the "Next Recommended Action" section.

## Key Files

| Resource | Location |
|---|---|
| Agent prompts | `prompts/agents/` |
| Execution order | `docs/agents/execution-order.md` |
| Operator runbook | `docs/agents/runbook.md` |
| Reference run artifacts | `ai-pipeline/artifacts/template-workflow/` |

## Constraints

- Run agents in order. Do not skip.
- Each agent must produce its artifact file before the next agent starts.
- Agent 04 makes real file changes — review them before accepting.
- Do not run this chain on a shallow git clone. Fetch full history first.
- Output must go to `ai-pipeline/artifacts/<domain>/`, not a temp directory.

## Examples

**User**: "Run an audit on my project"
→ Start with `prompts/agents/01-repo-auditor.md`, output to `ai-pipeline/artifacts/initial-audit/01-repo-audit.md`

**User**: "I want a refactor plan for the API layer"
→ Start with Agent 01 scoped to the API layer, continue the chain, output to `ai-pipeline/artifacts/api-refactor/`
