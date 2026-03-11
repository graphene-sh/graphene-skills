# Graphene Run And Train

Graphene has one execution surface with two infrastructure modes:

1. `run`
2. `run --train`

The command itself is still your command. `--train` changes the infrastructure path, not the language of the command.

## Quick GPU sanity check

```bash
graphene run --no-upload nvidia-smi
graphene run --no-upload nvidia-smi -L
graphene run --no-upload sh -lc 'nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader'
```

## Regular run

Use regular run when:

1. you want the standard inference-serving path
2. the command should use the current project code
3. cold-start-sensitive or repeated short jobs are expected

Example:

```bash
graphene run python train_smoke.py
```

## No-upload run

Use `--no-upload` only for commands that do not need local files.

Example:

```bash
graphene run --no-upload python --version
```

Do not use it for:

```bash
graphene run --no-upload python train_smoke.py
```

## Train mode

Use train mode when:

1. the job is long-running
2. you want the on-demand train VM path
3. you do not need the inference warm pool

Example:

```bash
graphene run --train python train_smoke.py
```

## Train warm idle

You can ask Graphene to keep the train VM warm for a short reuse window:

```bash
graphene run --train --train-warm-idle-seconds 120 python train_smoke.py
```

Use this only when you expect another train job soon.

## Output expectations

Current run streaming includes:

1. system lifecycle lines
2. runtime preparation lines
3. user stdout and stderr
4. final timing line

Current file behavior:

1. foreground `graphene run` can sync newly created `/work` files back to the local working directory
2. mounted volume paths are not part of local file sync; they persist through the volume itself
3. use volumes for datasets, checkpoints, models, and durable artifacts

Do not assume:

1. detached jobs
2. persistent logs
3. `graphene logs/status`
4. file sync after detach or reconnect
5. conflict-safe local/remote concurrent edits on the same `/work` path

Hard rule:

1. if the task needs generated files to come back to the local working tree automatically, do not choose detach
2. use foreground `graphene run` for local file sync
3. use mounted volumes for durable artifacts, checkpoints, and resumable training state

## Recommended decision rule

Use:

```text
graphene run
```

for normal project execution on a GPU that is currently available in the inference fleet.

Use:

```text
graphene run --train
```

when the selected GPU is effectively `train mode only`, or when the job intentionally belongs on the train infrastructure path.

Hard rule for agents:

1. before choosing a GPU non-interactively, prefer `graphene runtime options --json`
2. if the selected GPU is only available for train, do not choose plain `graphene run`
