# Getting started

`patterson-ahi-plugins` is the Animal Health International domain marketplace: a
sub-organization catalog for agent capability specific to Patterson's production animal
distribution business, serving cattle, dairy, swine, poultry, and equine operations.

## Install the marketplace

From a clone of the repository:

```bash
cd patterson-ahi-plugins
claude
/plugin marketplace add .
```

Or directly from GitHub:

```bash
/plugin marketplace add patterson-agents/patterson-ahi-plugins
```

## Install the plugin

```bash
claude plugin install patterson-ahi@patterson-ahi-plugins
```

That brings in the company profile (`COMPANY.md`), six domain agents, and four skills.

## What arrives by reference

Enterprise standards are not copied into this catalog. The repository's
`.claude/settings.json` enables two `patterson-corp` plugins alongside it:

| Plugin | What it provides |
| --- | --- |
| `patterson-engineering@patterson-corp` | CI/CD pipeline, Azure environment, compute, storage and data, and monitoring standards |
| `patterson-brand@patterson-corp` | Palette, typography, copy style, voice and tone |

## Validate a change

```bash
sh tests/run-tests.sh          # manifest, skill names, forbidden content
claude plugin validate .       # the canonical marketplace check
```

> [!NOTE]
> The catalog follows the Patterson platform conventions: no Python, no emoji on brand
> surfaces, kebab-case names, conventional commits, and `[TBD]` markers instead of
> invented facts.
