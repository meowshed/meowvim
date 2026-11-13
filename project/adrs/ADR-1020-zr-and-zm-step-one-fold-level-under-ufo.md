---
id: ADR-1020
artifact: adr
status: approved
revised: 2026-11-19
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 1020. `zr` and `zm` step one fold level under ufo

## Decision

meowvim keeps its own fold level in `b:meowvim_fold_level` and applies it with ufo's `closeFoldsWith(level)`, one level per press of `zr` or `zm`. (from lua/plugins/nvim-ufo.lua, high)

## Why

ufo keeps `foldlevel` at 99, so native `zr` and `zm` change a number nothing reads.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Native `zr` and `zm` | no extra code | they do nothing visible under ufo |

## What it costs

Each press scans the buffer's fold levels to find the depth, which costs a few milliseconds on a file of tens of thousands of lines.

## What would reverse it

- ufo makes native `zr` and `zm` work.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
