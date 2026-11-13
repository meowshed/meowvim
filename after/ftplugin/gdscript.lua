-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: after/ftplugin/gdscript.lua
-- @brief: Drop gdscript.vim's section motions so the treesitter ones apply.
--
-- $VIMRUNTIME/ftplugin/gdscript.vim maps ]] [[ in normal and visual mode
-- unless g:no_plugin_maps is set, and it never reads g:no_gdscript_maps.
-- Setting g:no_plugin_maps would also take markdown's heading motions away,
-- so this removes only the two buffer-local maps that shadow the global
-- treesitter-textobjects motions.

for _, mode in ipairs({ "n", "x" }) do
  for _, lhs in ipairs({ "]]", "[[" }) do
    -- Missing when another gdscript ftplugin set b:did_ftplugin first.
    pcall(vim.keymap.del, mode, lhs, { buffer = 0 })
  end
end

-- gdscript.vim's b:undo_ftplugin unmaps both keys with `silent exe 'unmap'`,
-- and :silent doesn't suppress errors, so with the maps gone the next
-- filetype change raises E31. The maps are already deleted, so drop those
-- two steps from the undo string.
if vim.b.undo_ftplugin then
  vim.b.undo_ftplugin = vim.b.undo_ftplugin:gsub("%s*|%s*silent exe 'unmap <buffer> [%[%]][%[%]]'", "")
end
