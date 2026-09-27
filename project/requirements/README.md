# Requirements

<!-- meow-flow index -->

74 requirements in all: 74 approved.

| Identifier | What it requires | Status |
| --- | --- | --- |
| [REQ-0100](REQ-0100-neovim-0-12-or-later.md) | The configuration MUST run on Neovim 0.12 or later. | approved |
| [REQ-0110](REQ-0110-minimal-install-works.md) | The configuration MUST start and edit files when only Neovim, Git and a true-colour terminal are installed. | approved |
| [REQ-0120](REQ-0120-starts-without-user-config.md) | The configuration MUST start when no user config file exists. | approved |
| [REQ-0130](REQ-0130-true-colour-only-when-advertised.md) | The configuration MUST enable true colour only when the terminal advertises it through `COLORTERM`, `TERM` or `TERM_PROGRAM`. | approved |
| [REQ-0140](REQ-0140-full-redraw-on-resize.md) | The configuration MUST force a full redraw when the terminal is resized. | approved |
| [REQ-0150](REQ-0150-short-escape-timeout.md) | The configuration MUST set `ttimeoutlen` so that terminal escape sequences don't stall under a multiplexer. | approved |
| [REQ-0160](REQ-0160-no-provider-health-warnings.md) | The configuration MUST produce no `:checkhealth` warnings about the Python, Ruby, Perl or Node providers. | approved |
| [REQ-0170](REQ-0170-no-crash-on-exit-after-rebuild.md) | The configuration MUST let Neovim exit without crashing after a plugin sync rebuilds LuaSnip. | approved |
| [REQ-0180](REQ-0180-lock-inside-spec-range.md) | The configuration MUST keep every `lazy-lock.json` entry inside the version range its plugin spec asks for. | approved |
| [REQ-0190](REQ-0190-no-local-dir-overrides.md) | The configuration MUST NOT carry a hardcoded local `dir =` override in any plugin spec. | approved |
| [REQ-0195](REQ-0195-plugins-load-on-their-trigger.md) | A plugin MUST NOT load before the trigger its spec declares, unless another plugin that has loaded needs it. | approved |
| [REQ-0200](REQ-0200-check-tool-before-use.md) | The configuration MUST check that an external tool exists before it uses the tool. | approved |
| [REQ-0210](REQ-0210-missing-tool-costs-one-feature.md) | The configuration MUST limit the effect of a missing external tool to the feature that uses it. | approved |
| [REQ-0220](REQ-0220-no-startup-error-for-missing-tool.md) | The configuration MUST start without an error when a language server, formatter or linter is missing. | approved |
| [REQ-0230](REQ-0230-resolve-tools-at-run-time.md) | The configuration MUST resolve language servers, formatters and linters when they run, not when Neovim starts. | approved |
| [REQ-0240](REQ-0240-install-no-tools.md) | The configuration MUST NOT install any external tool from inside Neovim. | approved |
| [REQ-0250](REQ-0250-server-only-when-on-path.md) | The configuration MUST start a language server only when its binary is on `PATH`. | approved |
| [REQ-0260](REQ-0260-project-toolchain-without-change.md) | The configuration MUST use a project-local toolchain that changes `PATH` without any change to the configuration. | approved |
| [REQ-0300](REQ-0300-edits-apply-without-restart.md) | The configuration MUST apply a saved edit to the user config file without a restart, except for options read before the plugins load. | approved |
| [REQ-0310](REQ-0310-get-returns-stored-false.md) | `config.get(key, default)` MUST return the default only when the key is absent. | approved |
| [REQ-0320](REQ-0320-project-path-required.md) | The configuration MUST reject a `projects.lua` entry that has no `path`. | approved |
| [REQ-0330](REQ-0330-toggles-survive-restart.md) | The configuration MUST keep the state of each `<leader>o` toggle across a restart once the user persists it. | approved |
| [REQ-0340](REQ-0340-project-edits-without-restart.md) | The configuration MUST show an edit to the projects file in the project picker without a restart. | approved |
| [REQ-0350](REQ-0350-project-match-on-directory-boundary.md) | The configuration MUST match a project path only on a directory boundary, so that `/home/user/app` doesn't match `/home/user/app-v2`. | approved |
| [REQ-0360](REQ-0360-settings-apply-at-startup.md) | When Neovim starts, the configuration MUST apply every `editor.*` and `ui.*` value in the user config. | approved |
| [REQ-0370](REQ-0370-one-default-per-key.md) | Each settings key MUST have exactly one default. | approved |
| [REQ-0380](REQ-0380-template-writes-read-keys.md) | The settings template MUST write only keys the configuration reads. | approved |
| [REQ-0390](REQ-0390-persist-writes-user-values.md) | Persisting the settings MUST NOT write a value that only the current session set, such as a project's theme or a theme auto mode chose. | approved |
| [REQ-0395](REQ-0395-persist-keeps-comments.md) | Persisting the settings MUST keep the comments in the user config. | approved |
| [REQ-0400](REQ-0400-appearance-probe-never-blocks.md) | The configuration MUST NOT block typing while it probes the system appearance. | approved |
| [REQ-0410](REQ-0410-only-active-theme-loads.md) | The configuration MUST load only the active colorscheme at startup. | approved |
| [REQ-0420](REQ-0420-lazygit-config-untouched.md) | The configuration MUST NOT edit the user's lazygit config. | approved |
| [REQ-0430](REQ-0430-copilot-ghost-text-distinct.md) | The configuration MUST render Copilot ghost text so that it stands apart from normal code in every bundled theme. | approved |
| [REQ-0440](REQ-0440-day-night-mode-persists.md) | When the user changes the day/night mode, the new mode MUST still be in effect after a restart. | approved |
| [REQ-0500](REQ-0500-leader-is-entry-point.md) | The configuration MUST make the leader key the main entry point for its functions. | approved |
| [REQ-0510](REQ-0510-navigation-degrades.md) | The LSP navigation mappings MUST NOT open an empty window when no language server answers. | approved |
| [REQ-0520](REQ-0520-document-symbols-fallback.md) | `<leader>ns` MUST list treesitter symbols when no language server provides document symbols. | approved |
| [REQ-0530](REQ-0530-workspace-symbols-fallback.md) | `<leader>nS` MUST grep the project when no language server provides workspace symbols. | approved |
| [REQ-0540](REQ-0540-name-the-missing-request.md) | A navigation mapping without a fallback MUST name the LSP request that no server answered. | approved |
| [REQ-0550](REQ-0550-enter-never-accepts.md) | `<CR>` in the completion menu MUST insert a newline and never accept an item. | approved |
| [REQ-0560](REQ-0560-popup-keeps-copilot-accept.md) | The completion popup MUST NOT swallow the key that accepts a Copilot suggestion. | approved |
| [REQ-0570](REQ-0570-organize-imports-warns.md) | `:LspOrganize` MUST warn, not raise an error, when no TypeScript client is attached. | approved |
| [REQ-0580](REQ-0580-mappings-run-what-exists.md) | Every mapping MUST run a command or function that exists. | approved |
| [REQ-0600](REQ-0600-no-format-over-5000-lines.md) | The configuration MUST NOT format a buffer longer than 5000 lines on save. | approved |
| [REQ-0610](REQ-0610-large-format-after-write.md) | The configuration MUST format a buffer longer than 800 lines after the write, so that the write doesn't wait for the formatter. | approved |
| [REQ-0620](REQ-0620-one-formatter.md) | The configuration MUST format through conform.nvim alone, with the language servers' own formatting turned off. | approved |
| [REQ-0630](REQ-0630-prettier-follows-project.md) | The configuration MUST let prettier read a project's own `.prettierrc`. | approved |
| [REQ-0640](REQ-0640-copilot-off-by-default.md) | The configuration MUST keep Copilot off until the user turns it on. | approved |
| [REQ-0650](REQ-0650-go-no-false-lint.md) | The configuration MUST NOT show linter warnings on properly formatted Go code. | approved |
| [REQ-0660](REQ-0660-gdscript-lsp.md) | The configuration MUST connect GDScript buffers to Godot's built-in language server. | approved |
| [REQ-0670](REQ-0670-one-roslyn-client.md) | The configuration MUST NOT start two Roslyn language-server clients for one buffer. | approved |
| [REQ-0680](REQ-0680-lsp-roots-use-language-markers.md) | The configuration MUST detect a language server's root from that language's usual project markers, not from `.git` alone. | approved |
| [REQ-0690](REQ-0690-rust-didsave-workaround-scoped.md) | The configuration MUST suppress rust-analyzer's didSave only when the server reports version 1.96. | approved |
| [REQ-0700](REQ-0700-session-restore-conditions.md) | The configuration MUST restore a session only when Neovim starts with no file arguments and a session exists for the directory. | approved |
| [REQ-0710](REQ-0710-hidden-files-in-pickers.md) | The file and project pickers MUST list hidden dotfiles. | approved |
| [REQ-0720](REQ-0720-hidden-files-in-explorer.md) | The file explorer MUST show hidden dotfiles and directories. | approved |
| [REQ-0800](REQ-0800-docs-name-only-what-exists.md) | The documentation MUST name a `<leader>` mapping or a `:Command` only when the configuration defines it. | approved |
| [REQ-0810](REQ-0810-every-command-has-help-tag.md) | `doc/meowvim.txt` MUST carry a `*:Name*` tag for every user command the configuration defines. | approved |
| [REQ-0820](REQ-0820-docs-match-code.md) | The documentation MUST describe what the code does. | approved |
| [REQ-0830](REQ-0830-no-marketing-language.md) | The documentation MUST NOT use marketing language. | approved |
| [REQ-0840](REQ-0840-document-keymaps-outside-table.md) | The documentation MUST say where the mappings that aren't in `lua/config/keymaps.lua` are declared. | approved |
| [REQ-0850](REQ-0850-command-descriptions-accurate.md) | Every user command's description MUST describe what the command does. | approved |
| [REQ-0900](REQ-0900-stylua-formatted.md) | Every Lua file under `lua/` and `init.lua` MUST pass `stylua --check` with the settings in `.stylua.toml`. | approved |
| [REQ-0910](REQ-0910-luacheck-clean.md) | `luacheck lua/ init.lua` MUST report no warnings with the settings in `.luacheckrc`. | approved |
| [REQ-0920](REQ-0920-spdx-header.md) | Every Lua and shell file MUST open with the `SPDX-License-Identifier: MIT` line and the copyright line. | approved |
| [REQ-0930](REQ-0930-tests-pass-on-matrix.md) | `bin/test-config.sh` MUST pass on Ubuntu and macOS with both stable and nightly Neovim. | approved |
| [REQ-0940](REQ-0940-lint-runs-on-macos.md) | The lint check MUST run on macOS as well as on Linux. | approved |
| [REQ-0950](REQ-0950-user-config-untracked.md) | The repository MUST keep user configuration files out of version control. | approved |
| [REQ-0960](REQ-0960-no-redundant-comments.md) | The code MUST NOT carry comments that restate the code. | approved |
| [REQ-0970](REQ-0970-test-validates-loaded-config.md) | The test script MUST validate the user config file the configuration loads. | approved |
| [REQ-0980](REQ-0980-test-lists-validation-errors.md) | When the user config fails validation, the test script MUST list the validation errors. | approved |
| [REQ-1000](REQ-1000-startup-trends-with-any-history.md) | `:StartupTrends` MUST show the recorded startups whenever at least one is recorded. | approved |
| [REQ-1010](REQ-1010-health-passes-supported-versions.md) | The health check MUST pass the version check on every Neovim release at or above 0.12. | approved |
| [REQ-1020](REQ-1020-health-names-installed-plugins.md) | The health check MUST name only plugins the configuration installs. | approved |

