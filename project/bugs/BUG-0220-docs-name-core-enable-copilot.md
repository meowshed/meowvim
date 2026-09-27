---
id: BUG-0220
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 79
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The docs name `core.enable_copilot` as Copilot's switch

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `0e8e7e7`. Read from the tree.

1. Read `docs/02-CONFIGURATION.md:34`, `docs/04-TROUBLESHOOTING.md:162` and `doc/meowvim.txt:77`.

## What the system does

All three name `core.enable_copilot` as the setting that turns Copilot on. The code turns Copilot on from `toggles.copilot` (`lua/plugins/copilot.lua:46`).

## What it should do, and why

The docs name `toggles.copilot`, as `REQ-0645` states and `REQ-0820` requires of the docs.

## Triage

It enters at implement. Minor, because a user who follows the docs sets a key that does nothing.

## Closed by

Not closed: no fix and no regression check exist yet.
