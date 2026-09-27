---
id: ADR-0900
artifact: adr
status: superseded
revised: 2026-09-27
addresses: [REQ-0106]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0900. Image previews are off inside Zellij

## Decision

Image previews are turned off when Neovim runs inside Zellij. (from https://github.com/meowshed/meowvim/pull/52, high)

## Why

Zellij doesn't support the Kitty graphics protocol.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Hardcode the Kitty backend | images everywhere Kitty works | broke under Zellij |

## What it costs

Not recorded in the sources.

## What would reverse it

- It was reversed; see Consequences.

## Consequences

Superseded: the code no longer checks for Zellij (`lua/plugins/snacks.lua:21-28`).

## How I will know it was realised

1. The tree does what the Decision section describes, or did until the change Consequences names.

## What this does not settle

- Recorded after the fact from the GitHub history, on the owner's instruction to answer the onboarding gaps.
