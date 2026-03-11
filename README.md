# Graphene Skills

Reusable Graphene CLI skills for multiple coding agents.

## Repository layout

- `shared/graphene-cli/`
  - Agent-neutral reference docs
- `codex/graphene-cli/`
  - Codex skill wrapper
- `.claude/agents/`
  - Claude Code subagent wrapper

## Current model

This repository is optimized for:

1. cloning the repo locally
2. linking the Codex skill into `~/.codex/skills`
3. using the Claude subagent directly from the cloned repo or linking it into `~/.claude/agents`

It now supports:

1. local clone + symlink usage
2. Codex GitHub-path installation with bundled `references/`

Planning notes and product-alignment documents live in the private Graphene repository, not here.

## Updating bundled Codex references

The shared docs under `shared/graphene-cli/` are the source of truth.

When they change, refresh the bundled Codex copies:

```bash
./scripts/sync-codex-references.sh
```

## Local use

### Codex

#### Option 1: clone + symlink

```bash
ln -s /Users/jeonhwichan/Documents/projects/graphene-skills/codex/graphene-cli \
  /Users/jeonhwichan/.codex/skills/graphene-cli
```

Restart Codex after linking.

#### Option 2: install from GitHub path

The Codex skill is packaged as a standalone install unit under:

- `codex/graphene-cli`

That means a GitHub-path installer can fetch just that subtree and install it as `graphene-cli`.

Example using the local installer script:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo graphene-sh/graphene-skills \
  --path codex/graphene-cli
```

Restart Codex after installation.

### Claude Code

Project-local use works by opening this repository in Claude Code, because `.claude/agents/graphene-cli.md` lives at the repo root.

For global use:

```bash
ln -s /Users/jeonhwichan/Documents/projects/graphene-skills/.claude/agents/graphene-cli.md \
  /Users/jeonhwichan/.claude/agents/graphene-cli.md
```

## Verification

### Codex

After installation and restart, the `graphene-cli` skill should be available to Codex.

The GitHub-path package was verified locally by installing:

- repo: `graphene-sh/graphene-skills`
- path: `codex/graphene-cli`

using the local skill-installer helper script.

### Claude Code

From this repository, you can verify discovery with:

```bash
claude agents
```

The `graphene-cli` agent should appear in the agent list.

You can also sanity-check it with:

```bash
printf '%s\n' 'What are the first two Graphene preflight commands I should run before doing project work? Reply in one line.' \
  | claude -p --agent graphene-cli --tools ""
```

## Scope

These skills document the **currently implemented** Graphene CLI surface.

They intentionally do not describe future-only commands as supported behavior.
