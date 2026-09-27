---
id: BUG-0050
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 61
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# copilot.lua loads at startup, not on InsertEnter

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Start Neovim headless with no file.
2. Read whether lazy.nvim marks `copilot.lua` as loaded.

## What the system does

`copilot.lua` is loaded. `lua/plugins/copilot.lua:18` declares `event = "InsertEnter"`, but lualine loads at startup and depends on copilot-lualine (`lua/plugins/lualine.lua:171-174`), which depends on copilot.lua (`lua/plugins/copilot-lualine.lua:9`).

## What it should do, and why

copilot.lua loads when it's first needed, as its spec declares. Copilot stays disabled either way, so `REQ-0640` holds. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because it costs startup time and nothing else.

## Closed by

Not closed: no fix and no regression check exist yet.
