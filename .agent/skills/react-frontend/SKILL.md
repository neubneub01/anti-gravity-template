---
name: react-frontend
description: |
  Use when building React components, pages, hooks, or frontend features.
  Triggers on: "component", "page", "UI", "frontend", "React", "form",
  "dashboard", "hook", "Tailwind".
---

# React Frontend Skill

## Component Structure

```
frontend/src/
â”œâ”€â”€ components/     # Reusable UI components
â”‚   â””â”€â”€ ui/         # Primitives (Button, Input, Card)
â”œâ”€â”€ hooks/          # Custom hooks
â”œâ”€â”€ pages/          # Route-level page components
â”œâ”€â”€ lib/            # Utilities, API client, types
â””â”€â”€ App.tsx         # Root with router
```

## New Component Checklist

1. Create file: `components/{ComponentName}.tsx`
2. Define props interface: `{ComponentName}Props`
3. Use named export
4. Add loading/error states for data-fetching components
5. Responsive by default (mobile-first Tailwind)

## API Integration Pattern

```typescript
const API_BASE = import.meta.env.VITE_API_URL ?? "http://localhost:8000";

export async function apiFetch<T>(path: string, init?: RequestInit): Promise<T> {
  const res = await fetch(`${API_BASE}${path}`, {
    headers: { "Content-Type": "application/json", ...init?.headers },
    ...init,
  });
  if (!res.ok) throw new Error(`API ${res.status}: ${await res.text()}`);
  return res.json();
}
```

## Custom Hook Pattern

```typescript
export function use{Resource}() {
  const [data, setData] = useState<{Resource}[] | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    apiFetch<{Resource}[]>("/{resources}")
      .then(setData)
      .catch(setError)
      .finally(() => setLoading(false));
  }, []);

  return { data, loading, error };
}
```

## Constraints
- No `any` types.
- No inline styles â€” Tailwind only.
- Forms use controlled components with `zod` validation.
