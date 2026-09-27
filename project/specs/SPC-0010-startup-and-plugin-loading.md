---
id: SPC-0010
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0100, REQ-0110, REQ-0120, REQ-0130, REQ-0140, REQ-0150, REQ-0160, REQ-0170, REQ-0180, REQ-0190, REQ-0195]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Startup and plugin loading

## Scope

This covers what happens from `nvim` starting to the editor being ready: the module order, lazy.nvim, which plugins load when, and the editor options set at startup. User settings are in the settings specification, and themes in the themes specification.

## Boundary

- When `~/.local/share/mise/shims` exists and isn't on `PATH`, startup prepends it (from init.lua:16-20, high).
- When lazy.nvim is missing, startup clones it from `https://github.com/folke/lazy.nvim.git` on the `stable` branch into `stdpath("data")/lazy/lazy.nvim` (from init.lua:37-41, high).
- Plugin specs are imported from `lua/plugins/`, one spec per file (from init.lua:45, high).
- `core.update_check` turns lazy.nvim's update checker on, with its notifications off (from init.lua:49-52, high).
- `COLORTERM`, `TERM` and `TERM_PROGRAM` decide `termguicolors` (from lua/config/options.lua:23-31, high).
- `TMUX` and `ZELLIJ` select a short window title (from lua/utils/hooks.lua:43-61, high).
- `lazy-lock.json` pins 83 plugins by branch and commit (from lazy-lock.json:2-84, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must run on Neovim 0.12 or later. (REQ-0100)
- The configuration must start and edit files when only Neovim, Git and a true-colour terminal are installed. (REQ-0110)
- The configuration must start when no user config file exists. (REQ-0120)
- The configuration must enable true colour only when the terminal advertises it through `COLORTERM`, `TERM` or `TERM_PROGRAM`. (REQ-0130)
- The configuration must force a full redraw when the terminal is resized. (REQ-0140)
- The configuration must set `ttimeoutlen` so that terminal escape sequences don't stall under a multiplexer. (REQ-0150)
- The configuration must produce no `:checkhealth` warnings about the Python, Ruby, Perl or Node providers. (REQ-0160)
- The configuration must let Neovim exit without crashing after a plugin sync rebuilds LuaSnip. (REQ-0170)
- The configuration must keep every `lazy-lock.json` entry inside the version range its plugin spec asks for. (REQ-0180)
- The configuration must not carry a hardcoded local `dir =` override in any plugin spec. (REQ-0190)
- A plugin must not load before the trigger its spec declares, unless another plugin that has loaded needs it. (REQ-0195; broken now, BUG-0050)

What it does now:

- The loader cache is on, and the Python, Ruby, Perl and Node providers are off (from init.lua:7-13, high).
- Startup runs, in order: the config module and its early settings, `lua/config/options.lua`, the toggles, lazy.nvim, the hooks, the patches, the keymaps, then the commands, watcher, theme and diagnostics modules (from init.lua:25-107, high).
- `lua/config/options.lua` runs after the early settings and sets tab width, numbers, wrap, `cmdheight` and `pumheight` unconditionally, so it overrides the user's `editor.*`, `ui.cmdheight` and `ui.pumheight` at startup (from init.lua:26, 34 and lua/config/options.lua:16-64, high).
- lazy.nvim runs with luarocks off, its cache on and 24 of Neovim's runtime plugins disabled, including netrw and matchparen (from init.lua:47-87, high).
- snacks.nvim, nvim-lspconfig, blink.cmp, nvim-treesitter, lualine, mini.icons and the active theme load at startup; the rest load on an event, a filetype, a command, a key or a `require` (from lua/plugins/*.lua lazy triggers, high).
- copilot.lua is declared to load on `InsertEnter`, but lualine loads at startup and depends on copilot-lualine, which depends on copilot.lua (from lua/plugins/lualine.lua:171-174 and lua/plugins/copilot-lualine.lua:9, medium).
- On resize, a `VimResized` autocmd equalises windows and forces a full redraw (from lua/config/options.lua:113-119, high).
- `ttimeoutlen` is 10 ms (from lua/config/options.lua:9-14, high).
- Spell is turned on for gitcommit, markdown, text, rst and tex buffers (from lua/config/options.lua:136-163, high).
- A patch guards `vim.treesitter.get_range` against a nil node, and another fills a missing token in LSP `$/progress` messages (from lua/utils/patches.lua:13-36, high).

## Failure paths

- When the config module fails to load, startup shows an ERROR notification "Failed to load meowvim config", sets the leader to space, turns the update checker off and skips the commands, watcher, theme and diagnostics modules (from init.lua:27-31, 50, 95-107, high).
- When the lazy.nvim clone fails, nothing checks it, and startup stops with a Lua error at `require("lazy")` (from init.lua:38-44, medium).
- The patches `require("snacks")` without a guard, so startup errors when snacks.nvim is missing (from lua/utils/patches.lua:60, medium).
- When `core.theme` names no known theme, no colorscheme is applied at startup (from lua/plugins/themes.lua:15-37, high).
