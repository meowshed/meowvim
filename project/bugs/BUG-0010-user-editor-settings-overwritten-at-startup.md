---
id: BUG-0010
artifact: bug
status: approved
severity: major
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 57
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# User editor and UI settings are overwritten at startup

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Write `return { editor = { tabstop = 4, indent = 4, line_numbers = false, wrap = true }, ui = { cmdheight = 2, pumheight = 15 } }` to the user config.
2. Start Neovim and print `tabstop`, `shiftwidth`, `number`, `wrap`, `cmdheight` and `pumheight`.

## What the system does

Neovim starts with `tabstop=2 shiftwidth=2 number=true wrap=false cmdheight=1 pumheight=10`. `init.lua:26` applies the user's settings, then `init.lua:34` runs `lua/config/options.lua`, which sets the same options unconditionally.

## What it should do, and why

The values in the user config take effect at startup, as `docs/02-CONFIGURATION.md` documents for each of these keys. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Major, because every user's editor settings are ignored until they save the config file once.

## Closed by

Not closed: no fix and no regression check exist yet.
