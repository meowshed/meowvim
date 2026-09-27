---
id: BUG-0090
artifact: bug
status: approved
severity: minor
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 65
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# The settings template writes a key nothing reads

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Remove the user config.
2. Start Neovim so it creates the file from its template.
3. Search the file and the code for `lazy_load_plugins`.

## What the system does

The new file has `lazy_load_plugins = true` (line 28). No code reads it, and the schema doesn't list it.

## What it should do, and why

The template writes only keys the configuration reads. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Minor, because the key does nothing; it suggests a setting that doesn't exist.

## Closed by

Not closed: no fix and no regression check exist yet.
