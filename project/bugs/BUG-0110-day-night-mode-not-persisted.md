---
id: BUG-0110
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 67
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Day/night mode changes are lost on restart

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Write `return { core = { day_night_mode = "auto" } }` to the user config.
2. Start Neovim, run `:DayNightMode manual` and print the mode.
3. Restart and print the mode.

## What the system does

The mode is `manual` after the command and `auto` after the restart. `:DayNightMode` and `:DayNightToggle` change it in memory only (`lua/meowvim/day_night.lua:215-263`), while setting a slot or a preset writes the file.

## What it should do, and why

Whether a mode change should persist isn't stated anywhere. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because the user can set the mode in the file.

## Closed by

Not closed: no fix and no regression check exist yet.
