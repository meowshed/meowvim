-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/copilot.lua
-- @brief: GitHub Copilot – inline suggestions.
--
-- Inline ghost text via copilot.suggestion API.
-- Copilot LSP binary (copilot-language-server) installed via mise.
--
-- Keymaps:
--   <C-l>  (insert)  – accept inline suggestion (blink-cmp.lua handles fallback to blink)
--   <Esc>  (insert)  – dismiss inline suggestion (blink-cmp.lua checks suggestion.is_visible())
--   <leader>oC       – toggle Copilot on/off globally (keymaps.lua)

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    -- The panel maps <M-CR> globally, and nothing here opens it.
    panel = { enabled = false },
    suggestion = {
      auto_trigger = true,
      -- blink-cmp.lua drives accept and dismiss through copilot.suggestion.
      keymap = {
        accept = false,
        next = false,
        prev = false,
        dismiss = false,
      },
    },
    server = {
      custom_server_filepath = "copilot-language-server",
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    -- `hide_during_completion` checks only pumvisible(), which blink's menu
    -- never sets, so ghost text would draw over the menu. blink announces its
    -- menu through User events instead. copilot reads the flag only when it
    -- redraws, so redraw at once: otherwise ghost text already on screen stays
    -- over the menu, and a hidden one returns only on the next keystroke.
    local group = vim.api.nvim_create_augroup("meowvim-copilot-blink", { clear = true })
    local function set_hidden(hidden)
      vim.b.copilot_suggestion_hidden = hidden
      pcall(require("copilot.suggestion").update_preview)
    end
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        set_hidden(true)
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      group = group,
      pattern = "BlinkCmpMenuClose",
      callback = function()
        set_hidden(false)
      end,
    })

    -- The plugin loads on InsertEnter regardless of the user config, so honour
    -- `toggles.copilot` / `core.enable_copilot` here. Without this Copilot kept
    -- suggesting inline completions while the config said it was disabled.
    -- <leader>oC drives :Copilot enable / :Copilot disable from the same flag.
    if not vim.g.copilot_enabled then
      require("copilot.command").disable()
    end
  end,
}
