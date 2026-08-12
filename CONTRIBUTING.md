# Contributing to patterson-ahi-plugins

`patterson-ahi-plugins` follows the same contribution process as every Patterson
agent-configuration repository. The canonical process — the OpenSpec proposal workflow,
repository conventions (zero-dependency TypeScript, erasable syntax, kebab-case, the `[TBD]`
marker, conventional commits), and the pull request checklist — lives in
[`patterson-corp/CONTRIBUTING.md`](https://github.com/patterson-agents/patterson-corp/blob/main/CONTRIBUTING.md).
Read that first; this document only adds what is specific to proposing production-animal
domain skills.

## Licensing

This repository carries the Patterson Companies Internal Use License
(`LicenseRef-Patterson-Internal`, see [`LICENSE`](LICENSE)). Every plugin manifest and
skill frontmatter declares that identifier. Do not add third-party content whose license
is unverified — mark the gap `[TBD]` and defer, as the `lot-traceability-on-fabric` skill
does for the Microsoft-authored `fabric-lakehouse` skill.

## Proposing a production-animal domain skill

This repository is a **sub-org** marketplace: capability particular to Animal Health
International, Patterson's production animal distribution business, as opposed to
`patterson-corp` (true for all of Patterson) or `patterson-labs` (not yet durable status
anywhere). Before proposing a new skill or plugin here:

1. Confirm the capability is genuinely production-animal-specific. If it would also be true
   for dental or companion-animal veterinary, or for Patterson generally, it belongs in
   `patterson-dental`, `patterson-vet`, or `patterson-corp` instead — not duplicated here.
2. Name a source of truth for every domain assertion. The public range/location/services
   source is `https://www.animalhealthinternational.com/`; internal sources (regulatory
   register, brand guidelines, Fabric workspace inventory) are `[TBD]` — see
   [`REFERENCES.md`](REFERENCES.md). Do not invent a policy to fill a gap; mark it
   `[TBD: what is missing]` and escalate.
3. Follow the same skill shape `patterson-corp` uses: `SKILL.md` with frontmatter `name` equal
   to its directory, `REFERENCES.md`, and `_SOURCES.md` wherever the content has a traceable
   origin.
4. Register the new plugin in `.claude-plugin/marketplace.json` with a `./`-prefixed `source`.
5. Run `sh tests/run-tests.sh` and `claude plugin validate .` before opening a pull request.

Conventional commits, kebab-case, and the `[TBD]` marker for unknown facts all apply exactly as
in `patterson-corp`.
