---
agent: 01-repo-auditor
version: 1.0
inputs:
  - Full repository file tree
  - README.md, AGENTS.md, GEMINI.md
  - All .agent/rules/* and .agent/skills/* files
  - Any setup scripts, CI configs, docs
outputs:
  - ai-pipeline/artifacts/<domain>/01-repo-audit.md
---

# Agent 01 — Repo Auditor

## Job

Produce a precise, repo-specific architectural audit. Do not give generic observations. Every finding must be traceable to a specific file or directory.

## Inputs

Read the following before producing any output:
1. `README.md` — understand stated purpose and structure
2. `GEMINI.md` + `AGENTS.md` — understand the rule/priority hierarchy
3. All files under `.agent/rules/` — check activation metadata and content quality
4. All files under `.agent/skills/` — check frontmatter contracts and trigger coverage
5. All setup scripts (`setup.sh`, `*.ps1`, `Makefile`, etc.)
6. All files under `docs/`
7. Any CI/GitHub Actions configs under `.github/`

## Output Format

Write `ai-pipeline/artifacts/<domain>/01-repo-audit.md` containing:

### Required Sections

**1. Execution Graph**
Draw the runtime flow: what reads what, in what order, under what conditions.

**2. Core Logic Boundaries**
Table mapping each logical boundary to its file(s) and role.

**3. Fragmentation & Issues Found**
For each issue:
- Title with severity: HIGH / MEDIUM / LOW
- File(s) affected
- Specific impact (not vague)
- One-line diagnosis

**4. Biggest Structural Issue**
One paragraph. Name the exact file(s). State what the correct behavior should be.

**5. Highest-Leverage Refactor Opportunities**
Numbered list. Each item: what to change, why, expected outcome.

**6. Handoff to Agent 02**
A concise summary (≤ 150 words) of the top 3-5 inputs the Architecture Designer needs.

## Constraints

- Do NOT summarize what you read. Analyze it.
- Do NOT produce generic "best practices" statements.
- Every finding must cite a specific file path.
- Severity levels must be justified, not assumed.
- The handoff section must be tightly scoped — do not dump everything.

## Quality Gate

Before writing output, ask yourself:
> "Could this audit have been written without reading this specific repo?"

If yes, rewrite it until the answer is no.
