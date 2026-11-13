---
id: ADR-1010
artifact: adr
status: approved
revised: 2026-11-19
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 1010. noice hides write messages by their text

## Decision

The route in `lua/plugins/noice.lua` hides `:write` messages by matching the `progress` kind and the two texts `"file" ` and `... 4B written`. (from lua/plugins/noice.lua, high)

## Why

Neovim 0.12 reports `:write` as two `msg_show` events of kind `progress` with id `bufwrite`, and noice can't filter on the id.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Filter on the kind alone | no dependence on wording | it hides every other progress message |

## What it costs

The route depends on Neovim's wording. If Neovim changes it, write messages come back; they hide nothing else.

## What would reverse it

- noice gains a filter on the message id.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
