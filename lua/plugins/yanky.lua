-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/yanky.lua
-- @brief: Enhanced yank/put experience with Snacks picker integration.

return {
  "gbprod/yanky.nvim",
  -- VeryLazy rather than a file event, so the ring records yanks from the
  -- dashboard and scratch buffers too; the keys load it if one comes first.
  event = "VeryLazy",
  keys = {
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put After Cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Before Cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put After and Move Cursor" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Before and Move Cursor" },

    { "<M-n>", "<Plug>(YankyNextEntry)", desc = "Cycle to Next Yank" },
    { "<M-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle to Previous Yank" },

    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put After with Indent" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Before with Indent" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put After with Indent" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Before with Indent" },

    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put After and Shift Right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put After and Shift Left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Shift Right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Shift Left" },

    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After with Filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before with Filter" },
  },
  opts = {
    -- Everything else (shada-backed 100-entry ring, numbered-register sync,
    -- system clipboard sync) already matches yanky's defaults; only the
    -- highlight duration is shortened. preserve_cursor_position is on by
    -- default too, but it acts only through <Plug>(YankyYank), and y isn't
    -- mapped to it, so a yank still moves the cursor the way Vim's does.
    highlight = {
      timer = 200,
    },
  },
}
