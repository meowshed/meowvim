---
id: ADR-0360
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0640]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0360. Copilot is opt-in

## Decision

Copilot is off until the user turns it on. (from https://github.com/meowshed/meowvim/pull/24; https://github.com/meowshed/meowvim/pull/43, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

It makes Copilot easy to disable.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Copilot always on | suggestions with no setup | users could not easily turn it off |

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
