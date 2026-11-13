-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/noice.lua
-- @brief: Enhanced UI components for messages, cmdline, and popupmenu.

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- Notifications render through snacks.notifier: noice's default
  -- `views.notify.backend` is { "snacks", "notify" } and the snacks backend is
  -- available whenever snacks.notifier is enabled, so nvim-notify is never used.
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      -- blink.cmp shows signature help, and two windows would open on `(` and `,`.
      signature = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    routes = {
      {
        -- Hide the message :write prints. Neovim 0.12 sends it as two "progress"
        -- messages with the id "bufwrite": `"file" ` and then
        -- `"file" [New] 2L, 4B written`. noice can't filter on the id, and the
        -- kind alone would also hide Neogit's push and fetch spinner and
        -- :checkhealth's progress line, so match both texts as well.
        filter = {
          any = {
            { event = "msg_show", kind = "progress", find = '^".*" $' },
            { event = "msg_show", kind = "progress", find = "%d+B written$" },
          },
        },
        opts = { skip = true },
      },
    },
  },
}
