-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/snacks.lua
-- @brief: Collection of useful utilities and UI components.

return {
  "folke/snacks.nvim",
  version = "v2.*", -- Pin to stable 2.x releases
  priority = 1000,
  lazy = false,
  opts = function()
    local config_ok, config = pcall(require, "meowvim.config")
    local image_preview = true
    local lazygit_theme_sync = true
    local custom_styles = true
    local startup_dashboard = true
    local project_limit = 8

    if config_ok then
      image_preview = config.get("snacks.image_preview", true)
      lazygit_theme_sync = config.get("git.lazygit_theme_sync", true)
      custom_styles = config.get("snacks.custom_styles", true)
      startup_dashboard = config.get("performance.startup_dashboard", true)
      project_limit = config.get("snacks.dashboard.show_projects", project_limit)
    end

    return {
      dashboard = {
        -- Skip the dashboard when this cwd is a project / has a saved session;
        -- in that case auto_restore() (VimEnter) opens it instead. The dashboard
        -- auto-opens on UIEnter (before VimEnter), so it must be gated here
        -- statically rather than closed afterwards.
        enabled = startup_dashboard and not (function()
          local ok, session = pcall(require, "utils.session")
          return ok and session.should_auto_restore()
        end)(),
        width = 52,
        preset = {
          keys = {
            { icon = " ", key = "p", desc = "Open Project", action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = " ", key = "n", desc = "Create File", action = ":ene | startinsert" },
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "r", desc = "Show Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "q", desc = "Quit Neovim", action = ":qa" },
          },
          header = [[meowvim
-------]],
        },
        sections = {
          { section = "header", padding = 1 },
          { section = "projects", limit = project_limit, padding = 1 },
          { section = "keys", gap = 0, padding = 1 },
          { section = "startup", padding = 1 },
        },
      },

      bigfile = {},
      dim = {},
      explorer = {},
      -- GitHub CLI integration: gh_pr / gh_issue / gh_diff / gh_actions pickers.
      -- Replaces gh.nvim + litee.nvim; requires the `gh` binary.
      gh = {},
      input = {},
      -- `configure` writes a lazygit theme from the active colorscheme and layers it
      -- over lazygit's own config through LG_CONFIG_FILE. It also points lazygit's
      -- editor at this Neovim, so turning the theme sync off turns that off too.
      lazygit = {
        configure = lazygit_theme_sync,
      },
      notifier = {},
      -- Renders the file before plugins load when opening `nvim <file>`.
      quickfile = {},
      terminal = {},
      -- LSP document highlights + ]w / [w navigation between references.
      words = {},
      image = {
        enabled = image_preview,
      },
      -- No `scope` module: mini.indentscope draws the scope and owns ii, ai, [i, and ]i,
      -- and snacks.scope would map the same keys. snacks.dim calls the scope API
      -- directly, so it works without the module.
      scratch = {
        ft = "markdown",
        filekey = {
          branch = false,
        },
      },
      -- snacks has no switch for styles, so leave the table out to keep its defaults.
      styles = custom_styles and {
        notification = {
          wo = {
            winblend = 0,
          },
        },
      } or nil,

      picker = {
        hidden = true,
        layout = { preset = "ivy" },
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
            auto_close = true,
            jump = {
              close = true,
            },
          },
          projects = {
            dev = {
              "~/workspace",
              "~/dev",
              "~/projects",
            },
            -- Configured projects from ~/.config/meowvim/projects.lua
            projects = (function()
              local ok, cfg = pcall(require, "meowvim.config")
              if ok then
                return cfg.get_project_paths()
              end
              return {}
            end)(),
            -- Only scan for git repos in dev dirs. Configured projects are listed with the
            -- rest and sorted by frecency, like any other project.
            patterns = { ".git" },
            recent = true,
            confirm = function(picker, item)
              picker:close()
              if not item or not item.file then
                return
              end

              local dir = item.file
              local session_utils = require("utils.session")

              session_utils.save()

              local session_loaded = false
              vim.api.nvim_create_autocmd("SessionLoadPost", {
                once = true,
                callback = function()
                  session_loaded = true
                end,
              })

              vim.defer_fn(function()
                if not session_loaded then
                  require("snacks").picker.files()
                end
              end, 100)

              session_utils.reset()

              vim.fn.chdir(dir)

              local ok, cfg = pcall(require, "meowvim.config")
              if ok then
                local current_project = cfg.detect_current_project()
                if current_project and current_project.on_open then
                  vim.defer_fn(function()
                    vim.cmd(current_project.on_open)
                  end, 150)
                end
              end

              local session = require("snacks").dashboard.sections.session()
              if not session then
                return
              end

              local action = session.action
              if type(action) == "function" then
                action()
                return
              end

              if type(action) == "string" then
                if action:sub(1, 1) == ":" then
                  vim.cmd(action:sub(2))
                else
                  vim.cmd(action)
                end
              end
            end,
          },
          lsp_workspace_symbols = {
            tree = true,
          },
        },
      },
    }
  end,
}
