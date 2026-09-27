---
id: ADR-0050
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0630]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0050. prettier follows the project's configuration

## Decision

prettier runs without a hardcoded tab width, so it reads a project's `.prettierrc`. (from https://github.com/meowshed/meowvim/pull/30, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

More flexible and conventional behaviour.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: `--tab-width 2` | the same output everywhere | overrode each project's own prettier settings |

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
