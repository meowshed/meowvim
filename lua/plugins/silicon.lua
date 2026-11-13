-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/silicon.lua
-- @brief: Code screenshot generation tool with beautiful syntax highlighting

return {
  "michaelrommel/nvim-silicon",
  -- Every other external-tool integration in this config gates on the binary.
  -- The gate lives on the spec so that, without silicon, neither :Silicon nor
  -- <leader>cs exists, instead of a key that fails with E492.
  cond = function()
    return vim.fn.executable("silicon") == 1
  end,
  lazy = true,
  cmd = "Silicon",
  keys = {
    { "<leader>cs", "<cmd>Silicon<cr>", mode = "v", desc = "Create Code Screenshot" },
  },
  config = function()
    local function hl_bg(name, fallback)
      local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
      return (hl and hl.bg) and string.format("#%06x", hl.bg) or fallback
    end

    require("nvim-silicon").setup({
      font = "JetBrainsMono Nerd Font=34",
      theme = "Dracula",
      -- Follows the active colorscheme instead of a hardcoded catppuccin teal.
      background = hl_bg("Visual", "#94e2d5"),
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
      end,
      pad_horiz = 80,
      pad_vert = 60,
      line_offset = function(args)
        return args.line1
      end,
      -- The plugin runs silicon without a shell, so nothing expands `~` and
      -- silicon doesn't create a missing directory.
      output = function()
        local dir = vim.fn.expand("~/Pictures/Screenshots")
        vim.fn.mkdir(dir, "p")
        return dir .. "/code_" .. os.date("%Y%m%d_%H%M%S") .. ".png"
      end,
      tab_width = 2,
      shadow_color = "#100808",
    })
  end,
}
