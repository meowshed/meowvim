---
id: ADR-0220
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0810]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0220. Only the help file must document every command

## Decision

Only `doc/meowvim.txt` has to carry a tag for every user command. (from bin/check-docs.lua:134-136, medium)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

That file is the reference a user reaches through `:help`.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Require every doc to list every command | complete guides | the guides would repeat the reference |

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
