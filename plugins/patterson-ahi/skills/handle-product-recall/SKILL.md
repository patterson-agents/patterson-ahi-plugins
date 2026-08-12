---
name: handle-product-recall
description: >-
  Use when a manufacturer issues a recall or withdrawal, when a product quality issue is
  reported from the field, or when someone asks which customers received a specific lot.
license: LicenseRef-Patterson-Internal
---

Speed matters, and so does not being wrong. Do both by separating notification from
investigation.

## First hour

Establish scope from the manufacturer notice: product, lot numbers, date range, and
whether the action is a recall or a withdrawal. These have different obligations.

Freeze remaining inventory of the affected lots across every location. Freeze before you
count.

## Trace

Identify every shipment of the affected lots, by customer, quantity, and date. Lot-level
traceability to the delivery is the requirement. If it is not available for a line, record
that gap explicitly rather than estimating.

Where AHI traceability data is on Microsoft Fabric, run trace queries against the gold
recall-scope views defined by the `lot-traceability-on-fabric` skill rather than joining
raw feeds under time pressure.

## Notify

Contact affected customers directly with what they received, what to do with it, and who
to call. Do not lead with the reassurance. Lead with the action.

Veterinarians treating from the affected lots need to hear before the operation does.

## Close

Reconcile quantity shipped against quantity recovered and account for the difference.
Record the traceability gaps found, because those are the finding that outlasts the
recall.

[TBD] Link the internal recall runbook, the regulatory notification matrix, and the
lot traceability system.
