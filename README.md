# Antigravity Project Template

Modular, reusable Google Antigravity configuration for Python/TypeScript full-stack projects.

## Quick Start

1. Edit `.agent/rules/01-project-context.md` with your project details
2. Delete any skills you don't need from `.agent/skills/`
3. Open this folder in Antigravity

## Structure

```
.
â”œâ”€â”€ GEMINI.md                          # Antigravity rules (highest priority)
â”œâ”€â”€ AGENTS.md                          # Cross-tool rules (Cursor, Claude Code)
â”œâ”€â”€ .agent/
â”‚   â”œâ”€â”€ rules/                         # Always-active & glob-triggered rules
â”‚   â”‚   â”œâ”€â”€ 01-project-context.md      # â† CUSTOMIZE THIS per project
â”‚   â”‚   â”œâ”€â”€ 02-python-standards.md     # Auto-applies to *.py
â”‚   â”‚   â””â”€â”€ 03-typescript-standards.md # Auto-applies to *.ts/*.tsx
â”‚   â””â”€â”€ skills/                        # On-demand skills
â”‚       â”œâ”€â”€ fastapi-dev/SKILL.md
â”‚       â”œâ”€â”€ react-frontend/SKILL.md
â”‚       â”œâ”€â”€ testing/SKILL.md
â”‚       â”œâ”€â”€ homelab-ops/SKILL.md
â”‚       â””â”€â”€ docker-deploy/SKILL.md
â””â”€â”€ docs/
    â””â”€â”€ ADDING_SKILLS.md
```

## Per-Project Customization

Only file you must edit: `.agent/rules/01-project-context.md`

Don't need React? Delete `.agent/skills/react-frontend/` and `.agent/rules/03-typescript-standards.md`.
Don't need homelab? Delete `.agent/skills/homelab-ops/`.
