---
id: ADR-0040
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0620]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0040. conform.nvim is the only formatter

## Decision

Formatting goes through conform.nvim, and the language servers' own document formatting is turned off. (from https://github.com/meowshed/meowvim/pull/30, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

One source of truth for formatting.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: let servers format too | no extra plugin for servers that format | two formatters could disagree on the same buffer |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. `lua/plugins/nvim-lspconfig.lua:125-128, 152-160` turn server formatting off.

## What this does not settle

- Anything beyond the choice the source records.
