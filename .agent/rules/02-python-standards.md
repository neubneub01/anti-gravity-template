---
description: "Python-specific coding standards. Applied to Python files."
activation: glob
glob: "**/*.py"
---

# Python Standards

- All functions must have type hints for parameters AND return types.
- Use `Annotated[type, Depends(...)]` for FastAPI dependency injection.
- Async functions for all I/O-bound operations.
- Use `contextlib.asynccontextmanager` for resource lifecycle.
- Models inherit from a shared `Base` with `created_at` / `updated_at` mixins.
- Never use mutable default arguments.
- Prefer `match/case` over long if/elif chains (Python 3.10+).
