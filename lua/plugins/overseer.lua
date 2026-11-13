-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/overseer.lua
-- @brief: Task runner integration using overseer.nvim.

-- `vim.fs.find` matches names exactly unless it is given a predicate, so
-- extension patterns have to be expressed as a function. The search starts
-- from the directory overseer passes to the provider, which is the cwd for
-- :OverseerRun, so a template appears only inside a project that has the file.
local function find_root(names, dir)
  local match = vim.fs.find(names, { upward = true, path = dir, limit = 1 })[1]
  if match then
    return vim.fs.dirname(match)
  end
end

local function by_extension(...)
  local suffixes = { ... }
  return function(name)
    for _, suffix in ipairs(suffixes) do
      if name:sub(-#suffix) == suffix then
        return true
      end
    end
    return false
  end
end

local DOTNET_PROJECT = by_extension(".sln", ".csproj")

return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerRun",
    "OverseerToggle",
    "OverseerTaskAction",
    "OverseerShell",
    "OverseerOpen",
    "OverseerClose",
  },
  opts = {},
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    local TAG = require("overseer.constants").TAG

    -- Overseer 2.0 has no condition callback, so each template is a provider
    -- instead: the generator returns a reason string when the project file is
    -- missing, which hides the template and shows the reason in the report.
    ---@param name string
    ---@param tag string
    ---@param root string|string[]|fun(name: string): boolean
    ---@param cmd string[]
    local function register(name, tag, root, cmd)
      overseer.register_template({
        name = name,
        generator = function(search)
          local cwd = find_root(root, search.dir)
          if not cwd then
            return "No project file found for " .. name
          end
          return {
            {
              name = name,
              tags = { tag },
              builder = function()
                return {
                  cmd = cmd,
                  cwd = cwd,
                  -- Open the output in a float on start, so a task never
                  -- runs unseen in the background.
                  components = { "default", "unique", { "open_output", direction = "float" } },
                }
              end,
            },
          }
        end,
      })
    end

    register("go test ./...", TAG.TEST, { "go.mod" }, { "go", "test", "./..." })
    register("dotnet build", TAG.BUILD, DOTNET_PROJECT, { "dotnet", "build" })
  end,
}
