---
id: ADR-0930
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0615]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0930. Parsers install synchronously from a large list

## Decision

A large list of parsers installs synchronously on first start. (from https://github.com/meowshed/meowvim/pull/22, high)

## Why

A more straightforward first setup, with less manual configuration.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Install on demand (#21) | a faster first start | needed manual installs for common file types |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded: the list now installs asynchronously on every start (`lua/plugins/nvim-treesitter.lua:33-61`).

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
