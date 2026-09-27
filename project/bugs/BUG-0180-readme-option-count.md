---
id: BUG-0180
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 74
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The README's option count matches neither the schema nor the guide

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `README.md:18-19`.
2. Count the keys `lua/meowvim/config/schema.lua` validates, and the options `docs/02-CONFIGURATION.md` lists.

## What the system does

The README says 56 validated options. The schema declares 55 typed keys, and the guide's tables list 60.

## What it should do, and why

The README states the number the schema validates, as `REQ-0820` requires.

## Triage

It enters at implement. Minor, because only a number is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
