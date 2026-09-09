# Agent skills

This is the portable catalog for my global coding-agent skills. The skills are installed once under `~/.agents/skills` and linked into agent-specific directories. Claude Code, Codex, and GitHub Copilot currently share the same set; `~/.claude/skills` is a symlink mirror, not a second source of truth.

The third-party skill bodies are intentionally not vendored here. `skills-lock.json` records their upstream locations so they can be restored from their maintainers and updated without copying several megabytes of generated or externally maintained content into this profile repository.

## Restore for a project

From the repository root:

```bash
npx skills experimental_install
```

This restores the catalog into the project's `.agents/skills` directory. The checked-in `.claude/skills` links expose that shared catalog to Claude Code without duplicating the skill bodies. Review upstream skills before using them because installed skills execute with the agent's permissions.

## Catalog

| Skill | Purpose | Upstream |
|---|---|---|
| `agent-development` | Claude Code subagent structure and prompt design | [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) |
| `ai-sdk` | Vercel AI SDK implementation guidance | [vercel/ai](https://github.com/vercel/ai) |
| `claude-api` | Current Claude API and Anthropic SDK reference | [anthropics/skills](https://github.com/anthropics/skills) |
| `claude-md-improver` | Audit and maintain `CLAUDE.md` files | [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) |
| `deploy-to-vercel` | Preview and production Vercel deployments | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `find-skills` | Discover installable agent skills | [vercel-labs/skills](https://github.com/vercel-labs/skills) |
| `impeccable` | UI design, critique, refinement, and browser-assisted review | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) |
| `use-envoy` | Operate the Envoy encrypted-environment CLI | [denizlg24/envoy](https://github.com/denizlg24/envoy) |
| `vercel-cli-with-tokens` | Token-authenticated Vercel CLI workflows | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-composition-patterns` | Scalable React component composition | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-optimize` | Evidence-backed Vercel cost and performance audits | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-react-best-practices` | React and Next.js performance patterns | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-react-native-skills` | React Native and Expo performance patterns | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-react-view-transitions` | React View Transition implementation patterns | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `web-design-guidelines` | Web UI and accessibility review | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `writing-guidelines` | Documentation voice and prose review | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |

## Claude-specific layer

- [`CLAUDE.md`](CLAUDE.md) contains the global interaction, workflow, typing, and delegation preferences.
- [`RTK.md`](RTK.md) is imported by `CLAUDE.md` and documents the token-optimized command proxy.
- [`.claude/agents`](.claude/agents) contains the `explorer`, `grunt`, `ui-engineer`, and `deep-reasoner` specialist definitions referenced by the routing rules.
- [`.claude/skills`](.claude/skills) contains relative links to the shared `.agents/skills` source restored from the lock file.

`impeccable` includes executable and browser-automation helpers and has been flagged as medium risk by automated installer assessments. Keep it sourced directly from its upstream repository and review changes when updating it.
