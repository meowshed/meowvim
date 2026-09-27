---
id: BUG-0230
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 80
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The health check reports Copilot's state from `core.enable_copilot`

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `0e8e7e7`.

Neovim ran headless against the checkout with scratch `XDG_*` directories.

1. Write `return { core = { enable_copilot = false }, toggles = { copilot = true } }` to the user config.
2. Start Neovim, print `vim.g.copilot_enabled`, then run `:checkhealth meowvim`.

## What the system does

`vim.g.copilot_enabled` is `true`, and the health report says "Copilot: disabled", because it reads `core.enable_copilot` (`lua/meowvim/health.lua:84`).

## What it should do, and why

The report states whether Copilot is on. The owner decided on 2026-09-27 that `core.enable_copilot` goes and `toggles.copilot` is the switch (`REQ-0645`); no requirement covers the health report itself, so the requirements step settles it.

## Triage

It enters at requirements. Minor, because only the report is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
