---
name: testing
description: |
  Use when writing tests, debugging test failures, or setting up test infrastructure.
  Triggers on: "test", "pytest", "vitest", "coverage", "fixture", "mock",
  "test suite", "TDD", "assert".
---

# Testing Skill

## Python (pytest)

### File Naming
- `tests/test_{module}.py` mirrors `src/{module}.py`

### Fixtures in `conftest.py`
```python
import pytest_asyncio
from httpx import ASGITransport, AsyncClient
from src.main import app

@pytest_asyncio.fixture
async def client():
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as ac:
        yield ac
```

### Test Structure (Arrange-Act-Assert)
```python
async def test_create_resource(client: AsyncClient):
    # Arrange
    payload = {"name": "Test", "value": 42}
    # Act
    response = await client.post("/resources/", json=payload)
    # Assert
    assert response.status_code == 201
    data = response.json()
    assert data["name"] == "Test"
```

### Coverage
- Run: `pytest --cov=src --cov-report=term-missing`
- Target: 80%+ line coverage.

## TypeScript (Vitest)

### Test Structure
```typescript
import { describe, it, expect } from "vitest";

describe("formatCurrency", () => {
  it("formats USD correctly", () => {
    expect(formatCurrency(1234.5, "USD")).toBe("$1,234.50");
  });
});
```

## Constraints
- Every new endpoint needs at least: happy path, 422 validation, 404 not-found tests.
- Never mock what you can test directly.
- Tests must be deterministic â€” no reliance on wall-clock time.
