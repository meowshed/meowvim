-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/mini-surround.lua
-- @brief: Surround text objects with custom motions and Treesitter awareness.

return {
  "nvim-mini/mini.surround",
  -- Loads on its keys rather than on file events, so the maps also exist on
  -- the dashboard and in scratch buffers. The modes match the ones
  -- mini.surround maps each key in; the suffixed variants (gsdn, gsfN, ...)
  -- start with these keys, so they load the plugin too.
  keys = {
    { "gsa", mode = { "n", "x" }, desc = "Add Surrounding" },
    { "gsd", desc = "Delete Surrounding" },
    { "gsr", desc = "Replace Surrounding" },
    { "gsf", mode = { "n", "x", "o" }, desc = "Find Right Surrounding" },
    { "gsF", mode = { "n", "x", "o" }, desc = "Find Left Surrounding" },
    { "gsh", desc = "Highlight Surrounding" },
    -- mini.surround doesn't map update_n_lines, so gsn calls it directly.
    {
      "gsn",
      function()
        require("mini.surround").update_n_lines()
      end,
      desc = "Update Surround Search Lines",
    },
  },
  opts = {
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      suffix_last = "N",
      suffix_next = "n",
    },
  },
}
