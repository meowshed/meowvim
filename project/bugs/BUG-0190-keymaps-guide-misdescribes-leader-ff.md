---
id: BUG-0190
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 75
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The keymaps guide misdescribes `<leader>ff`

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `docs/KEYMAPS.md:14-16`, `docs/03-WORKFLOWS.md:24-26` and `lua/config/keymaps.lua:410-418`.

## What the system does

`docs/KEYMAPS.md` says `<leader>ff` "picks between Git files, recent files, and a full listing based on where you are". The mapping runs `snacks.picker.smart()`, which ranks open buffers, recent files and the whole tree together, as `docs/03-WORKFLOWS.md` says.

## What it should do, and why

Both guides describe what the mapping does, as `REQ-0820` requires.

## Triage

It enters at implement. Minor, because one sentence is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
