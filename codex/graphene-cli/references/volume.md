# Graphene Volumes

Volumes are workspace-owned persistent storage.

## Create and inspect

Create:

```bash
graphene volume create my-volume
```

List:

```bash
graphene volume list
```

Delete:

```bash
graphene volume delete my-volume
```

## Path syntax

Volume file operations use:

```text
<volume>:/absolute/path
```

Examples:

```text
checkpoints:/model.bin
datasets:/images/train.csv
```

## Upload and download

Upload:

```bash
graphene volume put ./model.bin checkpoints:/model.bin
```

Download:

```bash
graphene volume get checkpoints:/model.bin ./model.bin
```

## List and remove files

List:

```bash
graphene volume ls checkpoints:/
```

Remove:

```bash
graphene volume rm checkpoints:/model.bin
```

## Use with runs

If a project has volume mounts in `graphene.toml`, runs can see those paths inside the remote environment.

Keep large datasets, checkpoints, and artifacts in volumes rather than expecting code upload to carry them.

Important behavior:

1. runs can read and write mounted volume paths
2. this is the correct durable path for checkpoints and final artifacts
3. do not expect mounted volume files to sync back into the local repo working tree
4. if an agent needs resumable training state, it should write directly into the mounted volume path
5. if a task would otherwise require `run --detach` plus local output sync, store the outputs in a mounted volume instead
