---
name: fastapi-dev
description: |
  Use when creating new FastAPI endpoints, routers, services, or Pydantic schemas.
  Triggers on: "add endpoint", "new route", "create API", "CRUD", "service layer",
  "pydantic model", "schema", "FastAPI".
---

# FastAPI Development Skill

## When to Use
When the user asks to create, modify, or scaffold any FastAPI backend component.

## Workflow

1. **Schema First**: Define Pydantic request/response schemas in `src/schemas/`.
   - Use `Create`, `Update`, `Response` suffixes.
   - Example: `WorkoutCreate`, `WorkoutUpdate`, `WorkoutResponse`.

2. **Service Layer**: Implement business logic in `src/services/`.
   - Services accept a `AsyncSession` parameter.
   - Services return domain objects, never HTTP responses.

3. **Router**: Wire up in `src/api/`.
   - Use `APIRouter(prefix="/resource", tags=["resource"])`.
   - Inject dependencies with `Annotated[AsyncSession, Depends(get_db)]`.
   - Return appropriate status codes (201 for create, 204 for delete).

4. **Tests**: Create matching test file in `src/tests/`.
   - Use `httpx.AsyncClient` with the FastAPI `TestClient`.
   - Test happy path, validation errors, and not-found cases.

## Template: New Router

```python
from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from src.core.deps import get_db
from src.schemas.{resource} import {Resource}Create, {Resource}Response
from src.services.{resource} import {Resource}Service

router = APIRouter(prefix="/{resources}", tags=["{resources}"])

@router.post("/", response_model={Resource}Response, status_code=status.HTTP_201_CREATED)
async def create_{resource}(
    data: {Resource}Create,
    db: Annotated[AsyncSession, Depends(get_db)],
) -> {Resource}Response:
    service = {Resource}Service(db)
    return await service.create(data)
```

## Constraints
- Never put business logic in routers.
- Never return raw SQLAlchemy models from endpoints.
- Always validate with Pydantic before hitting the DB.
