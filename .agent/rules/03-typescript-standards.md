---
description: "TypeScript and React standards. Applied to TS/TSX files."
activation: glob
glob: "**/*.{ts,tsx}"
---

# TypeScript & React Standards

- Functional components only. No class components.
- Use named exports: `export function MyComponent() {}`.
- Props interfaces named `{ComponentName}Props`.
- Custom hooks prefixed with `use` and placed in `hooks/`.
- Use `React.Suspense` and lazy loading for route-level code splitting.
- Error boundaries around all async data-fetching components.
- Use Tailwind utility classes. No inline styles. No CSS modules.
