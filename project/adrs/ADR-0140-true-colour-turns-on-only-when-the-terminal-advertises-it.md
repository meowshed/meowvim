---
id: ADR-0140
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0130]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0140. True colour turns on only when the terminal advertises it

## Decision

`termguicolors` is set only when `COLORTERM`, `TERM` or `TERM_PROGRAM` says the terminal supports true colour. (from docs/01-INSTALLATION.md:60-61; docs/04-TROUBLESHOOTING.md:40-41; https://github.com/meowshed/meowvim/pull/51, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Forcing it under a multiplexer that doesn't support it causes partial redraws and rendering artefacts.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: always on | richer colours in every terminal that supports them | artefacts in terminals that don't advertise it |

## What it costs

A capable terminal that doesn't advertise true colour gets 256 colours.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
