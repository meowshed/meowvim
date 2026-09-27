---
id: ADR-0460
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0160]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0460. Language providers are disabled

## Decision

The Python, Ruby, Perl and Node providers are disabled. (from https://github.com/meowshed/meowvim/pull/52; init.lua:9, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

No plugin needs them, and disabling them clears the health warnings.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Leave the providers enabled | a plugin that needs one would work | no plugin needs one, and each warns in `:checkhealth` |

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
