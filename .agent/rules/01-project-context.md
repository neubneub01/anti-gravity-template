---
description: "Core project context and architecture. Always active."
activation: always
---

# Project Context

<!-- CUSTOMIZE: Replace this section per-project -->

## Project Name
<!-- e.g., fitness-neub -->

## Tech Stack
<!-- e.g., FastAPI 0.115+, Python 3.12, SQLAlchemy 2.0, React 18, TypeScript 5 -->

## Directory Layout
```
src/
â”œâ”€â”€ api/          # FastAPI routers
â”œâ”€â”€ core/         # Config, security, deps
â”œâ”€â”€ models/       # SQLAlchemy models
â”œâ”€â”€ schemas/      # Pydantic schemas
â”œâ”€â”€ services/     # Business logic
â”œâ”€â”€ tests/        # pytest suite
frontend/
â”œâ”€â”€ src/
â”‚   â”œâ”€â”€ components/
â”‚   â”œâ”€â”€ hooks/
â”‚   â”œâ”€â”€ pages/
â”‚   â””â”€â”€ lib/
```

## Key Patterns
- All routers use dependency injection for DB sessions.
- Business logic lives in `services/`, never in routers.
- Pydantic schemas separate Create/Update/Response variants.

---

<!-- SETUP CHECKLIST — delete this block after completing all items -->
## Setup Checklist

Before this file is useful to the AI assistant, confirm all sections above are filled in:

- [ ] `## Project Name` — real project name (not a comment)
- [ ] `## Tech Stack` — actual package versions in use
- [ ] `## Directory Layout` — real project structure (not the template placeholder)
- [ ] `## Key Patterns` — at least 2 patterns specific to this project

An incomplete file (containing `<!-- CUSTOMIZE` or `<!-- e.g.,` comments) means the AI has no project-specific context and will give generic responses.

<!-- END CHECKLIST -->
