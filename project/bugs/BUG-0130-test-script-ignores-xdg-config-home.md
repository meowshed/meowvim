---
id: BUG-0130
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 69
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The test script skips validation when the user config is under `XDG_CONFIG_HOME`

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Put an invalid config, `return { editor = { tabstop = 99 } }`, at `$XDG_CONFIG_HOME/meowvim/config.lua`, with no config under `$HOME/.config`.
2. Run `bash bin/test-config.sh` with that environment.

## What the system does

Test 3 prints "No user config found (optional)" and passes, because it checks only `$HOME/.config/meowvim/config.lua` (`bin/test-config.sh:96`), while the configuration reads `$XDG_CONFIG_HOME` first.

## What it should do, and why

The test validates the file the configuration loads. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because it hides an invalid config only for users who set `XDG_CONFIG_HOME`.

## Closed by

Not closed: no fix and no regression check exist yet.
