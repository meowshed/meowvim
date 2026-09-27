---
id: ADR-0390
artifact: adr
status: approved
revised: 2026-09-27
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0390. No AI agent configuration in the repository

## Decision

The repository keeps no configuration for an AI agent. (from https://github.com/meowshed/meowvim/pull/36, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

Removing `.meowg1k.yml` reduces repository clutter.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `.meowg1k.yml` | shared agent settings | clutter in the repository |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Whether `CLAUDE.md` and `.meowpaw/`, added later, count as agent configuration under this decision.
