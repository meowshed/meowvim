---
id: ADR-0210
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0800]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0210. The docs check runs inside a started Neovim

## Decision

`bin/check-docs.lua` runs with `luafile` after startup. (from bin/check-docs.lua:9-10, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

`nvim -l` runs the script without loading the configuration, so no mapping exists yet.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `nvim -l` | a simpler invocation | no mapping exists when the script runs |

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
