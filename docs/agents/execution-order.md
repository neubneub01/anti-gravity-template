# Execution Order — Agent Workflow Chain

## Sequence

```
01-repo-auditor
      │
      │ outputs: 01-repo-audit.md
      ▼
02-architecture-designer
      │
      │ outputs: 02-architecture-spec.md
      ▼
03-data-contract-agent
      │
      │ outputs: 03-contracts.md
      ▼
04-refactor-engineer
      │
      │ outputs: 04-refactor-plan.md + actual file changes
      ▼
05-integration-agent
      │
      │ outputs: 05-integration-plan.md + doc/README updates
      ▼
06-ux-flow-agent
      │
      │ outputs: 06-ux-flow.md + onboarding doc improvements
      ▼
07-verification-agent
      │
      └─ outputs: 07-verification-plan.md (final status)
```

## Dependencies

| Agent | Reads | Writes |
|---|---|---|
| 01 | Repo files | `01-repo-audit.md` |
| 02 | `01-repo-audit.md` | `02-architecture-spec.md` |
| 03 | `02-architecture-spec.md` + `.agent/` files | `03-contracts.md` |
| 04 | `03-contracts.md` + `01-repo-audit.md` + repo files | `04-refactor-plan.md` + file changes |
| 05 | `04-refactor-plan.md` + `02-architecture-spec.md` + repo files | `05-integration-plan.md` + doc updates |
| 06 | `05-integration-plan.md` + README + docs + `.agent/rules/` | `06-ux-flow.md` + doc improvements |
| 07 | All artifacts + full repo state | `07-verification-plan.md` |

## Rules

1. **Sequential only.** Do not skip agents or run in parallel. Each agent depends on the previous agent's output.
2. **Commit after Agent 04.** File changes from Agent 04 must be committed before Agent 05 runs, so Agent 05 reads the actual post-refactor state.
3. **Agent 07 runs last, always.** It verifies the full run. Do not consider a run complete until `07-verification-plan.md` is written.
4. **One domain per run.** Use a descriptive folder name under `ai-pipeline/artifacts/` for each run (e.g., `template-workflow`, `fitness-app-audit`, `auth-refactor`).

## Restarting a Partial Run

If you stop mid-chain, resume from the last incomplete agent. Each agent specifies its inputs explicitly — you can resume without re-running earlier agents as long as their output files are present.

## Typical Duration

| Agent | Typical Complexity |
|---|---|
| 01 | Medium — reads many files |
| 02 | Low — design reasoning |
| 03 | Low-Medium — schema extraction |
| 04 | High — implementation work |
| 05 | Low — additive doc updates |
| 06 | Low-Medium — journey walks |
| 07 | Low — checklist verification |
