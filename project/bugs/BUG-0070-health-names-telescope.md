---
id: BUG-0070
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 63
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The health check names Telescope, which isn't installed

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `lua/meowvim/health.lua:234-248`.

## What the system does

The ripgrep and fd warnings say "Telescope search will be slower" and "Telescope file finding will be slower". The pickers are snacks.nvim, and no Telescope spec exists in `lua/plugins/`.

## What it should do, and why

The warnings name the pickers that use ripgrep and fd. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because only the wording is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