By topic:

- diagnostics: REQ-1000, REQ-1010, REQ-1020
- docs: REQ-0800, REQ-0810, REQ-0820, REQ-0830, REQ-0840, REQ-0850
- editing: REQ-0600, REQ-0610, REQ-0620, REQ-0630, REQ-0640, REQ-0650, REQ-0660, REQ-0670, REQ-0680, REQ-0690
- keymaps: REQ-0500, REQ-0510, REQ-0520, REQ-0530, REQ-0540, REQ-0550, REQ-0560, REQ-0570, REQ-0580
- platform: REQ-0100, REQ-0110, REQ-0120, REQ-0130, REQ-0140, REQ-0150, REQ-0160, REQ-0170, REQ-0180, REQ-0190, REQ-0195
- repo: REQ-0900, REQ-0910, REQ-0920, REQ-0930, REQ-0940, REQ-0950, REQ-0960, REQ-0970, REQ-0980
- settings: REQ-0300, REQ-0310, REQ-0320, REQ-0330, REQ-0340, REQ-0350, REQ-0360, REQ-0370, REQ-0380, REQ-0390, REQ-0395
- themes: REQ-0400, REQ-0410, REQ-0420, REQ-0430, REQ-0440
- tools: REQ-0200, REQ-0210, REQ-0220, REQ-0230, REQ-0240, REQ-0250, REQ-0260
- workspace: REQ-0700, REQ-0710, REQ-0720
<!-- /meow-flow index -->
