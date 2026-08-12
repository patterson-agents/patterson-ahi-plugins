---
name: bootstrap-animal-health-intl
description: >-
  Use when setting up, initializing, configuring, or onboarding the Animal Health
  International company plugin for real use, when filling in its [TBD] gaps, or when
  someone asks to capture this company's references, brand, coding standards, or team
  conventions.
license: LicenseRef-Patterson-Internal
---

# Bootstrap Animal Health International

This plugin ships with the shape of a company and only its publicly sourced specifics.
This skill runs the interview that fills in the rest and lands the answers directly in
this repository's files.

> [!IMPORTANT]
> Enter plan mode before the first question and stay in it for the whole interview.
> Nothing is written until the interview is complete and the person has approved the
> plan. An interview that produces files halfway through cannot be abandoned cleanly.

## Method

- Ask one section at a time, in the order below. Do not batch sections.
- An answer counts when it names a source, a system, a value, or a rule — not an
  intention. "We should probably use X" is not an answer; record it as an open question.
- Anything the person cannot answer stays `[TBD]` verbatim. Do not resolve a gap with a
  plausible guess. An unfilled `[TBD]` gets noticed; an invented answer does not.

## What this company already claims

Confirm or correct each of these before asking anything new. A wrong fact left in
place propagates into every agent in the plugin.

- Patterson acquired Animal Health International in June 2015 for 1.1 billion dollars in cash, more than doubling the size of its animal health supply business and adding a leading production animal supply business.
- The production animal business acquired the operating assets of Mountain Vet Supply, a regional distributor headquartered in Fort Collins, Colorado, extending presence in the production and companion animal market.
- Production animal customers include producers, feed operations, and retailers as well as veterinarians.

## Known gaps

Each line is a question this catalog already knows it cannot answer. Work through them one at a time.

- Application stack beyond the Microsoft Fabric data platform: not established in this catalog
- Internal source: Brand guidelines. Logo usage, colour, typography, and naming rules. Link the internal brand portal here.
- Internal source: Regulatory register. Feed directive and controlled substance requirements by state
- Internal source: Microsoft Fabric tenant and workspace inventory. Which capacities, workspaces, and lakehouses hold AHI traceability data.
- Internal source: Cost and margin sources for `model-territory-economics`

## Standing sections

Ask these for every company, in this order. Do not batch them.

### 1. Sources

- Which public page is authoritative for the current product or service list, and who owns it?
- Which internal system is the record for pricing, contract terms, and performance figures?
- Where does someone check whether a public page has gone stale?
- What must never be quoted from a public page?

### 2. Brand and assets

- Where do the current logo files live, and which variants exist?
- What are the usage rules: clear space, minimum size, permitted backgrounds, what is forbidden?
- Colour values and typefaces, with the licence position on the typefaces.
- Naming rules: how is the product written, capitalised, and abbreviated, and what is wrong?
- Current voice reads as: Direct and operational. The reader runs a business with thin margins and no patience for abstraction. Is that right, and what would you change?

### 3. Coding standards

Working stack on record: Microsoft Fabric for data and analytics; the application stack
beyond that is `[TBD] not established in this catalog`.

- Languages and versions actually in use, including the ones you wish were not.
- Formatter and linter, with the config location. Is it enforced in CI or by convention?
- Test framework, and what level of coverage is genuinely expected before merge.
- Branch model, commit message rules, and whether history is squashed.
- Review rules: how many approvals, who must review what, and what blocks a merge.
- Dependency policy: what may be added, who approves, and how updates are handled.
- What a new engineer gets wrong in their first week.

### 4. Team conventions

- Who owns what, by name of role rather than person.
- Where work is tracked, and what the states mean here.
- Definition of done, stated as something observable.
- Release cadence, and who decides a release goes.
- On-call arrangement, escalation path, and what counts as an incident.
- The meetings that exist and what each one decides.

### 5. Roster

The plugin currently ships these agents:

- `production-animal-lead` Production Animal Lead
- `producer-account-specialist` Producer Account Specialist
- `logistics-analyst` Distribution and Freight Analyst
- `compliance-specialist` Regulatory and Compliance Specialist
- `marketing-strategist` Marketing Strategist
- `data-engineer` Data Engineer

Deep engineering, design, and writing roles arrive by reference through
`patterson-engineering@patterson-corp` and `patterson-brand@patterson-corp`.

- Which of these does not match a real responsibility here?
- Which real responsibility has no agent?
- Which agent needs domain knowledge it does not currently carry, and what is that knowledge?

### 6. Skills

The plugin currently ships:

- `model-territory-economics`
- `handle-product-recall`
- `lot-traceability-on-fabric`

- Which recurring task takes longest and is done from memory rather than from a written procedure?
- What has gone wrong more than twice that a written procedure would have prevented?
- Which of the shipped skills describes the work incorrectly?

## Output

This repository is hand-maintained — there is no generator, so answers land directly in
the files they belong to, on a branch, through a pull request:

1. Confirmed or corrected facts: `COMPANY.md` Context section
2. Sources and stale-`[TBD]` replacements: `references/sources.md` and the root `REFERENCES.md`
3. Brand answers: `references/brand.md`
4. Stack, standards, and conventions: `COMPANY.md` Engineering section, plus new skill or
   reference files where a written procedure emerged
5. Roster changes: files under `agents/`
6. Open questions the interview could not close: recorded verbatim as `[TBD: ...]` in the
   file where the answer belongs

Run `sh tests/run-tests.sh` and `claude plugin validate .` before opening the pull request.
