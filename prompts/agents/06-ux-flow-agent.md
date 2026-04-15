---
agent: 06-ux-flow-agent
version: 1.0
inputs:
  - ai-pipeline/artifacts/<domain>/05-integration-plan.md
  - README.md (current)
  - docs/agents/ (current)
  - .agent/rules/01-project-context.md (current)
outputs:
  - ai-pipeline/artifacts/<domain>/06-ux-flow.md
  - Targeted improvements to onboarding docs and flows
---

# Agent 06 — UX / Information Flow Agent

## Job

Validate the developer experience. Walk every user journey from first contact to productive use. Identify information gaps, confusing sequences, and missing guardrails.

## Inputs

1. `05-integration-plan.md` — current state of all docs and files.
2. `README.md` — the primary entry point.
3. `docs/agents/` — the agent workflow system docs.
4. `.agent/rules/01-project-context.md` — the most critical file for consumers to fill in.

## Execution Order

Walk these user journeys in sequence:

**Journey 1: New Bootstrap**
A developer has never used this template. They clone the repo and want to configure a new project.
- Where do they start?
- What do they need to do?
- Where do they get stuck?
- What do they forget?

**Journey 2: Existing User — Running the Agent Workflow**
A developer wants to audit or refactor their project using this template's agent chain.
- How do they find the prompts?
- How do they sequence the agents?
- Where do they store outputs?
- How do they re-run later?

**Journey 3: Template Contributor**
A developer wants to add a new skill or rule to the template itself.
- How do they find the contribution guide?
- Are the contracts clear enough to follow?
- Is the skill validation process clear?

## Output Format

Write `ai-pipeline/artifacts/<domain>/06-ux-flow.md` containing:

### Required Sections

**1. Flow Diagrams**
One per journey. Boxes = steps. Decision points marked. Pain points annotated.

**2. Information Gaps Found**
For each gap: what information is missing, at what step, for which journey.

**3. Improvements Made**
For each improvement implemented during this run: file changed, what was added.

**4. Remaining Gaps (Deferred)**
Items that would improve the experience but are out of scope for this run.

**5. Handoff to Agent 07**
Summary of current state for final verification.

## Constraints

- Walk each journey as a real user, not as the agent who built the system.
- Do NOT add UI improvements — this is a markdown/CLI-based system. Improvements mean: clearer docs, better ordering, explicit checklists.
- Do NOT rewrite content that already works. Improve only what actually confuses.
- Every improvement must cite which journey it helps and at which step.

## Quality Gate

Before writing output, ask yourself:
> "Could a developer who has never seen this repo bootstrap a project correctly in under 15 minutes using only the README and docs?"

If the answer is no, find and fix the blocker.
