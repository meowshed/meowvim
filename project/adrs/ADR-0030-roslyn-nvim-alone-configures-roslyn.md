---
id: ADR-0030
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0670]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0030. roslyn.nvim alone configures Roslyn

## Decision

roslyn.nvim is the only place Roslyn is configured. (from https://github.com/meowshed/meowvim/pull/45; https://github.com/meowshed/meowvim/pull/29#discussion_r2408175116, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

A second, manual configuration in nvim-lspconfig started duplicate clients.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: both configurations | none recorded | two clients attached to the same buffer |

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
