-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/csharpls-extended.lua
-- @brief: Decompiled metadata for csharp-ls: go to definition opens the source of a referenced assembly.

return {
  "Decodetalkers/csharpls-extended-lsp.nvim",
  ft = { "cs" },
  config = function()
    -- csharp-ls serves decompiled sources only with the metadata-uris feature, set in nvim-lspconfig.lua.
    require("csharpls_extended").buf_read_cmd_bind()
  end,
}
