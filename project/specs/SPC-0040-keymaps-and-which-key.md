---
id: SPC-0040
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0500, REQ-0510, REQ-0520, REQ-0530, REQ-0540, REQ-0550, REQ-0560, REQ-0580, REQ-0590, REQ-0591, REQ-0592, REQ-0593]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Keymaps, which-key and the conflict checker

## Scope

This covers the mapping table, the which-key groups, the mappings plugins declare themselves, and the conflict checker. What each mapping does belongs to the part that owns the feature.

## Boundary

- `lua/config/keymaps.lua` declares most mappings in one which-key table, grouped under `<leader>` as Files, Buffers, Windows, Swap, Search, Jump, Navigate, Code, Git, Tests, Review, Execute, Debug, Options, History, Yank, Notes, Help and Quit (from lua/config/keymaps.lua:410-1662, high).
- Plugins declare their own keys in their spec: yanky's `p` and `P` family, the treesitter textobjects, tmux navigation on `<C-h/j/k/l>`, `<leader>cr` for inc-rename, `<leader>cs` for silicon, the blink insert-mode keys and mini.surround's `gs` keys (from lua/plugins/yanky.lua:23-42, lua/plugins/nvim-treesitter-textobjects.lua:31-80, lua/plugins/vim-tmux-navigator.lua:15-20, lua/plugins/inc-rename.lua:12-21, lua/plugins/silicon.lua:11-13, lua/plugins/blink-cmp.lua:43-101 and lua/plugins/mini-surround.lua:12-22, high).
- Insert-mode `jj` and the Cyrillic `оо` leave insert mode (from lua/config/keymaps.lua:1754-1755, high).
- Commands: `:KeymapConflicts` and `:KeymapList [mode]` (from lua/meowvim/keymap_checker.lua:173-186, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must make the leader key the main entry point for its functions. (REQ-0500)
- The LSP navigation mappings must not open an empty window when no language server answers. (REQ-0510)
- `<leader>ns` must list treesitter symbols when no language server provides document symbols. (REQ-0520)
- `<leader>nS` must grep the project when no language server provides workspace symbols. (REQ-0530)
- A navigation mapping without a fallback must name the LSP request that no server answered. (REQ-0540)
- `<CR>` in the completion menu must insert a newline and never accept an item. (REQ-0550)
- The completion popup must not swallow the key that accepts a Copilot suggestion. (REQ-0560)
- Every mapping must run a command or function that exists. (REQ-0580; broken now, BUG-0020)
- Leaving insert mode must work while a Cyrillic keyboard layout is active. (REQ-0590)
- The configuration must let the user jump to any visible match by typing its label. (REQ-0591)
- One key must toggle a terminal from both normal mode and terminal mode. (REQ-0592)
- The completion menu must be navigable without the arrow keys. (REQ-0593)

What it does now:

- A mapping without an icon takes one from an exact-description table, then from substring patterns (from lua/config/keymaps.lua:24-248, 1727-1751, high).
- snacks.nvim is resolved when a mapping first uses it, so a failure breaks only the snacks mappings (from lua/config/keymaps.lua:9-20, high).
- The LSP navigation mappings check the capability first and warn "No language server in this buffer provides <what>" (from lua/config/keymaps.lua:283-304 and lua/utils/lsp.lua:50-61, high).
- `<leader>ns` falls back to treesitter symbols, and `<leader>nS` to a project grep, each with a WARN saying so (from lua/config/keymaps.lua:666-686, high).
- `<leader>co` works only in TypeScript and JavaScript buffers and warns elsewhere (from lua/config/keymaps.lua:733-747, high).
- Each `<leader>o` toggle flips its option, records it, and notifies ON or OFF (from lua/config/keymaps.lua:1280-1479, high).
- The conflict checker reports, per mode, every left-hand side that appears twice among the global and current-buffer mappings, which in practice means a buffer-local mapping shadowing a global one (from lua/meowvim/keymap_checker.lua:10-50, medium).

## Failure paths

- When which-key can't be loaded, none of its mappings are registered and nothing is reported (from lua/config/keymaps.lua:396-397, 1752, high).
- `<leader>br` runs `:BufRename`, which nothing in the repository defines (from lua/config/keymaps.lua:490, medium).
- The gitsigns, neotest, dap, crates, persistence, meow.yarn, textobjects-swap and conform mappings load their plugin without a guard, so a missing plugin raises a Lua error (from lua/config/keymaps.lua, high).
- The flash, glance, meow.review, hbac, spectre, overseer, indentscope and ufo mappings are guarded and do nothing when their plugin is missing (from lua/config/keymaps.lua, high).
