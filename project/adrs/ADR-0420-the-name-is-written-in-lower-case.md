---
id: ADR-0420
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0860]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0420. The name is written in lower case

## Decision

The project's name is written "meowvim". (from https://github.com/meowshed/meowvim/pull/21, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Consistency across the README, the scripts and the configuration.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| "Meowvim" | reads as a proper noun | inconsistent with the rest of the repository |

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
