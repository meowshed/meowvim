---
id: SPC-0030
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0400, REQ-0410, REQ-0420, REQ-0430, REQ-0440]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Themes and day/night switching

## Scope

This covers the 17 bundled colorschemes, switching between them, and following the system's light or dark appearance. The settings keys that store the choice are in the settings specification.

## Boundary

- 17 themes are described once, in `lua/meowvim/themes.lua`, and both the plugin specs and the switcher are generated from that table (from lua/meowvim/themes.lua:7-9, 20-433, high).
- Commands: `:ColorschemeSelect`, `:ThemeSettings`, `:DayNightMode [manual|auto]`, `:DayNightToggle`, `:DayNightSetup`, `:DayNightSetTheme day|night` and `:DayNightPreset [name]` (from lua/meowvim/colorscheme_switcher.lua:185-187, lua/meowvim/theme_manager.lua:193-195, lua/meowvim/day_night.lua:490-543 and lua/meowvim/day_night_presets.lua:276-293, high).
- `<leader>ok` opens the theme settings, and `<leader>oK` switches between the day and night theme (from lua/config/keymaps.lua:1498-1513, high).
- 16 presets pair a day theme with a night theme (from lua/meowvim/day_night_presets.lua:32-174, high).
- The appearance probe uses `osascript` or `defaults` on macOS, `reg query` on Windows, and `gsettings`, `kreadconfig5` or the freedesktop portal elsewhere (from lua/meowvim/day_night.lua:22-104, high).
- The lazygit theme is written to `stdpath("state")/meowvim/lazygit-theme.yml` and layered over the user's lazygit config through `LG_CONFIG_FILE` (from lua/plugins/lazygit.lua:32-48, 91-95, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must not block typing while it probes the system appearance. (REQ-0400)
- The configuration must load only the active colorscheme at startup. (REQ-0410)
- The configuration must not edit the user's lazygit config. (REQ-0420)
- The configuration must render Copilot ghost text so that it stands apart from normal code in every bundled theme. (REQ-0430)
- When the user changes the day/night mode, the new mode must still be in effect after a restart. (REQ-0440; broken now, BUG-0110)

What it does now:

- Only the theme in `core.theme` loads at startup; the others are installed and lazy (from lua/plugins/themes.lua:15-40, high).
- Applying a theme loads its plugin first, then runs its setup under a guard (from lua/meowvim/themes.lua:453-476, high).
- `:ColorschemeSelect` applies the chosen theme with a variant picked for the current mode, saves `core.theme` and `core.variant`, and notifies "Theme set to" (from lua/meowvim/colorscheme_switcher.lua:58-95, 124-148, high).
- `:ColorschemeSelect` describes itself as having a live preview, but nothing is applied until an item is chosen (from lua/meowvim/colorscheme_switcher.lua:66-94, 187, high).
- In auto mode the probe runs asynchronously every 30 seconds and on focus gain, and the current mode is answered from the last result, so it never blocks (from lua/meowvim/day_night.lua:7-10, 108-137, 175-182, 319-334, high).
- `:DayNightMode` and `:DayNightToggle` change the mode in memory only, so a restart restores the mode in `config.lua` (from lua/meowvim/day_night.lua:215-263, high).
- Applying a preset sets both slots, saves once and re-applies the current mode (from lua/meowvim/day_night_presets.lua:196-235, high).
- On a colorscheme change, lualine re-reads its colours, the lazygit theme is rewritten, and Copilot's ghost text takes the comment colour in italics (from lua/plugins/lualine.lua:157-165, lua/plugins/lazygit.lua:98-103 and lua/plugins/themes.lua:43-51, high).
- The gruvbox theme always sets a dark background, so the gruvbox preset's day slot is dark (from lua/meowvim/themes.lua:117, high).

## Failure paths

- An error inside a theme's setup shows ERROR "Failed to apply theme" (from lua/meowvim/themes.lua:466-474, high).
- An unknown theme name is ignored with no message (from lua/meowvim/themes.lua:454-457, high).
- On a platform with no probe, auto mode shows WARN "System theme sync not supported on this platform" (from lua/meowvim/day_night.lua:305-308, high).
- When every probe fails, the theme doesn't change (from lua/meowvim/day_night.lua:113-116, 193-195, high).
- An invalid mode, slot or preset shows an ERROR naming the valid values (from lua/meowvim/day_night.lua:216-220, 514-523 and lua/meowvim/day_night_presets.lua:197-201, high).
- With `git.lazygit_theme_sync` set to false, the lazygit theme isn't written (from lua/plugins/lazygit.lua:27-30, high).
