---
id: ADR-0980
artifact: adr
status: approved
revised: 2026-11-19
addresses: []
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0980. `y` keeps Vim's own cursor movement

## Decision

`y` stays Vim's yank and isn't mapped to yanky's `<Plug>(YankyYank)`. (from lua/plugins/yanky.lua; the plugin review of 2026-11-12, high)

## Why

The mapping would keep the cursor in place after a yank, but it changes what `y` does everywhere, and Vim's own cursor movement is what most people expect.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Map `y` to `<Plug>(YankyYank)` | the cursor stays where the yank started | it changes a core key for every user |

## What it costs

After a yank the cursor moves to the start of the yanked text, as in stock Vim.

## What would reverse it

- Users ask for the cursor to stay in place after a yank.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
