---
id: ADR-1000
artifact: adr
status: approved
revised: 2026-11-19
addresses: [REQ-0500]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 1000. which-key is patched to stay on while a macro records

## Decision

`lua/plugins/which-key.lua` replaces `which-key.util.in_macro` and wraps `which-key.state.execute`, so `<leader>` keeps its popup while a macro records. (from lua/plugins/which-key.lua, high)

## Why

which-key suspends itself during a recording, so `<leader>` maps lost the popup and timed out after 300 ms.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Stock which-key | no patched internals | `<leader>` times out while a macro records |

## What it costs

Both patched functions are which-key internals. If an update renames them, the patch warns once and `<leader>` falls back to a timeout while recording, which is the stock which-key behaviour. lazy-lock.json pins which-key at the version the patch was checked against.

## What would reverse it

- which-key stays on during a recording by itself.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
