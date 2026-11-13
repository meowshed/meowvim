-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/nvim-dap.lua
-- @brief: Debug Adapter Protocol (DAP) client for debugging integration.
--
-- Adapters and launch configurations only; the <leader>d keymaps live in
-- lua/config/keymaps.lua, which is what lets this plugin stay lazy — it used to
-- register them here and therefore loaded on every startup together with
-- dap-ui, dap-go, dap-python, nvim-nio and dap-virtual-text.

return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      config = function()
        local dapui = require("dapui")
        dapui.setup()
        local dap = require("dap")
        -- Open as the attach or launch request goes out, the hooks the dap-ui
        -- README uses, so the UI is up before the adapter's first output.
        dap.listeners.before.attach["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.launch["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
    {
      "leoluz/nvim-dap-go",
      -- dap-go only launches Delve, so without dlv it has nothing to offer.
      cond = vim.fn.executable("dlv") == 1,
      config = function()
        require("dap-go").setup()
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        -- "uv" runs the debugpy adapter with `uv run --with debugpy`, so no
        -- Python on the machine needs debugpy installed. Without uv, fall back
        -- to a python3 that has debugpy. The pythonPath that runs the program
        -- is still resolved per project by dap-python via VIRTUAL_ENV, .venv,
        -- pyenv, etc. at session start.
        require("dap-python").setup(vim.fn.executable("uv") == 1 and "uv" or "python3")
      end,
    },
  },
  config = function()
    local dap = require("dap")

    if vim.fn.executable("netcoredbg") == 1 then
      dap.adapters.coreclr = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }
    end

    dap.adapters.godot = {
      type = "server",
      host = "127.0.0.1",
      port = 6006,
    }

    dap.configurations.gdscript = {
      {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "${workspaceFolder}",
        launch_scene = true,
      },
    }

    if vim.fn.executable("netcoredbg") == 1 then
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET",
          request = "launch",
          program = function()
            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end
  end,
}
