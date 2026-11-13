-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/git-conflict.lua
-- @brief: Convenient helpers to resolve merge conflicts within Neovim.

return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "BufReadPost",
  opts = {
    -- Conflict actions are bound under <leader>gx in lua/config/keymaps.lua.
    default_mappings = false,
    -- The plugin's own switch calls vim.diagnostic.disable(), which Neovim 0.12
    -- removed, so the autocmds below do the same job with the current API.
    disable_diagnostics = false,
  },
  config = function(_, opts)
    require("git-conflict").setup(opts)

    -- The plugin fires these events without a buffer and reads the current
    -- buffer itself, so do the same. They fire again on every edit of a
    -- tracked file, so re-enable only the buffers silenced here.
    local group = vim.api.nvim_create_augroup("MeowGitConflictDiagnostics", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "GitConflictDetected",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.b[bufnr].git_conflict_diagnostics_off = true
        vim.diagnostic.enable(false, { bufnr = bufnr })
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "GitConflictResolved",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        if vim.b[bufnr].git_conflict_diagnostics_off then
          vim.b[bufnr].git_conflict_diagnostics_off = nil
          vim.diagnostic.enable(true, { bufnr = bufnr })
        end
      end,
    })
  end,
}
