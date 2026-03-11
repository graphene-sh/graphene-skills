---
name: graphene-cli
description: "Use this skill when the task involves operating Graphene through its CLI: login, identity checks, project initialization, runtime configuration, dependency sync, regular runs, train runs, or volume file operations. Use it to choose the correct Graphene command, avoid unsupported commands, and apply the right preflight checks before execution."
metadata:
  short-description: "Graphene login, init, deps, run, train, and volumes"
---

# Graphene CLI

Use this skill for real Graphene CLI work.

## Core rules

1. Start with `graphene version` to confirm the baked target.
2. Then run `graphene whoami` unless the task is specifically about logging in.
3. If the task needs a project command, confirm `graphene.toml` exists.
4. Do not invent support for commands that are not implemented.
5. Do not assume runtime server switching. Current binaries are baked per environment.
6. Use `--no-upload` only when the command does not need local files.
7. Treat `run --train` as the same command execution surface on a different infrastructure path.
8. Treat local file sync as foreground-only. Durable outputs and checkpoints belong in mounted volumes.
9. Never choose `graphene run --detach` when the task expects generated files to sync back into the local working tree.
10. Before selecting a GPU non-interactively, prefer `graphene runtime options --json`.
11. If runtime options imply a GPU is train-only, do not choose plain `graphene run` for that GPU.

## Read these references first

- For command availability: `references/command-surface.md`
- For environment checks and target validation: `references/environment-and-preflight.md`

## Read additional references by task

- Authentication or PATs: `references/auth.md`
- New project setup or runtime edits: `references/init-and-config.md`
- Python dependencies or sync: `references/deps-and-sync.md`
- Running code, GPU checks, or train jobs: `references/run-and-train.md`
- Volume storage operations: `references/volume.md`
- Errors or ambiguous state: `references/troubleshooting.md`

## Supported command families

- `login`, `logout`, `whoami`, `version`
- `api-key create|list|revoke`
- `init`
- `config`, `config get`, `config set`
- `add`, `remove`, `sync`, `deps list`
- `run`, `run --no-upload`, `run --train`
- `volume create|list|delete|put|get|ls|rm`

## Not supported yet

Do not rely on:

- `graphene status`
- `graphene logs`
- `graphene usage`
- `graphene deploy`
- `graphene project link`
- `graphene run --detach`

## Decision guide

If the goal is:

1. authenticate or rotate credentials, read `auth.md`
2. set up a repo, read `init-and-config.md`
3. update Python dependencies, read `deps-and-sync.md`
4. run code or check GPU availability, read `run-and-train.md`
5. manage durable files, read `volume.md`

When unsure, read `troubleshooting.md` before improvising.
