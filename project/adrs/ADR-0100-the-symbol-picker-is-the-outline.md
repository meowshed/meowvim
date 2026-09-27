---
id: ADR-0100
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0520]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0100. The symbol picker is the outline

## Decision

`<leader>ns` lists document symbols in the picker and serves as the outline. No persistent outline pane is installed. (from TODO.md:10-12, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The picker keeps its tree open, which covers most of what an outline pane gives.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| aerial.nvim | a persistent outline pane | the picker already covers most of it |

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
