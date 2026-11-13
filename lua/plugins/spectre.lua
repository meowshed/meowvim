-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/spectre.lua
-- @brief: Project-wide search and replace UI.

return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local opts = {
      -- No `highlight` overrides: `search`/`replace` only restated spectre's own
      -- defaults, and `ui = "SpectreUI"` pointed at a highlight group that does
      -- not exist in the plugin (the real one is `SpectreBody`), leaving the
      -- panel body unhighlighted.
      --
      -- These panel maps are remapped from spectre's defaults (<leader>q, <leader>c,
      -- <leader>o and <leader>r{c,p,d}), which sit on the Quit, Code, Options
      -- and Review groups in lua/config/keymaps.lua and shadow them in the panel.
      mapping = {
        ["send_to_qf"] = {
          map = "<leader>Q",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "Send to Quickfix List",
        },
        ["replace_cmd"] = {
          map = "<leader>C",
          cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
          desc = "Input Replace Command",
        },
        ["show_option_menu"] = {
          map = "<leader>O",
          cmd = "<cmd>lua require('spectre').show_options()<CR>",
          desc = "Show Options",
        },
        ["run_current_replace"] = {
          map = "<leader>I",
          cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
          desc = "Replace Item",
        },
        ["select_template"] = {
          map = "<leader>P",
          cmd = "<cmd>lua require('spectre.actions').select_template()<CR>",
          desc = "Pick Template",
        },
        ["delete_line"] = {
          map = "<leader>D",
          cmd = "<cmd>lua require('spectre.actions').run_delete_line()<CR>",
          desc = "Delete Line",
        },
      },
    }

    -- BSD sed's basic regex differs from ripgrep's, so a match using `+`, `|`
    -- or `\d` is found but not replaced. GNU sed with -E reads the same syntax.
    if vim.fn.executable("gsed") == 1 then
      opts.replace_engine = { sed = { cmd = "gsed", args = { "-i", "-E" } } }
    end

    return opts
  end,
}
