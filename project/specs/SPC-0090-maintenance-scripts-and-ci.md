---
id: SPC-0090
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0800, REQ-0810, REQ-0820, REQ-0830, REQ-0840, REQ-0900, REQ-0910, REQ-0920, REQ-0930, REQ-0940, REQ-0950, REQ-0960, REQ-0850, REQ-0970, REQ-0980]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Maintenance scripts and CI

## Scope

This covers the test script, the docs check, the update script, CI and the lint settings.

## Boundary

- `bin/test-config.sh` tests the configuration at `$NVIM_CONFIG`, by default `~/.config/nvim`, and exits 1 when any test fails (from bin/test-config.sh:18, 289-295, high).
- `bin/check-docs.lua` runs as `nvim --headless -c "luafile bin/check-docs.lua"` and exits 1 on the first run with a problem (from bin/check-docs.lua:7, 146-152, high).
- `bin/update-meowvim.sh` updates the plugins, and `--rollback [name]` lists or restores a restore point; `NVIM_BACKUP_DIR` defaults to `~/.local/share/nvim/backups`, and 10 restore points are kept (from bin/update-meowvim.sh:21-26, 56-73, high).
- CI runs on pushes and pull requests to `main`: a lint job and a test matrix of Ubuntu and macOS with stable and nightly Neovim (from .github/workflows/ci.yml:3-51, high).

## Behaviour

It must do the following, as the requirements in force state:

- The documentation must name a `<leader>` mapping or a `:Command` only when the configuration defines it. (REQ-0800)
- `doc/meowvim.txt` must carry a `*:Name*` tag for every user command the configuration defines. (REQ-0810)
- The documentation must describe what the code does. (REQ-0820; broken now, BUG-0160, BUG-0170, BUG-0180, BUG-0190, BUG-0200, BUG-0210)
- The documentation must not use marketing language. (REQ-0830)
- The documentation must say where the mappings that aren't in `lua/config/keymaps.lua` are declared. (REQ-0840)
- Every Lua file under `lua/` and `init.lua` must pass `stylua --check` with the settings in `.stylua.toml`. (REQ-0900)
- `luacheck lua/ init.lua` must report no warnings with the settings in `.luacheckrc`. (REQ-0910)
- Every Lua and shell file must open with the `SPDX-License-Identifier: MIT` line and the copyright line. (REQ-0920)
- `bin/test-config.sh` must pass on Ubuntu and macOS with both stable and nightly Neovim. (REQ-0930)
- The lint check must run on macOS as well as on Linux. (REQ-0940)
- The repository must keep user configuration files out of version control. (REQ-0950)
- The code must not carry comments that restate the code. (REQ-0960)
- Every user command's description must describe what the command does. (REQ-0850; broken now, BUG-0100)
- The test script must validate the user config file the configuration loads. (REQ-0970; broken now, BUG-0130)
- When the user config fails validation, the test script must list the validation errors. (REQ-0980; broken now, BUG-0140)

What it does now:

- The test script checks, in order: a clean start, the config module, the user config, plugin stats, lspconfig, installed parsers, the health report, keymap conflicts, the docs check and a Lua syntax pass (from bin/test-config.sh:262-277, high).
- The docs check reads nine documents and checks every `<leader>` mapping and `:Command` they name against the running configuration, then checks that every user command has a tag in `doc/meowvim.txt` (from bin/check-docs.lua:17-27, 93-144, high).
- The update script saves `lazy-lock.json` as a restore point, runs `Lazy! sync`, checks the health report for the cross marker and prunes old restore points (from bin/update-meowvim.sh:33-108, 120-162, high).
- CI's lint job runs `stylua --check lua/ init.lua` and `luacheck lua/ init.lua` (from .github/workflows/ci.yml:10-34, high).
- CI's test job installs ripgrep, fd and, on Linux, the tree-sitter CLI, links the checkout to `~/.config/nvim`, writes a pinned user config, syncs the plugins and runs the test script (from .github/workflows/ci.yml:55-94, high).

## Failure paths

- The docs check reads its documents by relative path, so it works only from the repository root (from bin/test-config.sh:205 and bin/check-docs.lua:17-27, medium).
- The test script looks for the user config only at `~/.config/meowvim/config.lua`, ignoring `XDG_CONFIG_HOME` (from bin/test-config.sh:96, high).
- Whether `nvim --headless "+Lazy! sync" +qa` exits non-zero on a failed sync isn't established, so the update script's rollback-on-failure branch may never run (from bin/update-meowvim.sh:75-79, 145-149, low).
- CI doesn't format or lint `bin/check-docs.lua` (from .github/workflows/ci.yml:24, 34, high).
