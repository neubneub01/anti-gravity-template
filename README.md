# Antigravity Project Template

Modular, reusable Google Antigravity configuration for Python/TypeScript full-stack projects.

## Quick Start

**Linux/macOS:**
```bash
git clone https://github.com/neubneub01/anti-gravity-template
./anti-gravity-template/setup.sh ~/projects/my-new-project
```

**Windows (PowerShell):**
```powershell
# Run setup-antigravity-template.ps1 from the repo root
```

Then:
1. Fill in `.agent/rules/01-project-context.md` with your project details (see the checklist inside the file)
2. Delete any skills you don't need from `.agent/skills/`
3. Open your project in Antigravity, Cursor, or Claude Code

## Structure

```
.
├── GEMINI.md                          # Antigravity rules (highest priority)
├── AGENTS.md                          # Cross-tool rules (Cursor, Claude Code)
├── setup.sh                           # Bootstrap script (Linux/macOS)
├── setup-antigravity-template.ps1     # Bootstrap script (Windows)
├── .agent/
│   ├── rules/                         # Always-active & glob-triggered rules
│   │   ├── 01-project-context.md      # ← CUSTOMIZE THIS per project
│   │   ├── 02-python-standards.md     # Auto-applies to *.py
│   │   └── 03-typescript-standards.md # Auto-applies to *.ts/*.tsx
│   └── skills/                        # On-demand skills
│       ├── fastapi-dev/SKILL.md
│       ├── react-frontend/SKILL.md
│       ├── testing/SKILL.md
│       ├── homelab-ops/SKILL.md
│       ├── docker-deploy/SKILL.md
│       └── agent-workflow/SKILL.md    # ← Run structured audits & refactors
├── prompts/
│   └── agents/                        # Seven-agent analysis chain prompts
├── docs/
│   ├── ADDING_SKILLS.md
│   └── agents/                        # Agent workflow system docs
└── ai-pipeline/
    └── artifacts/                     # Outputs from agent workflow runs
```

## Per-Project Customization

Only file you must edit: `.agent/rules/01-project-context.md`

Don't need React? Delete `.agent/skills/react-frontend/` and `.agent/rules/03-typescript-standards.md`.
Don't need homelab? Delete `.agent/skills/homelab-ops/`.

## Agent Workflow System

This template includes a **seven-agent analysis and refactor chain** you can run on any project to audit its architecture, define data contracts, and implement targeted improvements.

- **Prompts**: [`prompts/agents/`](prompts/agents/)
- **Docs & runbook**: [`docs/agents/`](docs/agents/)
- **Reference artifacts**: [`ai-pipeline/artifacts/template-workflow/`](ai-pipeline/artifacts/template-workflow/)

To start: ask your AI assistant to "run an audit on my project" — the `agent-workflow` skill will guide the process.

## Contributing

See [`docs/ADDING_SKILLS.md`](docs/ADDING_SKILLS.md) for how to add new skills to the template.
