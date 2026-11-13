-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/mini-icons.lua
-- @brief: Icon provider. Mocks nvim-web-devicons so all plugins using it
--         transparently get mini.icons instead.

return {
  "nvim-mini/mini.icons",
  lazy = false,
  config = function()
    local config_ok, config = pcall(require, "meowvim.config")
    local glyphs = not config_ok or config.get("ui.icons", true)

    local icons = require("mini.icons")
    icons.setup({
      style = glyphs and "glyph" or "ascii",
    })
    -- Provide nvim-web-devicons-compatible API so lualine, neogit, etc.
    -- work without changes.
    icons.mock_nvim_web_devicons()
  end,
}
