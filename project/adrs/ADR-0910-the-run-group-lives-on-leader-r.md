---
id: ADR-0910
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0760]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0910. The Run group lives on leader R

## Decision

The Run group moves to `<leader>R`. (from https://github.com/meowshed/meowvim/pull/53, high)

## Why

To free `<leader>r` for Review.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Keep Run on `<leader>r` | no move | Review needed the key |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded: tasks now live under `<leader>x` Execute (`lua/config/keymaps.lua:1080`).

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
