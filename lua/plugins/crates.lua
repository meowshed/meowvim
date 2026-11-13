-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/crates.lua
-- @brief: Cargo.toml dependency management plugin.

return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
  },
}
