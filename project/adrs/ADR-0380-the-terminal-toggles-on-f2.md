---
id: ADR-0380
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0592]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0380. The terminal toggles on F2

## Decision

`<F2>` toggles the terminal. (from https://github.com/meowshed/meowvim/pull/19, medium)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Not recorded.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `<F12>` | the key used before | pull request #19 gives no reason |

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
