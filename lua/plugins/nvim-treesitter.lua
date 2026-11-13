-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/nvim-treesitter.lua
-- @brief: Treesitter parser management and highlighting start-up.
--
-- nvim-treesitter was rewritten for Neovim 0.12+:
--   - lazy = false is required (plugin does not support lazy-loading)
--   - ensure_installed is gone; use require('nvim-treesitter').install({...})
--   - setup() only accepts install_dir, and its default (stdpath("data")/site)
--     is the one we want, so setup() isn't called: passing the same path again
--     only prepends a second copy of it to 'runtimepath'
--   - Parsers bundled with Neovim (lib/nvim/parser): c, lua, markdown,
--     markdown_inline, query, vim, vimdoc — do not reinstall them to avoid
--     ABI conflicts
--   - The `highlight` module is gone; `vim.treesitter.start()` is called from
--     the FileType autocmd below

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Install parsers not bundled with Neovim 0.12.3.
    -- Runs async in the background; safe to call on every startup
    -- (no-op for already-installed parsers).
    require("nvim-treesitter").install({
      "bash",
      "c_sharp",
      "css",
      "diff",
      "dockerfile",
      "gdscript",
      "gitcommit",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "graphql",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "luadoc",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "yaml",
    })

    -- The rewritten nvim-treesitter dropped the `highlight` module: starting
    -- the parser is now the config's job. Neovim only does it on its own for
    -- the handful of filetypes with bundled parsers (lua, markdown, help,
    -- query), so without this every other language falls back to regex syntax.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("meowvim-treesitter-start", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then
          return
        end
        -- Fails when the parser is not installed; that is expected and fine.
        pcall(vim.treesitter.start, args.buf, lang)
      end,
    })
  end,
}
