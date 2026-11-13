-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/nvim-lspconfig.lua
-- @brief: Language Server Protocol (LSP) client configuration and setup.
-- @requires: Neovim >= 0.12 (uses vim.lsp.config() and vim.lsp.enable() APIs)

return {
  "neovim/nvim-lspconfig",
  version = "v2.*", -- v2 deprecates .setup(); we use vim.lsp.config() + vim.lsp.enable() directly
  lazy = false,
  dependencies = {
    -- blink.cmp adds its completion capabilities to vim.lsp.config("*") when
    -- it loads, so it has to load before the first server starts.
    "saghen/blink.cmp",
    "b0o/SchemaStore.nvim",
  },
  config = function()
    local is_ci = vim.env.CI or vim.env.DOCKER or vim.fn.filereadable("/.dockerenv") == 1
    if is_ci then
      vim.notify("Skipping LSP setup in CI/container environment", vim.log.levels.INFO)
      return
    end

    -- docker_compose_language_service attaches only to `yaml.docker-compose`,
    -- which Neovim's own detection never sets. This spec isn't lazy, so the
    -- rule is in place before the first buffer opens.
    vim.filetype.add({
      filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
      },
    })

    -- Float borders come from `vim.o.winborder` (see lua/config/options.lua);
    -- Neovim 0.12 applies it to every floating window, so hover and signature
    -- help need no per-handler border config of their own.
    local config_ok, config = pcall(require, "meowvim.config")
    local diagnostics = (config_ok and config.get("lsp.diagnostics", nil)) or {}

    vim.diagnostic.config({
      virtual_text = diagnostics.virtual_text ~= false and { prefix = "", spacing = 2 } or false,
      underline = diagnostics.underline ~= false,
      update_in_insert = diagnostics.update_in_insert == true,
      severity_sort = true,
      signs = diagnostics.signs ~= false and {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚",
          [vim.diagnostic.severity.WARN] = "󰀪",
          [vim.diagnostic.severity.HINT] = "󰌶",
          [vim.diagnostic.severity.INFO] = "󰋼",
        },
      } or false,
      float = {
        source = "if_many",
        header = "",
        prefix = "",
      },
    })

    -- `vim.g.inlay_hints_enabled` is owned by utils.toggles (<leader>oi) and
    -- seeded from `toggles.inlay_hints` in the user config, so honour it here
    -- instead of switching hints on for every buffer that supports them.
    local on_attach = function(client, bufnr)
      if client.server_capabilities.inlayHintProvider and vim.g.inlay_hints_enabled then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end

    vim.api.nvim_create_user_command("LspOrganize", function()
      local clients = vim.lsp.get_clients({ bufnr = 0, name = "ts_ls" })
      if #clients == 0 then
        vim.notify("No TypeScript LSP client attached to current buffer", vim.log.levels.WARN)
        return
      end

      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "Organize Imports",
      }

      clients[1]:request("workspace/executeCommand", params, function(err, _)
        if err then
          vim.notify("Error organizing imports: " .. vim.inspect(err), vim.log.levels.ERROR)
        end
      end, 0)
    end, { desc = "Organize Imports (TypeScript/JavaScript)", force = true })

    local server_settings = {
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            workspace = { checkThirdParty = false },
          },
        },
      },
      bashls = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              constantValues = true,
              parameterNames = true,
            },
          },
        },
      },
      pyright = {
        settings = {
          python = { analysis = { typeCheckingMode = "basic" } },
        },
      },
      ts_ls = {
        -- <leader>co is mapped globally in lua/config/keymaps.lua and checks the
        -- filetype itself, so no buffer-local mapping is needed here.
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      },
      html = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
      cssls = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
      emmet_language_server = {},
      marksman = {},
      -- The SchemaStore catalogs are built in before_init, so a server that
      -- never starts never pays for them.
      jsonls = {
        before_init = function(_, client_config)
          client_config.settings.json.schemas = require("schemastore").json.schemas()
        end,
        settings = {
          json = {
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        before_init = function(_, client_config)
          client_config.settings.yaml.schemas = require("schemastore").yaml.schemas()
        end,
        settings = {
          yaml = {
            -- Use the SchemaStore.nvim catalog instead of fetching the server's
            -- own; the empty URL avoids a TypeError in yaml-language-server.
            schemaStore = { enable = false, url = "" },
          },
        },
      },
      dockerls = {},
      docker_compose_language_service = {},
      ltex_plus = {
        settings = {
          ltex = {
            language = "en-US",
          },
        },
      },
      texlab = {
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              onSave = true,
            },
            -- displayline opens the PDF in Skim and jumps to the cursor line;
            -- `open -a Skim` only opened the file.
            forwardSearch = {
              executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
              args = { "%l", "%p", "%f" },
            },
            chktex = {
              onOpenAndSave = true,
              onEdit = true,
            },
          },
        },
      },
      postgres_lsp = {},
    }

    local common_root_markers = {
      "package.json",
      "tsconfig.json",
      "jsconfig.json",
      "pyproject.toml",
      "setup.py",
      "requirements.txt",
      "go.mod",
      "Cargo.toml",
      "pom.xml",
      "build.gradle",
      ".git",
    }

    -- lspconfig v2 ships server definitions in its own lsp/ directory which
    -- Neovim 0.12 auto-discovers. We only supply overrides; cmd/filetypes come
    -- from lspconfig's bundled defaults automatically.
    -- These servers have a function `cmd` that picks the binary only when the
    -- client spawns, so Neovim can't see beforehand that it's missing and every
    -- matching buffer warns. When the binary isn't on PATH, setup_server()
    -- still starts the server in a project that has it in node_modules/.bin.
    local function_cmd_binaries = {
      ts_ls = "typescript-language-server",
      html = "vscode-html-language-server",
      cssls = "vscode-css-language-server",
      jsonls = "vscode-json-language-server",
      yamlls = "yaml-language-server",
    }

    local function setup_server(server_name)
      local server_opts = vim.tbl_deep_extend("force", {}, server_settings[server_name] or {})
      -- vim.lsp.config[name] is available in Neovim 0.12 after rtp is set by lazy.nvim.
      local default = vim.lsp.config[server_name] or {}
      -- Skip silently when the binary is missing. Neovim would skip a missing
      -- table `cmd` too, but it logs an error to lsp.log for every buffer.
      local cmd = server_opts.cmd or default.cmd
      local local_binary = function_cmd_binaries[server_name]
      local binary = local_binary or (type(cmd) == "table" and cmd[1])
      if local_binary and vim.fn.executable(local_binary) == 0 then
        -- lspconfig's function cmd prefers <root>/node_modules/.bin, so a
        -- project that installs the server as a dev dependency still gets it.
        -- Decide per root: start only where that local binary exists.
        local default_root_dir = default.root_dir
        local markers = server_opts.root_markers or default.root_markers or common_root_markers
        server_opts.root_dir = function(bufnr, on_dir)
          local function on_root(root)
            if root and vim.fn.executable(vim.fs.joinpath(root, "node_modules/.bin", local_binary)) == 1 then
              on_dir(root)
            end
          end
          if type(default_root_dir) == "function" then
            default_root_dir(bufnr, on_root)
          else
            on_root(default_root_dir or vim.fs.root(bufnr, markers))
          end
        end
      elseif binary and vim.fn.executable(binary) == 0 then
        return
      end

      -- vim.lsp.config() replaces a function when it merges, so the wrapper has
      -- to call lspconfig's own on_attach, which defines commands such as
      -- :LspPyrightOrganizeImports and the :LspTexlab* family.
      local default_on_attach = default.on_attach
      local custom_on_attach = server_opts.on_attach
      server_opts.on_attach = function(client, bufnr)
        if default_on_attach then
          default_on_attach(client, bufnr)
        end
        on_attach(client, bufnr)
        if custom_on_attach then
          custom_on_attach(client, bufnr)
        end
      end

      -- A server's own markers know its config files, so the shared list is
      -- only a fallback for a server that has no way to find its root.
      if not (server_opts.root_markers or server_opts.root_dir or default.root_markers or default.root_dir) then
        server_opts.root_markers = common_root_markers
      end

      vim.lsp.config(server_name, server_opts)
      vim.lsp.enable(server_name)
    end

    for server_name, _ in pairs(server_settings) do
      setup_server(server_name)
    end

    -- GDScript uses a TCP server started by Godot rather than a spawned process
    vim.lsp.config("gdscript", {
      root_markers = { "project.godot", ".git" },
      on_attach = on_attach,
    })
    vim.lsp.enable("gdscript")
  end,
}
