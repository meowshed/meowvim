-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/neotest.lua
-- @brief: Framework for running and displaying test results interactively.
--
-- Rust tests use rustaceanvim's adapter, which discovers them through
-- rust-analyzer; neotest-rust was archived in August 2025.

return {
  "nvim-neotest/neotest",
  cmd = "Neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    -- Go; neotest-go is the only part that still requires plenary.
    { "nvim-neotest/neotest-go", dependencies = { "nvim-lua/plenary.nvim" } },
    -- Python (pytest, unittest, doctest)
    "nvim-neotest/neotest-python",
    -- JavaScript / TypeScript (vitest)
    "marilari88/neotest-vitest",
    -- JavaScript / TypeScript (jest)
    "nvim-neotest/neotest-jest",
    -- C# and F# (VSTest and Microsoft.Testing.Platform)
    "nsidorenco/neotest-vstest",
  },
  config = function()
    local adapters = {
      require("neotest-go")({
        args = { "-race", "-count=1", "-timeout=60s" },
      }),
      require("neotest-python")({
        dap = { justMyCode = false },
      }),
      require("neotest-vitest"),
      require("neotest-jest")({
        -- Search upward from the test file, so each package in a monorepo
        -- gets its own config; the adapter's default skips .cjs and .mjs.
        jestConfigFile = function(file_path)
          return vim.fs.find(
            { "jest.config.ts", "jest.config.js", "jest.config.cjs", "jest.config.mjs" },
            { upward = true, path = vim.fs.dirname(file_path), limit = 1 }
          )[1]
        end,
        env = { CI = "true" },
      }),
      require("rustaceanvim.neotest"),
    }

    -- A failed require inside the list would abort setup and take every other
    -- language with it, so neotest-vstest loads only once lazy.nvim has
    -- installed it. Its debug strategy expects a dap adapter named
    -- "netcoredbg"; nvim-dap.lua registers netcoredbg as "coreclr".
    local vstest_ok, vstest = pcall(require, "neotest-vstest")
    if vstest_ok then
      table.insert(adapters, vstest({ dap_settings = { type = "coreclr" } }))
    end

    require("neotest").setup({
      adapters = adapters,

      -- Only the summary width differs from neotest's defaults; `status`,
      -- `diagnostic` and the floating border (which falls back to
      -- `vim.o.winborder`) were restating them.
      summary = {
        open = "botright vsplit | vertical resize 60",
      },
    })
  end,
}
