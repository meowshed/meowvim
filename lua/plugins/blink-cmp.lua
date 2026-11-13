-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/blink-cmp.lua
-- @brief: Completion engine — blink.cmp v1 (replaces nvim-cmp).
--
-- KEYMAPS (insert mode):
--   <C-j>      select next item
--   <C-k>      select prev item
--   <C-l>      accept Copilot inline suggestion if visible, else selected item
--   <C-u>      scroll docs up
--   <C-d>      scroll docs down
--   <C-Space>  trigger completion
--   <Tab>      jump to next snippet placeholder
--   <S-Tab>    jump to previous snippet placeholder
--   <CR>       newline (never auto-accepts)
--   <Esc>      dismiss Copilot inline suggestion and hide blink menu, staying
--              in insert; with neither visible, exit insert
--
-- Copilot inline suggestions (copilot.lua) are separate from blink menu:
-- copilot.lua hides the overlay while the menu is open, on blink's
-- BlinkCmpMenuOpen and BlinkCmpMenuClose events; <C-l> and <Esc> handle the
-- overlay when the menu is closed.

return {
  "saghen/blink.cmp",
  version = "1.*",
  -- Not lazy: blink's plugin/blink-cmp.lua registers its completion
  -- capabilities with vim.lsp.config("*") when it's sourced, and that has to
  -- happen before the first server starts, so any `event` here would be late.
  lazy = false,
  dependencies = {
    "L3MON4D3/LuaSnip",
    "nvim-mini/mini.icons",
    "ribru17/blink-cmp-spell",
  },
  opts = function()
    local mini_icons = require("mini.icons")

    return {
      snippets = { preset = "luasnip" },

      keymap = {
        preset = "none",
        ["<C-j>"] = {
          function()
            local ok, suggestion = pcall(require, "copilot.suggestion")
            if ok and suggestion.is_visible() then
              suggestion.dismiss()
            end
            return false
          end,
          "select_next",
          "fallback",
        },
        ["<C-k>"] = {
          function()
            local ok, suggestion = pcall(require, "copilot.suggestion")
            if ok and suggestion.is_visible() then
              suggestion.dismiss()
            end
            return false
          end,
          "select_prev",
          "fallback",
        },
        ["<C-l>"] = {
          function(cmp)
            local ok, suggestion = pcall(require, "copilot.suggestion")
            if ok and suggestion.is_visible() then
              suggestion.accept()
              return true
            end
            return cmp.accept()
          end,
        },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<CR>"] = { "fallback" },
        ["<Esc>"] = {
          function(cmp)
            local ok, suggestion = pcall(require, "copilot.suggestion")
            local had_inline = ok and suggestion.is_visible()
            if had_inline then
              suggestion.dismiss()
            end
            if cmp.is_visible() then
              cmp.hide()
              return true
            end
            if had_inline then
              return true
            end
            return false
          end,
          "fallback",
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "spell" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          -- The source already turns itself off when 'spell' is unset.
          spell = {
            name = "Spell",
            module = "blink-cmp-spell",
          },
        },
      },

      completion = {
        menu = {
          draw = {
            components = {
              -- Kind icons come from mini.icons so the completion menu matches
              -- the icons used everywhere else (file explorer, pickers, lualine).
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local icon, hl = mini_icons.get("lsp", ctx.kind)
                  return icon or ctx.kind_icon, hl or ("BlinkCmpKind" .. ctx.kind)
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = { enabled = true },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },

      -- Window borders come from `vim.o.winborder`; blink falls back to it
      -- whenever `border` is unset (blink/cmp/lib/window/utils.lua).
      signature = {
        enabled = true,
      },

      fuzzy = {
        sorts = {
          -- blink-cmp-spell's README recommends ordering its items by label
          -- among themselves. Listing sorts replaces blink's default, so the
          -- default order (score, then sort_text) follows for everything else.
          function(a, b)
            if a.source_id == "spell" and b.source_id == "spell" then
              return require("blink.cmp.fuzzy.sort").label(a, b)
            end
          end,
          "score",
          "sort_text",
        },
      },
    }
  end,
}
