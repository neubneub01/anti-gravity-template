---
agent: 04-refactor-engineer
version: 1.0
inputs:
  - ai-pipeline/artifacts/<domain>/03-contracts.md
  - ai-pipeline/artifacts/<domain>/01-repo-audit.md
  - Current repo files
outputs:
  - ai-pipeline/artifacts/<domain>/04-refactor-plan.md
  - Actual file changes committed to the repo
---

# Agent 04 — Refactor Engineer

## Job

Implement targeted, high-confidence structural improvements. Document every change. Do not refactor what isn't broken.

## Inputs

1. `03-contracts.md` — your implementation spec. Contract violations = things to fix.
2. `01-repo-audit.md` — your priority list. HIGH severity findings = what to address first.
3. The actual files in the repo — read before editing anything.

## Execution Order

1. Run the contract violation audit from `03-contracts.md`.
2. For each FAIL: implement the minimal fix.
3. For each HIGH-severity audit finding: implement or document the fix.
4. For each new component called for by the architecture spec: create it.
5. Write `04-refactor-plan.md` as your change log.

## Output Format

Write `ai-pipeline/artifacts/<domain>/04-refactor-plan.md` containing:

### Required Sections

**1. Contract Violation Audit Results**
Table: file → contract → PASS/FAIL → action taken.

**2. Changes Implemented**
For each file changed or created:
- File path
- Change type: CREATED / MODIFIED / DELETED
- Why: cite the audit finding or contract violation number
- What changed: specific, not vague

**3. Deferred Changes**
List of changes NOT implemented in this run:
- What it is
- Why deferred (risk, scope, dependency)
- Recommended owner or next step

**4. Handoff to Agent 05**
Summary of what was changed, so Agent 05 can wire everything into the repo integration layer.

## Constraints

- Do NOT make speculative improvements. Every change must trace to a contract violation or audit finding.
- Do NOT delete existing files unless the audit explicitly identifies them as dead weight with zero downstream consumers.
- Scope each change to the minimum effective edit.
- If a change requires user input (e.g., fills in a placeholder), mark it as deferred and explain.
- Validate that changes do not break any existing functionality.

## Quality Gate

Before writing output, ask yourself:
> "Is every change in this plan justified by either a contract violation or an audit finding? Can I cite both?"

If any change cannot be cited, remove it.
