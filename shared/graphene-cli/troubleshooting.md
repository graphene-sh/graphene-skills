# Graphene Troubleshooting

## `error: not logged in. run: graphene login`

Fix:

```bash
graphene login
graphene whoami
```

## `error: graphene.toml not found. run: graphene init`

Fix:

```bash
graphene init
```

Or move into the project root that already contains `graphene.toml`.

## Wrong environment target

Symptom:

```bash
graphene version
```

shows the wrong server or target.

Fix:

Use the correct baked binary for the environment. Do not assume runtime server switching exists.

## `--no-upload` command cannot find files

Cause:

The command needs local code, but the current directory was not uploaded.

Fix:

Remove `--no-upload`.

## Unsupported command confusion

If you are about to use one of these, stop:

- `graphene status`
- `graphene logs`
- `graphene usage`
- `graphene deploy`
- `graphene project link`
- `graphene run --detach`

These are not currently supported in the working CLI surface.

## Browser login opens a URL but waits

This is expected.

`graphene login` currently prints a URL and waits for approval. Open the URL manually in a browser.

## `graphene init` says multiple workspaces are available

Fix:

```bash
graphene init --workspace <handle>
```
