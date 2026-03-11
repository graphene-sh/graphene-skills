# Graphene CLI Environment And Preflight

Before using Graphene, run the shortest possible checks first.

## 1. Confirm the baked target

```bash
graphene version
```

Expected shape:

```text
graphene <version>
  target: <prod|dev>
  server: <https://api.graphene.sh | https://api-dev.graphene.sh>
```

Do not assume the binary can switch servers at runtime.

Current Graphene binaries are baked per environment.

## 2. Confirm login state

```bash
graphene whoami
```

If it says you are not logged in, run:

```bash
graphene login
```

## 3. Confirm whether the current command needs a project

These commands do **not** require `graphene.toml`:

- `graphene login`
- `graphene logout`
- `graphene whoami`
- `graphene version`
- `graphene api-key ...`

These commands **do** require `graphene.toml` in the current repo:

- `graphene init` writes it
- `graphene config`
- `graphene add`
- `graphene remove`
- `graphene sync`
- `graphene deps list`
- `graphene run`
- `graphene volume ...`

If `graphene.toml` is missing, stop and initialize the project first:

```bash
graphene init
```

## 4. Decide whether code upload is needed

Use `--no-upload` only when the command does not need local files.

Good examples:

```bash
graphene run --no-upload nvidia-smi
graphene run --no-upload python --version
graphene run --no-upload sh -lc 'nvidia-smi -L'
```

Do not use `--no-upload` for commands that need local code:

```bash
graphene run python train.py
graphene run --train python fine_tune.py
```

## 5. Quick health check flow

Use this order when unsure:

```bash
graphene version
graphene whoami
test -f graphene.toml || graphene init
graphene run --no-upload nvidia-smi
```
