# References — patterson-ahi-plugins

Authoritative sources for the production-animal domain capability this repository holds.

> [!IMPORTANT]
> One public source is named; the internal sources are placeholders, not invented
> answers — fill them in only when a real, citable source exists. Every `[TBD]` below is a
> standing question for the `bootstrap-animal-health-intl` interview skill.

## Domain sources

| Area | Canonical source | Status |
|---|---|---|
| Production animal product range, locations, and services | [`https://www.animalhealthinternational.com/`](https://www.animalhealthinternational.com/) | named |
| Regulatory register (veterinary feed directives, controlled substance requirements by state) | `[TBD: internal regulatory register not yet linked]` | not started |
| Internal brand guidelines (logo usage, colour, typography, naming) | `[TBD: internal brand portal not yet linked]` | not started |
| Microsoft Fabric tenant and workspace inventory for AHI analytics | `[TBD: Fabric tenant/workspace inventory not yet specified]` | not started |
| Internal cost and margin sources for territory economics | `[TBD: internal cost and margin sources not yet linked]` | not started |

Per-skill sources live in each skill's own `REFERENCES.md` under
`plugins/patterson-ahi/skills/<name>/`, rather than being duplicated here — mirroring the
`sys_kb_id` table convention in
[`patterson-corp/REFERENCES.md`](https://github.com/patterson-agents/patterson-corp/blob/main/REFERENCES.md)
for ServiceNow-sourced standards. Carry a `[TBD: ...]` row for anything the named source is
silent on, per [`CONTRIBUTING.md`](CONTRIBUTING.md) and the platform-wide provenance
convention in `patterson-corp/README.md` § Provenance and gaps.

## Cross-repository context

| Catalog | Role |
|---|---|
| [`patterson-corp`](https://github.com/patterson-agents/patterson-corp) | Enterprise — capability true for all of Patterson |
| [`patterson-labs`](https://github.com/patterson-agents/patterson-labs) | Incubating — work that has not yet earned durable status |
| [`patterson-dental`](https://github.com/patterson-agents/patterson-dental) | Sub-org — dental-specific capability |
| [`patterson-vet`](https://github.com/patterson-agents/patterson-vet) | Sub-org — veterinary-specific capability |
| `patterson-ahi-plugins` | Sub-org — production-animal capability, Animal Health International (this repository) |
