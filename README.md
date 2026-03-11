# Graphene Skills

Reusable Graphene CLI skills for multiple coding agents.

## Repository layout

- `shared/graphene-cli/`
  - Agent-neutral reference docs
- `codex/graphene-cli/`
  - Codex skill wrapper
- `.claude/agents/`
  - Claude Code subagent wrapper
- `docs/`
  - Research and planning notes

## Current model

This repository is optimized for:

1. cloning the repo locally
2. linking the Codex skill into `~/.codex/skills`
3. using the Claude subagent directly from the cloned repo or linking it into `~/.claude/agents`

It is **not yet** optimized for packaging the Codex skill as a standalone GitHub path install that excludes the shared docs directory.

## Local use

### Codex

```bash
ln -s /Users/jeonhwichan/Documents/projects/graphene-skills/codex/graphene-cli \
  /Users/jeonhwichan/.codex/skills/graphene-cli
```

Restart Codex after linking.

### Claude Code

Project-local use works by opening this repository in Claude Code, because `.claude/agents/graphene-cli.md` lives at the repo root.

For global use:

```bash
ln -s /Users/jeonhwichan/Documents/projects/graphene-skills/.claude/agents/graphene-cli.md \
  /Users/jeonhwichan/.claude/agents/graphene-cli.md
```

## Scope

These skills document the **currently implemented** Graphene CLI surface.

They intentionally do not describe future-only commands as supported behavior.
