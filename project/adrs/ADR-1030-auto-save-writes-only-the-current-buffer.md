---
id: ADR-1030
artifact: adr
status: approved
revised: 2026-11-19
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 1030. auto-save writes only the current buffer

## Decision

auto-save.nvim runs without `write_all_buffers`, so it writes only the buffer you're in. (from lua/plugins/auto-save.lua, high)

## Why

`write_all_buffers` ran `silent! wall`, which skipped auto-save's `condition` and so also wrote commit messages.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| `write_all_buffers = true` | background edits are saved at once | it writes buffers the condition excludes, such as commit messages |

## What it costs

A buffer changed in the background, by an LSP rename across files or `:cdo s/…/`, is saved when you next visit and leave it, or by `:wall`.

## What would reverse it

- auto-save.nvim applies its `condition` to every buffer it writes.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
