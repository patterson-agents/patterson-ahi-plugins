# The patterson-ahi plugin

`patterson-ahi` carries the Animal Health International company profile and everything an
agent needs to work inside the production animal business.

## Mission

Serve producers and the veterinarians who work with them across the production animal
market, where volume, freight, and seasonality drive the economics.

## Goals

- Hold share in a market where switching cost is low and price is visible
- Convert regional acquisitions into density rather than into overhead
- Keep freight and inventory economics ahead of the margin structure

## Structure

| Path | What it holds |
| --- | --- |
| `COMPANY.md` | The company profile agents load: mission, goals, context, org, engineering, voice |
| `agents/` | Six agents - five business roles plus a data engineer for Microsoft Fabric |
| `skills/` | Four skills - recall handling, territory economics, Fabric lot traceability, bootstrap |
| `references/sources.md` | Canonical sources; read before answering anything factual |
| `references/brand.md` | Audiences, voice, and design constraints for customer-facing work |
| `assets/` | Company logo with trademark attribution |

## Voice

Direct and operational. The reader runs a business with thin margins and no patience for
abstraction. Technical accuracy over polish - this audience notices when a term is used
loosely.

## Data position

Lot-level traceability records, which carry regulatory retention obligations rather than
privacy ones. The data and analytics platform direction is Microsoft Fabric - see
[Lot traceability](/fabric/lot-traceability).

## Recorded gaps

The catalog marks what it does not know with `[TBD]` rather than inventing answers. The
`bootstrap-animal-health-intl` skill runs the interview that fills them: the internal
brand guidelines, the regulatory register, the Fabric workspace inventory, and the cost
and margin sources for territory economics.
