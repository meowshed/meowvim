---
id: BUG-0080
artifact: bug
status: approved
severity: major
violates: REQ-0330
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 64
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Persisted toggles for wrap, spell, cursorline and list aren't applied at startup

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Write `return { toggles = { wrap = true, spell = true, cursorline = false, list = true } }` to the user config.
2. Start Neovim and print each `vim.g` value beside the window option.

## What the system does

The toggles are recorded but not applied: `g.wrap=true wo.wrap=false`, `g.spell=true wo.spell=false`, `g.cursorline=false wo.cursorline=true`, `g.list=true wo.list=false`. Only the `<leader>o` keys read those values.

## What it should do, and why

A toggle the user persisted with `<leader>op` is in effect after a restart, as `REQ-0330` requires.

## Triage

It enters at implement. Major, because it breaks a requirement. Four toggles were reproduced; the code shows the same for `number_mode`, `signcolumn`, `hlsearch`, `diagnostics_enabled` and `snacks_dim`, nine in all, since only the `<leader>o` keys read them.

## Closed by

Not closed: no fix and no regression check exist yet.
