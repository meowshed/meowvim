---
id: SPC-0060
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0700, REQ-0710, REQ-0720, REQ-0740, REQ-0750, REQ-0760]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Workspace and editing UI

## Scope

This covers sessions, the dashboard, pickers, the explorer, buffers, auto-save and the editing plugins. Git is in the Git specification.

## Boundary

- Commands: `:AutoSaveDisable[!]`, `:AutoSaveEnable[!]` and `:AutoSaveToggle[!]`, where `!` applies to the buffer (from lua/plugins/auto-save.lua:56-104, high).
- The project picker looks under `~/workspace`, `~/dev` and `~/projects`, plus the configured project paths (from lua/plugins/snacks.lua:131-148, high).
- silicon writes screenshots to `~/Pictures/Screenshots` (from lua/plugins/silicon.lua:40-42, high).
- meow.review keeps annotations in `.cache/meow-review/` under the project root (from lua/plugins/meow-review.lua:46-57, high).
- `sessions.*`, `performance.*`, `snacks.*`, `ui.icons` and `ui.winbar` configure this part (from lua/plugins/snacks.lua:27-33, lua/plugins/persistence.lua:19-42, lua/plugins/hbac.lua:15-18 and lua/plugins/lualine.lua:60-61, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must restore a session only when Neovim starts with no file arguments and a session exists for the directory. (REQ-0700)
- The file and project pickers must list hidden dotfiles. (REQ-0710)
- The file explorer must show hidden dotfiles and directories. (REQ-0720)
- The configuration must show the indentation scope around the cursor. (REQ-0740)
- The configuration must keep scratch notes for each working directory. (REQ-0750)
- The configuration must let the user annotate lines for review and export the annotations. (REQ-0760)

What it does now:

- A session is restored on a fresh interactive start with no file arguments when a session exists for the directory or the project has an `on_open` (from lua/utils/session.lua:68-155, high).
- The dashboard opens only when `performance.startup_dashboard` is on and no session will be restored (from lua/plugins/snacks.lua:37-44, high).
- Sessions are saved 100 ms after each directory change unless `sessions.auto_save` is false (from lua/plugins/persistence.lua:41-55, high).
- Picking a project saves the session, closes every listed buffer by force, changes directory, runs `on_open` and loads the project's session (from lua/plugins/snacks.lua:149-206 and lua/utils/session.lua:157-181, high).
- Pickers show hidden files, and the explorer replaces netrw and opens on the right (from lua/plugins/snacks.lua:107-130, high).
- Auto-save is off by default; when on, it saves after 1500 ms, and immediately on leaving a buffer or losing focus (from lua/plugins/auto-save.lua:10-47 and lua/meowvim/config/defaults.lua:35, high).
- hbac closes buffers beyond `performance.buffer_threshold` unless `performance.buffer_auto_close` is false (from lua/plugins/hbac.lua:10-28, high).
- Folds come from the language server, then treesitter, then indentation (from lua/plugins/nvim-ufo.lua:14-43, high).

## Failure paths

- A failed session save or load shows an ERROR naming the error (from lua/utils/session.lua:35-63, high).
- Picking a project discards unsaved changes in listed buffers, because it saves the session but not the buffers (from lua/plugins/snacks.lua:158-174 and lua/utils/session.lua:25, medium).
- The project picker runs `on_open` without a guard (from lua/plugins/snacks.lua:182-184, high).
- When silicon isn't executable, its setup is skipped (from lua/plugins/silicon.lua:17-19, high).
