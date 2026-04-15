#!/usr/bin/env bash
# setup.sh — Antigravity template bootstrap (Linux/macOS)
#
# Usage:
#   ./setup.sh <target-directory>
#
# This script copies the Antigravity template files into a target project
# directory. It reads from the committed template files — it does NOT contain
# inline file content.
#
# Run from the root of the anti-gravity-template repo.

set -euo pipefail

# ── Helpers ──────────────────────────────────────────────────────────────────

usage() {
  echo "Usage: $0 <target-directory>"
  echo ""
  echo "Options:"
  echo "  --force    Overwrite existing files (default: skip existing)"
  echo "  --list     List files that would be copied, then exit"
  echo ""
  echo "Example:"
  echo "  $0 ~/projects/my-new-app"
  exit 1
}

info()    { echo "  \033[34mℹ\033[0m  $*"; }
success() { echo "  \033[32m✔\033[0m  $*"; }
warn()    { echo "  \033[33m⚠\033[0m  $*"; }
error()   { echo "  \033[31m✖\033[0m  $*" >&2; }

# ── Argument parsing ──────────────────────────────────────────────────────────

FORCE=false
LIST_ONLY=false
TARGET=""

for arg in "$@"; do
  case "$arg" in
    --force)     FORCE=true ;;
    --list)      LIST_ONLY=true ;;
    --help|-h)   usage ;;
    -*)          error "Unknown option: $arg"; usage ;;
    *)           TARGET="$arg" ;;
  esac
done

# ── Validate ──────────────────────────────────────────────────────────────────

TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -z "$TARGET" && "$LIST_ONLY" == "false" ]]; then
  error "Target directory is required."
  usage
fi

# ── File manifest ─────────────────────────────────────────────────────────────
# Format: "source-relative-path:destination-relative-path"
# Source paths are relative to the template repo root.
# Destination paths are relative to the target project root.

FILES=(
  "GEMINI.md:GEMINI.md"
  "AGENTS.md:AGENTS.md"
  ".gitignore:.gitignore"
  ".agent/rules/01-project-context.md:.agent/rules/01-project-context.md"
  ".agent/rules/02-python-standards.md:.agent/rules/02-python-standards.md"
  ".agent/rules/03-typescript-standards.md:.agent/rules/03-typescript-standards.md"
  ".agent/skills/fastapi-dev/SKILL.md:.agent/skills/fastapi-dev/SKILL.md"
  ".agent/skills/react-frontend/SKILL.md:.agent/skills/react-frontend/SKILL.md"
  ".agent/skills/testing/SKILL.md:.agent/skills/testing/SKILL.md"
  ".agent/skills/homelab-ops/SKILL.md:.agent/skills/homelab-ops/SKILL.md"
  ".agent/skills/docker-deploy/SKILL.md:.agent/skills/docker-deploy/SKILL.md"
  ".agent/skills/agent-workflow/SKILL.md:.agent/skills/agent-workflow/SKILL.md"
  "docs/ADDING_SKILLS.md:docs/ADDING_SKILLS.md"
)

PROMPTS=(
  "prompts/agents/01-repo-auditor.md:prompts/agents/01-repo-auditor.md"
  "prompts/agents/02-architecture-designer.md:prompts/agents/02-architecture-designer.md"
  "prompts/agents/03-data-contract-agent.md:prompts/agents/03-data-contract-agent.md"
  "prompts/agents/04-refactor-engineer.md:prompts/agents/04-refactor-engineer.md"
  "prompts/agents/05-integration-agent.md:prompts/agents/05-integration-agent.md"
  "prompts/agents/06-ux-flow-agent.md:prompts/agents/06-ux-flow-agent.md"
  "prompts/agents/07-verification-agent.md:prompts/agents/07-verification-agent.md"
  "docs/agents/README.md:docs/agents/README.md"
  "docs/agents/execution-order.md:docs/agents/execution-order.md"
  "docs/agents/runbook.md:docs/agents/runbook.md"
)

ALL_FILES=("${FILES[@]}" "${PROMPTS[@]}")

# ── List mode ─────────────────────────────────────────────────────────────────

if [[ "$LIST_ONLY" == "true" ]]; then
  echo "Files that would be copied:"
  for entry in "${ALL_FILES[@]}"; do
    src="${entry%%:*}"
    echo "  $src"
  done
  exit 0
fi

# ── Copy files ────────────────────────────────────────────────────────────────

echo ""
echo "Antigravity Template Setup"
echo "  Template : $TEMPLATE_DIR"
echo "  Target   : $TARGET"
echo ""

for entry in "${ALL_FILES[@]}"; do
  src_rel="${entry%%:*}"
  dst_rel="${entry##*:}"

  src="$TEMPLATE_DIR/$src_rel"
  dst="$TARGET/$dst_rel"

  if [[ ! -f "$src" ]]; then
    warn "Source not found, skipping: $src_rel"
    continue
  fi

  if [[ -f "$dst" && "$FORCE" == "false" ]]; then
    warn "Already exists, skipping (use --force to overwrite): $dst_rel"
    continue
  fi

  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  success "Copied: $dst_rel"
done

echo ""
echo "Done."
echo ""
echo "Next steps:"
echo "  1. Edit $TARGET/.agent/rules/01-project-context.md with your project details"
echo "  2. Delete any skills you don't need from $TARGET/.agent/skills/"
echo "  3. Open $TARGET in Antigravity, Cursor, or Claude Code"
echo ""
