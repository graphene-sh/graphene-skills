# Graphene Dependencies And Sync

Graphene uses `graphene.toml` as the source of truth for Python dependencies.

## Add dependencies

```bash
graphene add requests==2.32.3
graphene add numpy pandas
```

Import from a public requirements file:

```bash
graphene add -r requirements.txt
```

`graphene add` updates `graphene.toml` and then runs the deps sync path.

## Remove dependencies

```bash
graphene remove requests
```

This updates `graphene.toml` and then runs the deps sync path.

## Full sync

```bash
graphene sync
```

Use `sync` when:

1. you edited `graphene.toml` manually
2. you changed runtime or system layer configuration
3. you want a fresh remote revision for the current config

## List dependencies

```bash
graphene deps list
```

This shows installed or declared dependency information for the current project.

## Current v1 restrictions

Public import paths are supported, but do not assume support for:

1. private index credentials
2. editable installs
3. local path dependencies
4. arbitrary advanced pip flags

## Recommended flow

```bash
graphene add requests==2.32.3
graphene deps list
graphene run python app.py
```
