---
id: ADR-0430
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0300]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0430. The user config is a plain Lua table

## Decision

`~/.config/meowvim/config.lua` returns a plain Lua table. (from https://github.com/meowshed/meowvim/pull/47, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The builder API the docs described didn't exist.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| A builder DSL | a fluent syntax | it was never implemented |

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
