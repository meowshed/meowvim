-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/which-key.lua
-- @brief: Interactive keymap guide and command discovery popup.

return {
  "folke/which-key.nvim",
  -- lua/config/keymaps.lua requires which-key while init.lua runs, so VeryLazy would
  -- never apply.
  lazy = false,
  config = function()
    require("which-key").setup({
      preset = "helix",
      -- "order" keeps the registers and marks popups in the order the plugin gives them.
      sort = { "local", "order", "manual", "group", "alphanum" },
      icons = {
        group = "",
      },
    })

    -- which-key suspends itself while a macro records, so <leader> maps lose the popup and
    -- time out after 'timeoutlen'. It does that because it replays the keys it read with
    -- nvim_feedkeys(..., "mit"), and "t" makes the register record them a second time. Both
    -- patches below reach into which-key internals (which-key.util, which-key.state), so check
    -- them after a which-key update: keep which-key on while recording, suspend it only while
    -- a macro executes, and drop the "t" flag while recording so the register holds each key
    -- once. Playback works either way, because Neovim resolves the recorded keys itself.
    local util = require("which-key.util")
    local state = require("which-key.state")
    if type(util.in_macro) ~= "function" or type(state.execute) ~= "function" then
      vim.notify(
        "which-key internals changed: <leader> falls back to a timeout while a macro records",
        vim.log.levels.WARN,
        { title = "which-key.lua" }
      )
      return
    end

    util.in_macro = function()
      return vim.fn.reg_executing() ~= ""
    end

    local execute = state.execute
    state.execute = function(...)
      if vim.fn.reg_recording() == "" then
        return execute(...)
      end
      local feedkeys = vim.api.nvim_feedkeys
      vim.api.nvim_feedkeys = function(keys, mode, escape)
        return feedkeys(keys, (mode:gsub("t", "")), escape)
      end
      local ok, ret = pcall(execute, ...)
      vim.api.nvim_feedkeys = feedkeys
      if not ok then
        error(ret, 0)
      end
      return ret
    end

    -- On RecordingEnter which-key clears the buffer's triggers and waits for the next event to
    -- rebuild them; rebuild them at once so <leader> works from the first key of the macro.
    vim.api.nvim_create_autocmd("RecordingEnter", {
      group = vim.api.nvim_create_augroup("meowvim-which-key-recording", { clear = true }),
      callback = function()
        vim.schedule(function()
          require("which-key.buf").get({ update = true })
        end)
      end,
    })
  end,
}
