# Agents

Six agents ship with the plugin. Mention them as `patterson-ahi:<name>`.

| Agent | Title | Use for |
| --- | --- | --- |
| `production-animal-lead` | Production Animal Lead | Direction, volume-versus-margin calls on large accounts, acquisition integration |
| `producer-account-specialist` | Producer Account Specialist | Species economics, seasonal purchasing, protocol-driven ordering |
| `logistics-analyst` | Distribution and Freight Analyst | Routes, freight cost per order, cold chain, territory serviceability |
| `compliance-specialist` | Regulatory and Compliance Specialist | Feed directives, controlled substances, state licensing, recall handling |
| `marketing-strategist` | Marketing Strategist | Positioning, campaign planning, customer-facing copy review |
| `data-engineer` | Data Engineer | Data models, pipelines, Fabric lakehouse design, where a number comes from |

## Reporting lines

`production-animal-lead` sits at the top; the other five report to it.

## What is deliberately absent

The deep engineering bench - staff, service, interface, reliability, quality, and security
engineers, plus product design and technical writing - arrives by reference through
`patterson-engineering@patterson-corp` and `patterson-brand@patterson-corp` rather than
being duplicated in this plugin.

> [!IMPORTANT]
> Delegation across reporting lines requires `CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH`
> above 1; below that, the org collapses into a single agent doing everything itself.
