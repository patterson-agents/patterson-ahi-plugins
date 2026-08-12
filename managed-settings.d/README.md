# `managed-settings.d/`

Placeholder for this repository's layer in the Patterson layered-settings model.

The managed tier of Claude Code settings is winner-take-all: a single
`managed-settings.json` replaces rather than merges. `managed-settings.d/` is the only
mechanism that merges, and it merges alphabetically by filename. `patterson-corp` carries
the worked demonstration of that model across four organizational tiers
(`10-enterprise.json`, `20-suborg.json`, `30-department.json`, `40-team.json`) — see
`patterson-corp/managed-settings.d/` and its `docs/architecture/layered-settings.md` once
that demonstration merges.

`patterson-ahi-plugins` sits at the **sub-org** tier: `patterson-corp`'s `20-suborg.json`
layer is where this repository (alongside `patterson-dental` and `patterson-vet`) is
expected to be named as an `extraKnownMarketplaces` entry, extending the enterprise layer
rather than replacing it.

No layer files exist here yet. This is advisory scaffolding, not enforcement — nothing in
this repository sets a managed-settings enforcement switch.
