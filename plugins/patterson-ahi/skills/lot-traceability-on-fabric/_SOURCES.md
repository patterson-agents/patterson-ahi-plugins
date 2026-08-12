# Sources

Original content, written 12 August 2026 for this repository. Platform facts are cited to
Microsoft Learn (see `REFERENCES.md`); the domain rules (lot as first-class key, trace to
delivery, explicit gap records) restate the data position and recall rules already carried
by this plugin's `COMPANY.md` and `handle-product-recall`.

| Content | Origin | Confidence |
| --- | --- | --- |
| Fabric platform capabilities (OneLake, Lakehouse/Delta, shortcuts, Power BI) | Microsoft Learn public documentation | High — verify against current docs before relying on version-specific behavior |
| Medallion layout for AHI traceability | Original design applying the standard medallion pattern to this company's data position | Medium — a design proposal until validated against real feeds |
| Retention guidance | Microsoft Learn (Delta `VACUUM`/history) plus this plugin's regulatory-retention data position | High on the mechanism; the actual obligations are `[TBD]` |

> [!NOTE]
> A Microsoft-authored `fabric-lakehouse` skill (author `tedvilutis`) exists in the
> workspace-level `skills/` checkout. It was **not** vendored or copied here:
> `[TBD: its license is unverified — no LICENSE file and no skills-lock.json entry;
> verify against the upstream repository before any future vendoring]`.
