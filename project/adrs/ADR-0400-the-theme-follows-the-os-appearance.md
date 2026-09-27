---
id: ADR-0400
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0400]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0400. The theme follows the OS appearance

## Decision

In auto mode, meowvim reads the system appearance itself and switches between a day theme and a night theme. (from https://github.com/meowshed/meowvim/pull/43; https://github.com/meowshed/meowvim/pull/44, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The native OS integration made the `.meow` theme sync examples obsolete.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| The `.meow` theme sync script | one script for every tool | the native integration replaced it |

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
