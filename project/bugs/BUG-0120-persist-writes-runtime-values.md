---
id: BUG-0120
artifact: bug
status: approved
severity: major
enters: requirements
found: 2026-09-27
revised: 2026-09-27
issue: 68
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Persisting settings writes runtime values and drops the user's comments

## Reproduction

macOS (Darwin 27.0, arm64), Neovim 0.12.5, at revision `b1b9543`. Neovim ran headless with `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME` and `XDG_CACHE_HOME` pointing at a scratch directory whose `nvim` links to the checkout and whose plugin directory links to an installed one, so no real user setting or history was read or changed.

1. Write `projects.lua` with project `foo` at `/private/tmp/mvrepro/foo`, theme `gruvbox`, variant `hard`.
2. Write a user config holding a comment and `core = { theme = "catppuccin", variant = "mocha" }`.
3. Start Neovim in `/private/tmp/mvrepro/foo`, detect the project and call `persist()`.

## What the system does

The file is rewritten as the whole merged configuration, 96 lines, with `theme = "gruvbox"` and `variant = "hard"` from the project and without the comment. `<leader>op` calls the same function.

## What it should do, and why

Persisting writes the user's own choices back, not values a project or auto mode set for the session. No requirement in force covers this, so the requirements step decides what the behaviour should be.

## Triage

It enters at requirements. Major, because it silently replaces the user's theme and deletes their comments.

## Closed by

Not closed: no fix and no regression check exist yet.
