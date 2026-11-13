-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/nvim-ts-autotag.lua
-- @brief: Auto-close and auto-rename HTML/JSX tags via treesitter.
--
-- The defaults already close and rename tags and leave close-on-slash off,
-- which is what this config wants, so opts stays empty.

return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
