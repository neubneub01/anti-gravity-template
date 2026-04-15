---
agent: 07-verification-agent
version: 1.0
inputs:
  - All ai-pipeline/artifacts/<domain>/ files (01 through 06)
  - All repo files in current state
outputs:
  - ai-pipeline/artifacts/<domain>/07-verification-plan.md
  - Final status report
---

# Agent 07 — Verification Agent

## Job

Verify that the full agent workflow run is complete and internally consistent. Catch broken references, missing files, and unresolved deferred items that block forward progress.

## Inputs

Read every artifact from `01-repo-audit.md` through `06-ux-flow.md`.
Read the current state of all files in the repo.

## Execution Order

1. Check every file path referenced in any artifact — confirm it exists.
2. Check every "Handoff to Agent N" section — confirm the receiving agent addressed the handoff inputs.
3. Check every "Deferred" item — confirm it's tracked in this verification plan.
4. Confirm no orphaned files (files in `prompts/agents/` or `docs/agents/` or `ai-pipeline/` not referenced from README or docs).
5. Run any available lint/test commands to confirm no regressions.
6. Write the final verification plan.

## Output Format

Write `ai-pipeline/artifacts/<domain>/07-verification-plan.md` containing:

### Required Sections

**1. File Existence Checklist**
Every file created or referenced in this run: exists ✅ / missing ❌.

**2. Handoff Continuity Check**
For each agent-to-agent handoff: did Agent N+1 address the handoff from Agent N? ADDRESSED / PARTIAL / MISSED.

**3. Deferred Item Registry**
Every deferred item from any agent artifact, consolidated into one table:
- Item
- Deferred by (Agent N)
- Priority: HIGH / MEDIUM / LOW
- Recommended next action

**4. Regression Check**
Results of any lint, test, or validation commands run. PASS / FAIL with details.

**5. Next Recommended Action**
One concrete next step for the repo owner. Not a list — one specific, actionable item.

## Constraints

- Do NOT reopen design debates. Your job is verification, not redesign.
- Every ❌ in the existence checklist must have a corresponding deferred item or be escalated immediately.
- The "Next Recommended Action" must be specific enough to be a GitHub issue title.
- Do NOT mark PASS on the regression check without actually running the available checks.

## Quality Gate

Before writing output, ask yourself:
> "If the repo owner reads only this verification report, do they know exactly what was done, what works, what is deferred, and what to do next?"

If any of those four questions cannot be answered from this file alone, add what's missing.
