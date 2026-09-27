---
id: ADR-0120
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0500]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0120. Neovim's built-in gr mappings stay

## Decision

`grn`, `grr`, `gri`, `gra`, `grt` and `grx` stay beside their leader equivalents, and `gr` is a which-key group. (from TODO.md:17-22, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The built-ins are muscle memory for anyone arriving from stock Neovim, and the leader versions open a peek window where the built-ins jump.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Unmap the built-ins | one mapping per action | it breaks habits from stock Neovim and loses the jump behaviour |

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
