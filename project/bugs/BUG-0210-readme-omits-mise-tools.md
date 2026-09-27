---
id: BUG-0210
artifact: bug
status: approved
severity: minor
violates: REQ-0820
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 77
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The README omits three tools `mise install` fetches

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`, read from the tree.

1. Read `README.md:125-127` and `mise.toml`.

## What the system does

The README says `mise install` fetches stylua and Lua 5.1. `mise.toml` also declares lua-language-server, tree-sitter and opencode.

## What it should do, and why

The README names what `mise install` fetches, as `REQ-0820` requires.

## Triage

It enters at implement. Minor, because a contributor gets more than the README says, not less.

## Closed by

Not closed: no fix and no regression check exist yet.
