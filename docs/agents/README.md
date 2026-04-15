# Agent Workflow System — anti-gravity-template

This directory documents the **repo-native agent workflow** for analyzing, refactoring, and verifying projects that use this template.

## What This System Is

A sequential chain of seven AI agent prompts, each with defined inputs, outputs, and handoff contracts. Run it whenever you want to:
- Audit a project's AI configuration health
- Design architectural improvements
- Validate data contracts across skills and rules
- Implement targeted refactors
- Verify the full system is consistent

## Files in This Directory

| File | Purpose |
|---|---|
| `README.md` | This file — system overview |
| `execution-order.md` | Sequence, dependencies, and timing |
| `runbook.md` | Operator guide for running the chain |

## Prompt Chain Location

Prompts live in [`prompts/agents/`](../../prompts/agents/):

| Prompt | Agent | Role |
|---|---|---|
| `01-repo-auditor.md` | Repo Auditor | Inspects structure, finds fragmentation |
| `02-architecture-designer.md` | Architecture Designer | Designs target architecture |
| `03-data-contract-agent.md` | Data Contract Agent | Defines and validates file schemas |
| `04-refactor-engineer.md` | Refactor Engineer | Implements targeted changes |
| `05-integration-agent.md` | Integration Agent | Wires changes into docs and navigation |
| `06-ux-flow-agent.md` | UX Flow Agent | Validates developer experience |
| `07-verification-agent.md` | Verification Agent | Final consistency check |

## Artifact Output Location

Each run writes outputs to:

```
ai-pipeline/artifacts/<domain-or-run-name>/
  01-repo-audit.md
  02-architecture-spec.md
  03-contracts.md
  04-refactor-plan.md
  05-integration-plan.md
  06-ux-flow.md
  07-verification-plan.md
```

The reference run for this template is in [`ai-pipeline/artifacts/template-workflow/`](../../ai-pipeline/artifacts/template-workflow/).

## Quick Start

See [`runbook.md`](./runbook.md) for step-by-step operator instructions.

## Reusability

This system is designed to be **run on any project** that uses this template, not just the template repo itself. When using on a consumer project:

1. Copy or reference `prompts/agents/` into your project.
2. Create `ai-pipeline/artifacts/<your-project-domain>/` as your output directory.
3. Follow the execution order in `execution-order.md`.

See [`runbook.md`](./runbook.md) for adaptation guidance.
