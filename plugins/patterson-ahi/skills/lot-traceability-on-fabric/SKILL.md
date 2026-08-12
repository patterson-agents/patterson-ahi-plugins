---
name: lot-traceability-on-fabric
description: >-
  Use when designing or querying lot-level traceability data on Microsoft Fabric, scoping a
  recall trace, laying out medallion architecture for AHI distribution data, or setting
  retention on traceability records.
license: LicenseRef-Patterson-Internal
---

# Lot traceability on Microsoft Fabric

Animal Health International's data position is lot-level traceability records, which carry
regulatory retention obligations rather than privacy ones. That position drives every
choice below: the model exists so that "which customers received lot X" is answerable in
minutes with an auditable lineage, for as long as the regulator requires.

## Platform shape

- **OneLake** is the single storage layer. One copy of the data; everything else is a
  shortcut or a view over it.
- **Lakehouse (Delta) tables** hold the traceability records. Delta gives ACID writes and
  a queryable history, which matters when a trace result must be defensible.
- **Power BI semantic models** serve producer, route, and recall reporting from the gold
  layer only — never from bronze or silver.
- Capacity, workspace, environment tiering, and data classification are governed by the
  `patterson-engineering` standards (`azure-environment-standards`,
  `storage-data-standards`), consumed by reference from `patterson-corp`. Do not restate
  or fork those rules here.

## Medallion layout

| Layer | Contents | Grain |
| --- | --- | --- |
| Bronze | Raw ERP, WMS, and carrier feeds: receipts, lot assignments, shipments, deliveries, temperature excursions — as received, immutable | Source-system record |
| Silver | Conformed entities: lot, product, shipment, delivery, customer, location — deduplicated, typed, keyed | One row per entity occurrence |
| Gold | Lot-to-delivery trace marts, recall-scope views, and territory-economics inputs (cost per stop, contribution per stop) | One row per lot-delivery pair; one row per stop |

## Modeling rules

- **Lot is a first-class key**, not an attribute. Every movement record carries it from
  receipt to delivery. A feed that drops the lot number is a defect in the feed, not a
  gap to interpolate.
- **Trace to the delivery, not the order.** The regulatory question is what physically
  arrived where. Model at delivery-line grain.
- **Record gaps explicitly.** Where lot-level lineage is unavailable for a line, write an
  explicit gap record rather than an estimated linkage — mirroring the rule in
  `handle-product-recall`. A recall trace that silently interpolates is worse than one
  that reports its own holes.
- **One definition per number.** The gold recall-scope view is the single source for
  "shipped quantity of lot X"; no report computes it independently.

## Shortcuts, not copies

Use OneLake shortcuts to reach data that lives in another workspace, ADLS Gen2 account, or
external source. A shortcut keeps one authoritative copy and one lineage; a pipeline that
duplicates the data creates a second version of the truth that a trace can disagree with.

## Retention

Delta time travel is a development convenience, not a retention policy: `VACUUM` removes
history, and table history is bounded by retention settings. Regulatory retention for
traceability records must be implemented deliberately — retained tables or exported
snapshots with an explicit retention schedule.

The actual obligations by record type and jurisdiction are
`[TBD: internal regulatory register not yet linked]`. Until that is filled, treat
traceability records as delete-never.

## Reporting

- Recall and route dashboards read the gold layer through a Power BI semantic model with
  explicit relationships — lot to shipment to delivery to customer.
- Design for the field constraint recorded in `references/brand.md`: used outdoors, on
  phones, on poor connections. A recall-scope view a rep opens in a feedlot must load a
  short, filtered result — not a 10,000-row matrix.

## Where the data lives

Which Fabric capacities, workspaces, and lakehouses hold AHI data is
`[TBD: Fabric tenant and workspace inventory not yet specified]` — a standing question for
the `bootstrap-animal-health-intl` interview.
