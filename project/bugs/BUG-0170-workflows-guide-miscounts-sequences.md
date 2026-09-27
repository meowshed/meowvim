---
id: BUG-0170
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 73
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The workflows guide says ten sequences and has twelve

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `docs/03-WORKFLOWS.md:3` and count its `##` sections.

## What the system does

Line 3 says "Ten sequences", and the guide has twelve `##` sections.

## What it should do, and why

The count matches the guide, as `REQ-0820` requires.

## Triage

It enters at implement. Minor, because only a number is wrong.

## Closed by

Not closed: no fix and no regression check exist yet.
