---
id: BUG-0200
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 76
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The help file says plugins install on demand, where they load on demand

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `doc/meowvim.txt:24-25` and `docs/02-CONFIGURATION.md:198-200`.

## What the system does

The help file says meowvim "installs the rest on demand". Every plugin is installed up front, and the rest load on demand, as the configuration guide says.

## What it should do, and why

The help file says the plugins load on demand, as `REQ-0820` requires.

## Triage

It enters at implement. Minor, because one word is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
