# Runbook — Agent Workflow Chain

## Purpose

Step-by-step operator guide for running the seven-agent analysis and refactor chain on any project that uses the anti-gravity-template.

---

## Pre-Flight Checklist

Before starting:

- [ ] You know what domain/concern you're analyzing (e.g., `auth-refactor`, `initial-audit`)
- [ ] You've created the output folder: `ai-pipeline/artifacts/<your-domain>/`
- [ ] Your AI tool (Antigravity, Cursor, Claude Code) is open on the target project
- [ ] You have read access to the full repository (not a shallow clone)

---

## Step-by-Step

### Step 1 — Run Agent 01 (Repo Auditor)

1. Open `prompts/agents/01-repo-auditor.md`.
2. Read the **Inputs** section. Confirm the listed files exist.
3. Paste or reference the prompt in your AI tool session.
4. Direct the AI to write output to: `ai-pipeline/artifacts/<your-domain>/01-repo-audit.md`
5. Review the output. The audit should cite specific files — if it's generic, ask the AI to re-read the actual files.

### Step 2 — Run Agent 02 (Architecture Designer)

1. Open `prompts/agents/02-architecture-designer.md`.
2. Provide the AI with `01-repo-audit.md` as context.
3. Direct output to: `ai-pipeline/artifacts/<your-domain>/02-architecture-spec.md`

### Step 3 — Run Agent 03 (Data Contract Agent)

1. Open `prompts/agents/03-data-contract-agent.md`.
2. Provide: `02-architecture-spec.md` + all `.agent/skills/*/SKILL.md` + all `.agent/rules/*.md`.
3. Direct output to: `ai-pipeline/artifacts/<your-domain>/03-contracts.md`

### Step 4 — Run Agent 04 (Refactor Engineer)

1. Open `prompts/agents/04-refactor-engineer.md`.
2. Provide: `03-contracts.md` + `01-repo-audit.md` + current repo files.
3. Agent 04 **makes actual file changes**. Review each change before accepting.
4. **Commit file changes after Agent 04 completes.**
5. Direct plan output to: `ai-pipeline/artifacts/<your-domain>/04-refactor-plan.md`

### Step 5 — Run Agent 05 (Integration Agent)

1. Open `prompts/agents/05-integration-agent.md`.
2. Provide: `04-refactor-plan.md` + `02-architecture-spec.md` + current repo state (post-commit).
3. Agent 05 updates README, docs, cross-references.
4. Direct output to: `ai-pipeline/artifacts/<your-domain>/05-integration-plan.md`

### Step 6 — Run Agent 06 (UX Flow Agent)

1. Open `prompts/agents/06-ux-flow-agent.md`.
2. Provide: `05-integration-plan.md` + README + docs/agents/ + `.agent/rules/01-project-context.md`.
3. Agent 06 may make small doc improvements.
4. Direct output to: `ai-pipeline/artifacts/<your-domain>/06-ux-flow.md`

### Step 7 — Run Agent 07 (Verification Agent)

1. Open `prompts/agents/07-verification-agent.md`.
2. Provide: all six artifact files + current repo state.
3. Agent 07 runs any available lint/test commands.
4. Direct output to: `ai-pipeline/artifacts/<your-domain>/07-verification-plan.md`
5. Read the **Next Recommended Action** section. That's your next GitHub issue.

---

## Troubleshooting

### Agent output is too generic
The AI didn't read the actual files. Ask explicitly: "Read [file path] now and incorporate its specific contents into your analysis."

### Agent skips a required section
Reference the prompt's **Output Format** section and ask the AI to produce the missing section.

### File changes from Agent 04 look risky
Mark the change as deferred in `04-refactor-plan.md`. Do not force changes you're not confident in. Agent 07 will track the deferral.

### You want to re-run a single agent
Each agent specifies its inputs explicitly. Re-run any agent independently as long as its input files are current.

---

## Adapting for a Consumer Project

To use this chain on a project that uses this template (not the template repo itself):

1. Copy `prompts/agents/` into the consumer project, or reference this template repo directly.
2. Create `ai-pipeline/artifacts/<consumer-project-domain>/` in the consumer project.
3. Run the chain against the consumer project's files.
4. The contracts in Agent 03 may differ slightly — adapt the skill/rule schemas to match whatever that project uses.

---

## Reference Run

The reference execution of this chain against the template repo itself is in:
```
ai-pipeline/artifacts/template-workflow/
```

Use it as a concrete example of what well-formed output looks like for each agent.
