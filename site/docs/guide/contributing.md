# Contributing

The canonical process - the OpenSpec proposal workflow, repository conventions, and the
pull request checklist - lives in
[`patterson-corp/CONTRIBUTING.md`](https://github.com/patterson-agents/patterson-corp/blob/main/CONTRIBUTING.md).
This catalog's own [`CONTRIBUTING.md`](https://github.com/patterson-agents/patterson-ahi-plugins/blob/main/CONTRIBUTING.md)
adds what is specific to proposing production-animal domain skills.

## The short version

1. Confirm the capability is genuinely production-animal-specific.
2. Name a source of truth for every domain assertion; mark gaps `[TBD]` rather than
   inventing an answer.
3. Follow the skill shape: `SKILL.md` with frontmatter `name` equal to its directory,
   plus `REFERENCES.md` and `_SOURCES.md`.
4. Register the plugin in `.claude-plugin/marketplace.json` with a `./`-prefixed source.
5. Run `sh tests/run-tests.sh` and `claude plugin validate .` before opening a pull
   request.

## Licensing

The repository ships the Patterson Companies Internal Use License
(`LicenseRef-Patterson-Internal`). Every plugin manifest and skill frontmatter declares
that identifier.
