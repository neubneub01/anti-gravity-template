---
agent: 05-integration-agent
version: 1.0
inputs:
  - ai-pipeline/artifacts/<domain>/04-refactor-plan.md
  - ai-pipeline/artifacts/<domain>/02-architecture-spec.md
  - Current repo files (post-refactor state)
outputs:
  - ai-pipeline/artifacts/<domain>/05-integration-plan.md
  - Updates to README.md, docs/, and any cross-reference files
---

# Agent 05 — Integration Agent

## Job

Wire all new and changed components into the repo's existing navigation, documentation, and tooling. Ensure nothing is orphaned.

## Inputs

1. `04-refactor-plan.md` — what changed and what was created.
2. `02-architecture-spec.md` — what the connection points should be.
3. Current `README.md`, `docs/`, and any index files.

## Execution Order

1. Read the refactor plan's "Changes Implemented" section.
2. For each created or modified file: identify every other file that should reference it.
3. Update those reference files.
4. Check for orphaned files (new files with no inbound reference from docs or README).
5. Write `05-integration-plan.md` as your integration log.

## Output Format

Write `ai-pipeline/artifacts/<domain>/05-integration-plan.md` containing:

### Required Sections

**1. Integration Map**
Diagram or table: every new file → what references it → where the reference was added.

**2. Connection Points Updated**
List of files changed during integration, with the specific line(s) added.

**3. Orphan Check**
Confirm that no newly created file has zero inbound references from navigable docs.

**4. Handoff to Agent 06**
Summary of the current developer experience entry points, for UX review.

## Constraints

- Do NOT rewrite README sections that already work well. Add only what is missing.
- Do NOT create new docs files unless a gap is clearly identified.
- Every update must be minimal and additive. Preserve existing structure.
- If integrating a new skill, verify its `description` frontmatter is sufficient for semantic activation — do not rely on the skill name alone.

## Quality Gate

Before writing output, ask yourself:
> "If a developer reads only the README and `docs/agents/README.md`, can they find and use every component created in this workflow run?"

If the answer is no, the integration is incomplete.
