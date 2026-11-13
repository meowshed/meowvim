---
id: ADR-0990
artifact: adr
status: approved
revised: 2026-11-19
addresses: [REQ-0420]
supersedes: [ADR-0150]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0990. snacks.nvim runs lazygit and themes it

## Decision

`snacks.lazygit` opens lazygit. With `git.lazygit_theme_sync` on, it writes a theme from the active colorscheme to `lazygit-theme.yml` under `stdpath("cache")`, layers it over the user's lazygit config through `LG_CONFIG_FILE`, and points lazygit's editor at this Neovim. (from lua/plugins/snacks.lua; docs/02-CONFIGURATION.md, high)

## Why

snacks.nvim already does what `lua/plugins/lazygit.lua` did by hand, and it never edits the user's lazygit config, which is often a symlink into a dotfiles tree.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Keep lazygit.nvim and meowvim's own theme file under `stdpath("state")` | one less dependency on snacks | 105 lines of code that snacks.nvim replaces |

## What it costs

`git.lazygit_theme_sync = false` turns off the theme and the editor integration together, because snacks.nvim's `configure` step does both.

## What would reverse it

- snacks.nvim drops `snacks.lazygit` or starts writing into the user's lazygit config.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
