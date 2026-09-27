---
id: SPC-0080
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-1000, REQ-1010, REQ-1020]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Diagnostics tools

## Scope

This covers the health check, the profiler and the startup tracker. The keymap conflict checker is in the keymaps specification.

## Boundary

- `:checkhealth meowvim` runs the health check (from lua/meowvim/health.lua:387-396, high).
- Commands: `:ProfileStart`, `:ProfileStop`, `:MeowvimProfile`, `:MeasureRender` and `:StartupTrends` (from lua/meowvim/profiler.lua:128-142 and lua/meowvim/startup_tracker.lua:155-157, high).
- Mappings live under `<leader>oP` (from lua/config/keymaps.lua:1249-1279, high).
- The profiler writes `/tmp/nvim-profile.log`, and the tracker writes `stdpath("data")/startup_metrics.json` (from lua/meowvim/profiler.lua:42-45 and lua/meowvim/startup_tracker.lua:9, high).

## Behaviour

It must do the following, as the requirements in force state:

- `:StartupTrends` must show the recorded startups whenever at least one is recorded. (REQ-1000; broken now, BUG-0030)
- The health check must pass the version check on every Neovim release at or above 0.12. (REQ-1010; broken now, BUG-0060)
- The health check must name only plugins the configuration installs. (REQ-1020; broken now, BUG-0070)

What it does now:

- The health check reports, in order, the Neovim version, the settings, the filesystem, external tools, the project's mise tools, the plugin manager, treesitter and the language servers (from lua/meowvim/health.lua:387-396, high).
- The version check passes only for major version 0 with minor version 12 or later (from lua/meowvim/health.lua:20-43, high).
- The mise section finds the nearest `mise.toml` and lists each declared tool that `mise ls --current` marks missing, with the command that installs it (from lua/meowvim/health.lua:114-220, high).
- Missing git is an error; missing rg or fd is a warning, with text that still names Telescope (from lua/meowvim/health.lua:223-262, high).
- The tracker records each startup's time and plugin counts and keeps the last 100 (from lua/meowvim/startup_tracker.lua:12-44, high).

## Failure paths

- `:StartupTrends` with exactly one recorded startup indexes an empty median and raises a Lua error (from lua/meowvim/startup_tracker.lua:88, 108, medium).
- A Neovim 1.x would be reported as too old (from lua/meowvim/health.lua:23, medium).
- A metrics file that can't be decoded is treated as empty (from lua/meowvim/startup_tracker.lua:47-62, high).
- `:MeowvimProfile` without lazy.nvim shows ERROR "lazy.nvim not loaded" (from lua/meowvim/profiler.lua:56-60, high).
