# Graphene Init And Config

Use `init` to create or connect a local repo to a Graphene project.

## Basic initialization

Interactive:

```bash
graphene init
```

Non-interactive:

```bash
graphene init --project my-project --workspace user-default --gpu t4 --python 3.11
```

## What `init` does

1. validates login
2. loads runtime options from the server
3. selects a workspace
4. creates or reuses the project on the server
5. writes `graphene.toml`

## Workspace rule

If more than one workspace is available, you must select one explicitly:

```bash
graphene init --workspace <handle>
```

## Runtime rule

Use `graphene runtime options --json` when an agent needs the current selectable GPU list in machine-readable form.

Current semantics:

1. runtime options can include warm inference GPUs and train-capable GPUs
2. entries effectively marked as `train mode only` must not be used with plain `graphene run`
3. use `graphene run --train` for those GPU profiles
4. do not assume every documented GPU is warm in the current inference fleet

Example:

```bash
graphene runtime options --json
```

## Config inspection

Show all runtime settings:

```bash
graphene config get
```

Show one setting:

```bash
graphene config get gpu
```

## Config update

TTY interactive editor:

```bash
graphene config
```

Direct key updates:

```bash
graphene config set gpu t4
graphene config set gpu l4
graphene config set gpu h100
graphene config set python 3.11
graphene config set system_layer.commands "apt-get update && apt-get install -y ffmpeg"
```

## Config caveat

`graphene config set ...` updates the local file.

Use `graphene sync` after config changes if you need the remote revision to reflect them.
