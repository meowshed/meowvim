-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/copilot-lualine.lua
-- @brief: Lualine integration for GitHub Copilot status display.

-- No dependency on copilot.lua: that would load Copilot at startup with
-- lualine. The component checks `package.loaded["copilot"]` and shows the
-- unknown icon until Copilot loads on InsertEnter.
return {
  "AndreM222/copilot-lualine",
}
