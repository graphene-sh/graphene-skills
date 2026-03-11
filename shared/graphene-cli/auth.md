# Graphene CLI Authentication

Graphene supports browser login and API key login.

## Browser login

```bash
graphene login
```

Current UX:

1. The CLI immediately creates a login session.
2. It prints a browser URL.
3. You open that URL manually.
4. After approval, the CLI stores credentials locally and prints the logged-in identity.

Use browser login when a human is available to complete the Google OAuth flow.

## API key login

```bash
graphene login --api-key <token>
```

Use this when:

1. a PAT already exists
2. browser interaction is not desired
3. an agent needs a pre-issued token

## Check current identity

```bash
graphene whoami
```

This prints:

1. user id
2. display name or email if available
3. visible workspaces

## Logout

```bash
graphene logout
```

This removes local credentials and asks the server to revoke the active session.

## PAT lifecycle

Create:

```bash
graphene api-key create <name>
```

List:

```bash
graphene api-key list
```

Revoke:

```bash
graphene api-key revoke <id>
```

## Auth workflow recommendation

For manual setup:

```bash
graphene login
graphene whoami
```

For automation that already has a token:

```bash
graphene login --api-key <token>
graphene whoami
```
