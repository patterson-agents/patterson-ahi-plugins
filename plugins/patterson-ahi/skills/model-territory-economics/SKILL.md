---
name: model-territory-economics
description: >-
  Use when evaluating whether to serve a new production animal territory, when a route is
  losing money, or when assessing whether a regional acquisition will pay for itself.
license: LicenseRef-Patterson-Internal
---

A territory is profitable when density carries the fixed cost of reaching it. Everything
else is a second-order effect.

## Build the model in this order

1. **Demand.** Operations by species and size, and the share currently served by a
   competitor with better density.
2. **Route.** Stops per run, miles between them, and the drive time to the nearest
   distribution center.
3. **Cost per stop.** Fixed route cost divided by realistic stop count, not by target
   stop count.
4. **Contribution per stop.** Average order value times gross margin rate for the species
   mix present.
5. **Break-even density.** Stops per run at which contribution covers cost.

## Then test it

Compare break-even density against the density achievable from customers who will
plausibly switch within twelve months. Not the total addressable count.

Model the seasonal trough rather than the average. A route that only works during
processing season does not work.

## Decide

Below break-even, the options are a partner carrier, a smaller vehicle, or not serving
the territory. Adding a salesperson does not change the arithmetic.

[TBD] Wire in the internal cost and margin sources before using this for a real decision.
