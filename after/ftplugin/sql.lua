-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: after/ftplugin/sql.lua
-- @brief: Drop sql.vim's section motions so the treesitter ones apply.
--
-- $VIMRUNTIME/ftplugin/sql.vim maps ]] [[ ][ [] in normal and visual mode
-- without checking g:no_sql_maps, and those buffer-local maps shadow the
-- global treesitter-textobjects motions. Its ]} [{ and ]" [" maps don't clash
-- with anything here, so they stay.

for _, mode in ipairs({ "n", "x" }) do
  for _, lhs in ipairs({ "]]", "[[", "][", "[]" }) do
    -- Missing when another sql ftplugin set b:did_ftplugin first.
    pcall(vim.keymap.del, mode, lhs, { buffer = 0 })
  end
end
