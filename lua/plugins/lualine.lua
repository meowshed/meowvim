-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/lualine.lua
-- @brief: Customizable statusline with Git, LSP, and mode indicators.

-- Status colours are resolved from the active colorscheme instead of a fixed
-- palette, so they stay readable across all bundled themes. The cache is
-- dropped and lualine re-configured on ColorScheme, which is what makes the
-- day/night toggle pick up the new colours without a restart.
local cached_colors = nil

local function hl_fg(...)
  for _, name in ipairs({ ... }) do
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    if hl and hl.fg then
      return string.format("#%06x", hl.fg)
    end
  end
  return nil
end

local function get_colors()
  if not cached_colors then
    cached_colors = {
      green = hl_fg("DiagnosticOk", "String", "diffAdded") or "#a6e3a1",
      blue = hl_fg("DiagnosticInfo", "Function") or "#89b4fa",
      grey = hl_fg("Comment", "NonText") or "#6c7086",
      orange = hl_fg("DiagnosticWarn", "Constant") or "#fab387",
      red = hl_fg("DiagnosticError", "Error") or "#f38ba8",
    }
  end
  return cached_colors
end

-- gitsigns already tracks hunk counts per buffer; reuse them so lualine does
-- not spawn its own `git diff` for every buffer it renders.
local function gitsigns_diff()
  local gs = vim.b.gitsigns_status_dict
  if gs then
    return { added = gs.added, modified = gs.changed, removed = gs.removed }
  end
end

local WINBAR_EXCLUDED = {
  "help",
  "lazy",
  "qf",
  "snacks_dashboard",
  "snacks_explorer",
  "snacks_input",
  "snacks_picker_input",
  "snacks_picker_list",
  "snacks_terminal",
  "toggleterm",
}

local function build_opts()
  local config_ok, config = pcall(require, "meowvim.config")
  local icons_enabled = not config_ok or config.get("ui.icons", true)
  local show_winbar = not config_ok or config.get("ui.winbar", true)

  local colors = get_colors()
  local winbar_section = show_winbar and { lualine_c = { { "filename", path = 1 } } } or {}

  return {
    options = {
      theme = "auto",
      icons_enabled = icons_enabled,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      ignore_focus = {},
      refresh = {
        statusline = 1000,
        winbar = 1000,
      },
      always_divide_middle = true,
      globalstatus = true,
      disabled_filetypes = {
        statusline = {},
        winbar = WINBAR_EXCLUDED,
      },
    },
    winbar = winbar_section,
    inactive_winbar = winbar_section,
    sections = {
      lualine_a = {
        "mode",
        -- noice hides Neovim's own "recording @q" message, and which-key removes its <Space>
        -- trigger while a macro records, so a stray q<letter> silently breaks <leader> maps.
        {
          function()
            return (icons_enabled and "󰑋 " or "@") .. vim.fn.reg_recording()
          end,
          cond = function()
            return vim.fn.reg_recording() ~= ""
          end,
          color = { fg = colors.orange, gui = "bold" },
        },
      },
      lualine_b = {},
      lualine_c = {
        "branch",
        { "diff", source = gitsigns_diff },
        { "filename", path = 1 },
      },
      lualine_x = {
        "diagnostics",
        {
          "copilot",
          symbols = {
            status = {
              icons = {
                enabled = "",
                sleep = "",
                disabled = "",
                warning = "",
                unknown = "",
              },
              hl = {
                enabled = colors.green,
                sleep = colors.blue,
                disabled = colors.grey,
                warning = colors.orange,
                unknown = colors.red,
              },
            },
            spinners = "dots",
            spinner_color = colors.blue,
          },
          show_colors = true,
          show_loading = true,
        },
        "filetype",
        "encoding",
        {
          "fileformat",
          symbols = {
            unix = "LF",
            dos = "CRLF",
            mac = "CR",
          },
        },
      },
      lualine_y = {},
      lualine_z = {
        "progress",
        "location",
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "progress", "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = {
      "lazy",
      "man",
      "nvim-dap-ui",
      "overseer",
      "quickfix",
      "toggleterm",
    },
  }
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("meowvim-lualine-palette", { clear = true }),
  callback = function()
    cached_colors = nil
    if package.loaded["lualine"] then
      require("lualine").setup(build_opts())
    end
  end,
})

-- The statusline refreshes once a second; redraw at once so the recording indicator
-- appears with the first keystroke. RecordingLeave fires before the register clears,
-- hence the schedule.
vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
  group = vim.api.nvim_create_augroup("meowvim-lualine-recording", { clear = true }),
  callback = function()
    vim.schedule(function()
      if package.loaded["lualine"] then
        require("lualine").refresh({ place = { "statusline" } })
      end
    end)
  end,
})

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "echasnovski/mini.icons",
    "AndreM222/copilot-lualine",
  },
  opts = build_opts,
}
