---
id: ADR-0450
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0710, REQ-0720]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0450. Hidden files are visible by default

## Decision

Every picker and the explorer show hidden files by default. (from https://github.com/meowshed/meowvim/issues/2; https://github.com/meowshed/meowvim/pull/3, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The issue asked to see dotfiles such as `.git` and `.config`.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Hidden by default with a toggle | less noise | the issue asked for dotfiles to be visible |

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
