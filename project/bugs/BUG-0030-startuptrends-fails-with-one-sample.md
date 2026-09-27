---
id: BUG-0030
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 59
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# `:StartupTrends` raises a Lua error when one startup is recorded

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Write one entry to `stdpath("data")/startup_metrics.json`: `[{"timestamp":1,"startuptime":50.0,"plugin_count":83,"loaded_count":17}]`.
2. Start Neovim and run `:StartupTrends` before the tracker records the new startup.
3. Repeat with two entries.

## What the system does

With one entry it fails with `startup_tracker.lua:108: bad argument #2 to 'format' (number expected, got nil)`, because the median is `times[math.floor(#times / 2)]`, which is `times[0]` for one sample (`lua/meowvim/startup_tracker.lua:88`). With two entries it works.

## What it should do, and why

The command shows the one recorded startup. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because it fails only while the history holds exactly one startup.

## Closed by

Not closed: no fix and no regression check exist yet.
