# Graphene Skills

Reusable Graphene CLI skills for multiple coding agents.

## Repository layout

- `shared/graphene-cli/`
  - Agent-neutral reference docs
- `codex/graphene-cli/`
  - Codex skill wrapper
- `.claude/skills/graphene-cli/`
  - Claude Code skill wrapper

## Current model

This repository is optimized for:

1. cloning the repo locally
2. linking the Codex skill into `~/.codex/skills`
3. using the Claude skill directly from the cloned repo or linking it into `~/.claude/skills`

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

Recommended: install a real local copy, not a symlink.

#### Install from GitHub path

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

#### Development-only symlink flow

Use this only while iterating locally on the skill repository itself:

```bash
ln -s /Users/jeonhwichan/Documents/projects/graphene-skills/codex/graphene-cli \
  /Users/jeonhwichan/.codex/skills/graphene-cli
```

### Claude Code

Project-local use works by opening this repository in Claude Code, because `.claude/skills/graphene-cli/SKILL.md` lives at the repo root.

For global use:

```bash
mkdir -p /Users/jeonhwichan/.claude/skills
ln -s /Users/jeonhwichan/Documents/projects/graphene-skills/.claude/skills/graphene-cli \
  /Users/jeonhwichan/.claude/skills/graphene-cli
```

## Verification

### Codex

After installation and restart, the `graphene-cli` skill should be available to Codex.

The GitHub-path package was verified locally by installing:

- repo: `graphene-sh/graphene-skills`
- path: `codex/graphene-cli`

using the local skill-installer helper script.

### Claude Code

From this repository, Claude should discover the `graphene-cli` skill automatically when a task clearly involves the Graphene CLI.

You can also sanity-check the installed skill folder with:

```bash
find /Users/jeonhwichan/.claude/skills/graphene-cli -maxdepth 2 -type f | sort
```

And then start a fresh Claude session in a Graphene-related repo and ask it to use Graphene.

Unlike `claude agents`, Claude skills are not listed through the agent command because they are not subagents.

## Scope

These skills document the **currently implemented** Graphene CLI surface.

They intentionally do not describe future-only commands as supported behavior.
