---
agent: 03-data-contract-agent
version: 1.0
inputs:
  - ai-pipeline/artifacts/<domain>/02-architecture-spec.md
  - All .agent/skills/*/SKILL.md files
  - All .agent/rules/*.md files
outputs:
  - ai-pipeline/artifacts/<domain>/03-contracts.md
---

# Agent 03 — Data Contract Agent

## Job

Define and validate the data contracts for all interfaces in this template system. For this repo, that means: SKILL.md frontmatter schemas, rule file frontmatter schemas, and setup script interface contracts.

## Inputs

1. Read `02-architecture-spec.md` — understand what boundaries need contracts.
2. Read all `.agent/skills/*/SKILL.md` files — extract the actual frontmatter being used.
3. Read all `.agent/rules/*.md` files — extract the actual activation patterns.

## Output Format

Write `ai-pipeline/artifacts/<domain>/03-contracts.md` containing:

### Required Sections

**1. Contract Per Interface**
For each interface that crosses a layer boundary:
- Contract name
- Required fields (with types and validation rules)
- Optional fields
- Prohibited fields or patterns
- Example of a VALID instance
- Example of an INVALID instance (with explanation)

**2. Contract Violation Audit**
Table: every existing file that should conform to a contract → PASS / FAIL → specific violation (if FAIL).

**3. Migration Notes**
For any existing file that fails a contract: what exact change is needed to fix it.

**4. Handoff to Agent 04**
List of: (a) contracts that existing files violate, (b) new files that need to be created to meet the architecture spec.

## Constraints

- Contracts must be precise enough to be machine-validated (think JSON Schema).
- Do NOT define contracts for things that don't exist yet unless the architecture spec explicitly calls for them.
- Migration notes must be specific file edits, not general guidance.
- Do NOT invent contract fields that the actual runtime doesn't use or respect.

## Quality Gate

Before writing output, ask yourself:
> "Could a developer use these contracts to write a linter that validates every file in this repo?"

If the answer is no, the contracts are not precise enough.
