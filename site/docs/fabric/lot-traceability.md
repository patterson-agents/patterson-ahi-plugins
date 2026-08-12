# Lot traceability on Microsoft Fabric

Animal Health International's data position is lot-level traceability records, which
carry regulatory retention obligations rather than privacy ones. The
`lot-traceability-on-fabric` skill encodes the platform design: "which customers received
lot X" must be answerable in minutes, with an auditable lineage, for as long as the
regulator requires.

## Platform shape

- **OneLake** is the single storage layer - one copy of the data; everything else is a
  shortcut or a view over it.
- **Lakehouse (Delta) tables** hold the traceability records; ACID writes and a queryable
  history keep trace results defensible.
- **Power BI semantic models** serve producer, route, and recall reporting from the gold
  layer only.
- Capacity, workspace, and classification governance defers to the
  `patterson-engineering` Azure standards, consumed by reference.

## Medallion layout

| Layer | Contents | Grain |
| --- | --- | --- |
| Bronze | Raw ERP, WMS, and carrier feeds - receipts, lot assignments, shipments, deliveries, temperature excursions | Source-system record |
| Silver | Conformed entities - lot, product, shipment, delivery, customer, location | One row per entity occurrence |
| Gold | Lot-to-delivery trace marts, recall-scope views, territory-economics inputs | One row per lot-delivery pair; one row per stop |

## Modeling rules

- Lot is a first-class key, not an attribute. A feed that drops the lot number is a
  defect in the feed, not a gap to interpolate.
- Trace to the delivery, not the order - the regulatory question is what physically
  arrived where.
- Record gaps explicitly. A recall trace that silently interpolates is worse than one
  that reports its own holes.
- One definition per number: the gold recall-scope view is the single source for
  "shipped quantity of lot X".

## Retention

Delta time travel is a development convenience, not a retention policy: `VACUUM` removes
history. Regulatory retention must be implemented deliberately - retained tables or
exported snapshots on an explicit schedule. Until the internal regulatory register is
linked, traceability records are treated as delete-never.

> [!NOTE]
> Which Fabric capacities, workspaces, and lakehouses hold AHI data is a recorded gap,
> owned by the `bootstrap-animal-health-intl` interview.
