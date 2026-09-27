---
id: ADR-0890
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0694]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0890. TypeScript inlay hints are pruned

## Decision

TypeScript inlay hints show return types, property declarations and enum values, and hide variable types and parameter names the code already shows. (from https://github.com/meowshed/meowvim/pull/34; https://github.com/meowshed/meowvim/pull/30, high)

## Why

Redundant hints are visual noise.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Every hint #30 enabled | the most information | redundant hints crowded the code |

## What it costs

Not recorded in the sources.

## What would reverse it

- A source records that the need it serves has changed.

## Consequences

JavaScript buffers still show variable types (`lua/plugins/nvim-lspconfig.lua:144-146`).

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
