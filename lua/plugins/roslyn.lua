-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/roslyn.lua
-- @brief: Roslyn language server integration for C#.

return {
  "seblyng/roslyn.nvim",
  ft = { "cs" },
  -- The plugin calls vim.lsp.enable("roslyn") as soon as it loads, so a guard inside config()
  -- can't stop it; skip the plugin entirely when the server isn't installed.
  cond = vim.fn.executable("roslyn-language-server") == 1,
  -- vim.lsp.config() goes in init because the plugin may start the client before config()
  -- runs, and a client keeps the settings it started with.
  init = function()
    local caps_ok, blink = pcall(require, "blink.cmp")

    vim.lsp.config("roslyn", {
      -- The plugin's default cmd adds --daemon-mode, which only the roslyn-language-server
      -- dotnet tool understands. The mise build (github:Crashdummyy/roslynLanguageServer) is
      -- the bare Microsoft.CodeAnalysis.LanguageServer and exits on that flag.
      cmd = { "roslyn-language-server", "--stdio", "--clientProcessId", tostring(vim.uv.os_getpid()) },
      capabilities = caps_ok and blink.get_lsp_capabilities() or nil,
      -- Same rule as the other servers in nvim-lspconfig.lua: <leader>oi owns the hint state.
      on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider and vim.g.inlay_hints_enabled then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end,
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          csharp_enable_inlay_hints_for_types = true,
          dotnet_enable_inlay_hints_for_parameters = true,
          dotnet_enable_inlay_hints_for_literal_parameters = true,
          dotnet_enable_inlay_hints_for_indexer_parameters = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          dotnet_enable_inlay_hints_for_other_parameters = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ["csharp|completion"] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
          dotnet_show_name_completion_suggestions = true,
        },
        ["csharp|symbol_search"] = {
          -- Workspace symbol search also finds types in referenced assemblies.
          dotnet_search_reference_assemblies = true,
        },
        ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = true,
          dotnet_enable_tests_code_lens = true,
        },
      },
    })
  end,
  opts = {
    -- Neovim's own file watcher is slow on large solutions; the server watches files itself.
    filewatching = "roslyn",
  },
}
