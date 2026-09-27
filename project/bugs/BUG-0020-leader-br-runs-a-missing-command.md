---
id: BUG-0020
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 58
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# `<leader>br` runs a command that doesn't exist

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Start Neovim, open a file and fire `User VeryLazy` so which-key registers its mappings.
2. Read the right-hand side of `<leader>br`, then run it.

## What the system does

`<leader>br` maps to `:BufRename<CR>`, and running it fails with `E492: Not an editor command: BufRename`. Nothing in the repository defines `BufRename` (`lua/config/keymaps.lua:490`).

## What it should do, and why

The mapping either renames the buffer or doesn't exist. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because one mapping fails with a clear error and nothing else breaks.

## Closed by

Not closed: no fix and no regression check exist yet.
