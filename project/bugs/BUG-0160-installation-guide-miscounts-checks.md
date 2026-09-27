---
id: BUG-0160
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 72
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The installation guide says the test script checks nine things and lists ten

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `docs/01-INSTALLATION.md:157-168`.

## What the system does

Line 157 says "It checks nine things", and the list below it has ten items. `bin/test-config.sh:262-277` runs ten tests.

## What it should do, and why

The count matches the list, as `REQ-0820` requires the docs to describe what the code does.

## Triage

It enters at implement. Minor, because only a number is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
