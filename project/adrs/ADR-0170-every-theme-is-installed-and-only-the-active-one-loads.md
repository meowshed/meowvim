---
id: ADR-0170
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0410]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0170. Every theme is installed and only the active one loads

## Decision

All 17 colorschemes are installed, and only the active one loads at startup. (from docs/02-CONFIGURATION.md:198-200, low)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Switching then costs a load and not a download.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Download a theme when the user switches to it | a smaller install | switching would need the network and take longer |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
