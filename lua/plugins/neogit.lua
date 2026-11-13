-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/neogit.lua
-- @brief: Git UI leveraging Neovim buffers.

return {
  "NeogitOrg/neogit",
  cmd = { "Neogit" },
  opts = {
    -- `disable_commit_confirmation` and `commit_popup` used to be set here;
    -- neither key exists in neogit's config any more and neogit's validator
    -- ignores unknown keys, so they were silently dead.
    integrations = {
      -- diffview.nvim was removed on purpose in favour of snacks' git_diff
      -- picker; this keeps neogit from picking it up if it ever comes back.
      diffview = false,
    },
    signs = {
      section = { "", "" },
      item = { "", "" },
    },
  },
}
