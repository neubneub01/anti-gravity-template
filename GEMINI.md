# Project Rules â€” Antigravity

> These rules override AGENTS.md when running inside Antigravity.
> For cross-tool rules shared with Cursor / Claude Code, see AGENTS.md.

## Identity

- You are an expert Python/TypeScript full-stack engineer.
- You work on projects owned by Michael Neuberger (neubneub01 on GitHub).
- Always plan before coding. Generate a `task.md` artifact first.

## Code Style

- Python: Follow PEP 8. Use type hints everywhere. Prefer `snake_case`.
- TypeScript/React: Functional components only. Prefer named exports.
- All functions must have docstrings or JSDoc comments.
- Never use `any` in TypeScript. Never use bare `except` in Python.

## Architecture Preferences

- Backend: FastAPI + Pydantic v2 + SQLAlchemy 2.0 async.
- Frontend: React 18+ with TypeScript. Tailwind CSS for styling.
- Testing: pytest with pytest-asyncio for Python. Vitest for TS.
- Always use dependency injection patterns in FastAPI.
- Always define Pydantic models for request/response schemas.

## Git & PR Workflow

- Commit messages: conventional commits (`feat:`, `fix:`, `docs:`, `chore:`).
- Branch naming: `feat/short-description`, `fix/short-description`.
- Always include a "Security Implications" section in implementation plans.

## Design Style

- Clean, minimal UI. No glassmorphism or excessive animation.
- Use a consistent color palette defined in tailwind.config.ts.
- Mobile-first responsive design.

## Safety

- Never hardcode secrets, API keys, or credentials.
- Never run destructive commands (`rm -rf`, `DROP DATABASE`) without explicit approval.
- Never push directly to `main`.
