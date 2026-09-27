---
id: SPC-0070
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-1100, REQ-1110]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Git integrations

## Scope

This covers the Git plugins, the GitHub pickers and their mappings. The lazygit theme is in the themes specification.

## Boundary

- Commands: `:LazyGit` and its variants, `:Neogit`, `:GitLink[!]` and the `:GitConflict*` set (from lua/plugins/lazygit.lua:16-22, lua/plugins/neogit.lua:9, lua/plugins/gitlinker.lua:9 and lua/config/keymaps.lua:957-971, high).
- Mappings live under `<leader>g`, with `]h`/`[h` for hunks and `]x`/`[x` for conflicts (from lua/config/keymaps.lua:850-995, high).
- `git.enable_signs`, `git.blame_line`, `git.show_deleted` and `git.lazygit_theme_sync` configure it (from lua/plugins/gitsigns.lua:12-19 and lua/plugins/lazygit.lua:28, high).
- The GitHub pickers need the `gh` CLI, and `:LazyGit` needs the `lazygit` binary (from lua/plugins/snacks.lua:70-72 and lua/meowvim/health.lua:253-259, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must show the working tree's Git changes hunk by hunk in a fullscreen view. (REQ-1100)
- The configuration must let the user stage, commit, pull and push without leaving Neovim. (REQ-1110)

What it does now:

- gitsigns shows signs when `git.enable_signs` isn't false, deleted lines when the toggle is on, and line blame after 500 ms when `git.blame_line` is true (from lua/plugins/gitsigns.lua:10-26, high).
- neogit runs with its diffview integration off (from lua/plugins/neogit.lua:14-27, high).
- The diff and log pickers open fullscreen (from lua/config/keymaps.lua:908-948, high).
- lualine takes its diff counts from gitsigns (from lua/plugins/lualine.lua:36-43, high).

## Failure paths

- The gitsigns mappings load gitsigns without a guard (from lua/config/keymaps.lua:306-310, 895-907, high).
- The GitHub mappings don't check for `gh` first (from lua/config/keymaps.lua:974-995, medium).
