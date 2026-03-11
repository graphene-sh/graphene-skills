# Graphene CLI Command Surface

This file documents the **currently implemented** Graphene CLI commands.

Use these commands as supported behavior.

## Authentication

```bash
graphene login
graphene login --api-key <token>
graphene logout
graphene whoami
graphene version
graphene api-key create <name>
graphene api-key list
graphene api-key revoke <id>
```

## Project and runtime setup

```bash
graphene init
graphene init --project <name> --workspace <handle> --gpu <gpu> --python <version>

graphene config
graphene config get
graphene config get <key>
graphene config set <key> <value>
```

Supported `config` keys:

- `gpu`
- `python`
- `python_runtime`
- `base_image`
- `system_layer.commands`

## Dependency management

```bash
graphene add <pkg>
graphene add <pkg1> <pkg2>
graphene add -r requirements.txt
graphene remove <pkg>
graphene sync
graphene deps list
```

## Execution

```bash
graphene run <cmd> [args...]
graphene run --no-upload <cmd> [args...]
graphene run --train <cmd> [args...]
graphene run --train --train-warm-idle-seconds <seconds> <cmd> [args...]
```

## Volume operations

```bash
graphene volume create <name>
graphene volume list
graphene volume delete <name>
graphene volume put <local_path> <volume>:/path
graphene volume get <volume>:/path <local_path>
graphene volume ls <volume>:/path
graphene volume rm <volume>:/path
```

## Commands that are not implemented yet

Do **not** treat these as supported today:

- `graphene status`
- `graphene logs`
- `graphene usage`
- `graphene deploy`
- `graphene project link`
- `graphene run --detach`
