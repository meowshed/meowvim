---
id: ADR-0260
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0930]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0260. CI pins its user config

## Decision

CI writes a user config that pins the theme. (from .github/workflows/ci.yml:77-78, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The run is then reproducible.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Run with no user config | also works | the theme would depend on the defaults of the day |

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
