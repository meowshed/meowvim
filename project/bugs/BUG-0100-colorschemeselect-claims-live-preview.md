---
id: BUG-0100
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 66
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# `:ColorschemeSelect` describes a live preview it doesn't give

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `lua/meowvim/colorscheme_switcher.lua:66-94` and line 187.

## What the system does

The command's description is "Select colorscheme with live preview", but nothing is applied until an item is chosen.

## What it should do, and why

The description matches what the command does. No doc makes the claim, so `REQ-0820` doesn't apply. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because only the description is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
