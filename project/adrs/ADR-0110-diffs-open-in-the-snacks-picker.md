---
id: ADR-0110
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-1100]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0110. Diffs open in the snacks picker

## Decision

`snacks.picker.git_diff` shows diffs. (from TODO.md:14-15; commit e1da177, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

It shows the same hunks fullscreen without a second plugin.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| diffview.nvim | a dedicated diff layout | a second plugin for what the picker already shows |

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
