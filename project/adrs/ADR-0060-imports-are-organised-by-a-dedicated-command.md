---
id: ADR-0060
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0570]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0060. Imports are organised by a dedicated command

## Decision

`:LspOrganize` organises imports in TypeScript and JavaScript buffers, and its mapping is buffer-local to those buffers. (from https://github.com/meowshed/meowvim/pull/30; https://github.com/meowshed/meowvim/pull/31#discussion_r2475270957, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

A dedicated command gives more control than format-on-save, and the mapping only makes sense where the TypeScript server attaches.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Rely on format-on-save | no extra command | less control over when imports change |
| A global mapping | one place to find it | it would exist in buffers where it can't work |

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
