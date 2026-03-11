# Graphene CLI Skill Research And Plan

This note captures the working conclusions behind the Graphene CLI skills in this repository.

## Primary sources

### OpenAI

1. [Codex Skills](https://developers.openai.com/codex/skills)
2. [Codex Prompting Guide](https://cookbook.openai.com/examples/gpt-5/codex_prompting_guide)
3. [Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)
4. [Agents Guide](https://platform.openai.com/docs/guides/agents)
5. [Prompt Caching Guide](https://platform.openai.com/docs/guides/prompt-caching)

### Anthropic

1. [Agent Skills Best Practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
2. [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
3. [Claude Code Subagents](https://docs.anthropic.com/en/docs/claude-code/sub-agents)
4. [Prompt Engineering Overview](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)

## Core conclusions

1. The top-level skill/subagent file should be a router, not a long manual.
2. Detailed procedures should live in referenced docs.
3. Supported commands must match the real CLI, not the aspirational product spec.
4. Graphene environment targeting is currently baked into the binary, so the first preflight check should be `graphene version`.
5. Skills should optimize for command selection and failure avoidance, not product education.

## Recommended structure

Use one shared reference set and thin wrappers per agent.

```text
shared/graphene-cli/*
codex/graphene-cli/*
.claude/agents/*
```

## Validation principle

The skill is only good if an agent can use it to drive the real Graphene CLI without:

1. calling unsupported commands
2. mixing up dev and prod binaries
3. misusing `--no-upload`
4. misunderstanding `run --train`
