---
id: BUG-0060
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 62
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The health check would report Neovim 1.x as too old

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `lua/meowvim/health.lua:20-43`.

This can't be run: no Neovim 1.x exists. The condition is read from the code.

## What the system does

The version check passes only when `current_version.major == 0 and current_version.minor >= 12` (`lua/meowvim/health.lua:23`), so any 1.x version fails it.

## What it should do, and why

Any version at or above 0.12 passes, which is what `REQ-0100` asks the configuration to run on. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because it affects only a future release and only the health report.

## Closed by

Not closed: no fix and no regression check exist yet.
