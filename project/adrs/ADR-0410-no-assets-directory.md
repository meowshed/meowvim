---
id: ADR-0410
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0410. No assets directory

## Decision

The repository keeps no icons or screenshots. (from https://github.com/meowshed/meowvim/pull/43; https://github.com/meowshed/meowvim/pull/4#discussion_r2213674690, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Removing `assets/` reduces repository size.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Keep the icon and screenshots the owner asked for in pull request #4 | a visual README | repository size |

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
