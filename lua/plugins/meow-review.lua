-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/meow-review.lua
-- @brief: lazy.nvim spec for meow.review.nvim — AI code review annotations.
--
-- Keymaps (all managed in keymaps.lua under <leader>r):
--   <leader>ra  Add Comment              [n, v] - modal: <C-t> cycles type, <C-s> confirms
--   <leader>rd  Delete Comment           [n, v]
--   <leader>rE  Edit Comment             [n]    — pre-filled modal
--   <leader>rv  View Comment             [n]
--   <leader>re  Export Review            [n]    — exports to clipboard (default)
--   <leader>rf  Export to File           [n]    — prompts for filename
--   <leader>rF  Export Current File      [n]    — export annotations for current buffer only
--   <leader>rC  Export and Clear         [n]    — export then wipe all annotations
--   <leader>rc  Clear All                [n]
--   <leader>rg  Go to Comment            [n]    — picker; jump to any annotation
--   <leader>rG  Go to Comment in File    [n]    — picker filtered to current file
--   <leader>rt  Go to Comment by Type    [n]    — type-selection picker then annotation picker
--   <leader>rx  Resolve Comment          [n]    — mark annotation at cursor as resolved
--   <leader>rX  Resolve All              [n]    — mark all annotations as resolved
--   <leader>rV  Validate Annotations     [n]    — detect stale annotations
--   <leader>rr  Reload                   [n]    — reload from store file
--   ]r          Next Review Comment      [n]
--   [r          Previous Review Comment  [n]

return {
  "meowshed/meow.review.nvim",
  -- dir = "/Users/retran/workspace/meow.review.nvim", -- local dev override
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "VeryLazy",
  -- lazy.nvim guesses `meow` from the repository name, which isn't a module,
  -- so without this it never calls setup() with the opts below.
  main = "meow.review",
  opts = {
    -- Filename written by :MeowReview export file (and file_prompt), relative
    -- to the project root. The default is .review.md at the root; this keeps
    -- exports in .cache/ beside the annotation store. Every other option is
    -- at its default.
    export_filename = ".cache/meow-review/review.md",
  },
}
