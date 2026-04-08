---
name: docker-deploy
description: |
  Use when creating Dockerfiles, docker-compose configs, or deploying
  containerized applications.
  Triggers on: "docker", "Dockerfile", "compose", "container", "image",
  "build", "deploy", "multi-stage".
---

# Docker Deployment Skill

## Dockerfile Pattern (Python/FastAPI)

```dockerfile
# --- Build stage ---
FROM python:3.12-slim AS builder
WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN pip install uv && uv sync --frozen --no-dev

# --- Runtime stage ---
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY src/ src/
ENV PATH="/app/.venv/bin:$PATH"
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:8000/health || exit 1
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## docker-compose Pattern

```yaml
services:
  app:
    build: .
    restart: unless-stopped
    env_file: .env
    ports:
      - "${APP_PORT:-8000}:8000"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/health"]
      interval: 30s
      timeout: 5s
      retries: 3
    volumes:
      - app_data:/app/data

volumes:
  app_data:
```

## Constraints
- Always use multi-stage builds to minimize image size.
- Pin base image versions (e.g., `python:3.12-slim`, not `python:latest`).
- Never copy `.env`, `.git`, or `node_modules` into images â€” use `.dockerignore`.
- Always include a health check.
