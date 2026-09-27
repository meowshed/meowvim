---
id: SPC-0020
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0300, REQ-0310, REQ-0320, REQ-0330, REQ-0340, REQ-0350, REQ-0360, REQ-0370, REQ-0380, REQ-0390, REQ-0395]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# User settings, projects and toggles

## Scope

This covers the user's settings file, its validation and reloading, per-project overrides, and the `<leader>o` toggles that write back to it. Themes chosen through these settings are in the themes specification.

## Boundary

- The settings live in `$XDG_CONFIG_HOME/meowvim`, or `~/.config/meowvim` when that variable is unset, as `config.lua` and `projects.lua` (from lua/meowvim/config/init.lua:13-23, high).
- When `config.lua` is missing, it's created from a template with an INFO notification "Created default config at <path>" (from lua/meowvim/config/init.lua:25-81, high).
- The parsed settings are cached in `stdpath("state")/meowvim/config_cache.lua` (from lua/meowvim/config/cache.lua:9-15, high).
- Commands: `:MeowvimConfig`, `:MeowvimConfigReload`, `:MeowvimConfigValidate`, `:MeowvimConfigShow`, `:MeowvimProjects`, `:MeowvimProject {name}` and `:MeowvimProjectCurrent` (from lua/meowvim/commands.lua:10-83, high).
- `<leader>op` copies the toggles into the settings and writes `config.lua` (from lua/config/keymaps.lua:1480-1495, high).
- String values expand `$VAR` and `${VAR}`, and an unset variable becomes an empty string (from lua/meowvim/config/init.lua:83-106, high).
- The settings have the sections `core`, `editor`, `ui`, `performance`, `lsp`, `formatting`, `linting`, `git`, `sessions`, `snacks`, `toggles`, `plugins` and `custom`, with defaults in `lua/meowvim/config/defaults.lua` and constraints in `lua/meowvim/config/schema.lua` (from lua/meowvim/config/defaults.lua and lua/meowvim/config/schema.lua, high).
- A project entry in `projects.lua` has `path` (required), `theme`, `variant`, `on_open` and `inherit` (from lua/meowvim/config/init.lua:134-160, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must apply a saved edit to the user config file without a restart, except for options read before the plugins load. (REQ-0300)
- `config.get(key, default)` must return the default only when the key is absent. (REQ-0310)
- The configuration must reject a `projects.lua` entry that has no `path`. (REQ-0320)
- The configuration must keep the state of each `<leader>o` toggle across a restart once the user persists it. (REQ-0330; broken now, BUG-0080)
- The configuration must show an edit to the projects file in the project picker without a restart. (REQ-0340)
- The configuration must match a project path only on a directory boundary, so that `/home/user/app` doesn't match `/home/user/app-v2`. (REQ-0350; broken now, BUG-0150)
- When Neovim starts, the configuration must apply every `editor.*` and `ui.*` value in the user config. (REQ-0360; broken now, BUG-0010)
- Each settings key must have exactly one default. (REQ-0370; broken now, BUG-0040)
- The settings template must write only keys the configuration reads. (REQ-0380; broken now, BUG-0090)
- Persisting the settings must not write a value that only the current session set, such as a project's theme or a theme auto mode chose. (REQ-0390; broken now, BUG-0120)
- Persisting the settings must keep the comments in the user config. (REQ-0395; broken now, BUG-0120)

What it does now:

- The user's table is deep-merged over the defaults: tables merge, and any other value replaces the default (from lua/meowvim/config/init.lua:97-106, 195-202, high).
- The cache is used while its modification time is at least that of `config.lua`; otherwise `config.lua` is run again and the cache rewritten (from lua/meowvim/config/init.lua:113-125, high).
- Validation checks only the keys the schema declares, so an unknown or misspelt key is never reported (from lua/meowvim/config/schema.lua:117-166, medium).
- At startup, variant and enum errors are dropped, and the rest are shown once as "Config validation errors"; `:MeowvimConfigValidate` shows every error (from lua/meowvim/config/init.lua:206-225 and lua/meowvim/commands.lua:31-40, high).
- `config.get("a.b", default)` returns a stored `false` as `false` (from lua/meowvim/config/init.lua:237-265, high).
- A watcher reloads `config.lua` and `projects.lua` 500 ms after a change, and waits for InsertLeave or CmdlineLeave when the user is typing (from lua/meowvim/config/watcher.lua:14-72, 143-160, high).
- A reload re-runs the merge and the early settings, but not the theme or plugin options (from lua/meowvim/config/init.lua:318-329, medium).
- The current project is the first one whose expanded path equals the working directory or is a string prefix of it, so `/a/foo` also matches `/a/foobar`, which breaks REQ-0350 (BUG-0150) (from lua/meowvim/config/init.lua:380-408, medium).
- Detection re-runs on every `DirChanged` (from lua/meowvim/day_night.lua:479-488, high).
- Persisting writes the whole in-memory configuration back to `config.lua`, sorted, which drops the user's comments and layout and writes runtime-only values such as a project's theme (from lua/meowvim/config/init.lua:453-532, medium).
- Each toggle is mirrored in a `vim.g` variable that sessions carry. A stored value wins over the settings file, which wins over the default (from lua/utils/toggles.lua:4-55, 109-160, high).
- Of the toggles, only inlay hints, lint, Copilot, deleted lines, auto-format and auto-save are applied at startup; the rest take effect when their `<leader>o` key runs (from lua/utils/toggles.lua and a search of lua/, medium).

## Failure paths

- When `config.lua` raises an error, an ERROR "Error loading config" is shown and the defaults are used (from lua/meowvim/config/init.lua:121-128, high).
- When `config.lua` returns something other than a table, the defaults are used with no message (from lua/meowvim/config/init.lua:123-131, high).
- A settings table holding a function produces a cache that can't be parsed, so every load falls back to running `config.lua` (from lua/meowvim/config/cache.lua and lua/meowvim/config/init.lua:114-119, medium).
- An invalid project is skipped with a WARN "Invalid project '<name>'" (from lua/meowvim/config/init.lua:172-189, high).
- `:MeowvimProject` with an unknown name shows ERROR "Project not found" (from lua/meowvim/config/init.lua:415-418, high).
- A project's `on_open` runs without a guard when switching projects, so an error in it surfaces as a Lua error (from lua/meowvim/config/init.lua:431-433, high).
- When persisting can't open the file, it shows ERROR "Failed to write configuration" (from lua/meowvim/config/init.lua:523-531, high).
- `git.show_deleted` defaults to false in `defaults.lua` but to true in `schema.lua`; the effective default is false (from lua/meowvim/config/defaults.lua:83 and lua/meowvim/config/schema.lua:71, high).
