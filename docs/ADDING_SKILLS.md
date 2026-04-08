# Adding Custom Skills

## Minimal Skill

Create a folder under `.agent/skills/` with a `SKILL.md`:

```
.agent/skills/my-skill/
â””â”€â”€ SKILL.md
```

### SKILL.md Template

```markdown
---
name: my-skill
description: |
  1-2 sentences describing WHEN this skill should activate.
  Include trigger keywords the agent will match against.
---

# My Skill Name

## When to Use
Describe the scenario clearly.

## Steps
1. Step one
2. Step two

## Template (optional)
Code template the agent should follow.

## Constraints
- What NOT to do.

## Examples (optional)
Input -> Output examples help the agent learn the pattern.
```

## Key Tips

- **Description is SEO for the AI** â€” be specific with trigger words.
- **Atomic design** â€” one skill per concern.
- **Include constraints** â€” tell the agent what NOT to do.
- **Add scripts** if the skill needs to execute something.

## Activation

Skills are loaded on-demand via semantic matching against the `description` field.
Restart the agent after adding new skills: `Cmd/Ctrl+Shift+P` -> "Restart Agent".
