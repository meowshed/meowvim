---
id: BUG-0150
artifact: bug
status: approved
severity: minor
violates: REQ-0350
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 71
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# A project matches a sibling directory whose name starts with its own

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Write `projects.lua` with project `foo` at `/private/tmp/mvrepro/foo`.
2. Start Neovim in `/private/tmp/mvrepro/foobar` and detect the current project.

## What the system does

The current project is `foo`. Matching is a string prefix (`lua/meowvim/config/init.lua:388`).

## What it should do, and why

A project matches only its own directory and those below it, as `REQ-0350` requires.

## Triage

It enters at implement. Minor, because it applies the wrong project's theme and `on_open` in sibling directories.

## Closed by

Not closed: no fix and no regression check exist yet.
