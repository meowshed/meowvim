---
id: BUG-0040
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 60
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# `git.show_deleted` has two different defaults

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `lua/meowvim/config/defaults.lua:83` and `lua/meowvim/config/schema.lua:71`.

## What the system does

`defaults.lua` sets `show_deleted = false`, and `schema.lua` declares `default = true`. The schema's default is never used for values, so the effective default is false.

## What it should do, and why

One default, stated once. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because the effective behaviour is consistent; the second default misleads a reader.

## Closed by

Not closed: no fix and no regression check exist yet.
