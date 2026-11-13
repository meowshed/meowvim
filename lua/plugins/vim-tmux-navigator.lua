-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/vim-tmux-navigator.lua
-- @brief: Seamless navigation between vim splits and tmux panes with C-h/j/k/l.

return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  -- The plugin's own maps include terminal-mode <C-h/j/k/l> in Vim's <C-w>:
  -- syntax, which Neovim forwards to the job, so <C-l> in a terminal typed
  -- TmuxNavigateRight into the shell. The keys below cover normal mode,
  -- including the <C-\> previous-pane map that no_mappings also drops. Its
  -- netrw <C-l> workaround isn't needed, because snacks replaces netrw.
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate left (vim/tmux)" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate down (vim/tmux)" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate up (vim/tmux)" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right (vim/tmux)" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate to previous (vim/tmux)" },
  },
}
