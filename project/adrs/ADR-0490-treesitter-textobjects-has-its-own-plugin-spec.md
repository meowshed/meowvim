---
id: ADR-0490
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0490. Treesitter textobjects has its own plugin spec

## Decision

nvim-treesitter-textobjects is configured in its own spec. (from https://github.com/meowshed/meowvim/pull/35; https://github.com/meowshed/meowvim/pull/32, medium)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Not recorded.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Configure it inside the nvim-treesitter spec | one file | pull request #35 reversed it without a reason |

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
