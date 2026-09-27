# Requirements

<!-- meow-flow index -->

176 requirements in all: 116 approved, 21 rejected, 1 superseded, 38 withdrawn.

| Identifier | What it requires | Status |
| --- | --- | --- |
| [REQ-0100](REQ-0100-neovim-0-12-or-later.md) | The configuration MUST run on Neovim 0.12 or later. | approved |
| [REQ-0101](REQ-0101-neovim-0-11-or-later.md) | The configuration MUST run on Neovim 0.11 or later. | withdrawn |
| [REQ-0105](REQ-0105-works-without-gui.md) | The configuration MUST work fully in a terminal, with no GUI client. | approved |
| [REQ-0106](REQ-0106-no-images-in-zellij.md) | The configuration MUST turn image previews off inside Zellij. | withdrawn |
| [REQ-0107](REQ-0107-fixed-window-title.md) | The window title MUST read "MeowVim - Purr-fect Neovim". | withdrawn |
| [REQ-0108](REQ-0108-install-inits-submodules.md) | The installation instructions MUST initialise and update git submodules. | withdrawn |
| [REQ-0109](REQ-0109-recommend-fzf.md) | The docs MUST list fzf as a recommended dependency. | withdrawn |
| [REQ-0110](REQ-0110-minimal-install-works.md) | The configuration MUST start and edit files when only Neovim, Git and a true-colour terminal are installed. | approved |
| [REQ-0111](REQ-0111-detect-gui.md) | The configuration MUST detect when it runs inside a GUI client. | withdrawn |
| [REQ-0112](REQ-0112-gui-font.md) | The configuration MUST configure the GUI client's font and rendering. | withdrawn |
| [REQ-0113](REQ-0113-gui-transparency.md) | The configuration MUST offer window transparency settings in the GUI client. | withdrawn |
| [REQ-0114](REQ-0114-gui-zoom-keys.md) | The configuration MUST offer keys that increase, decrease and reset zoom in the GUI client. | withdrawn |
| [REQ-0115](REQ-0115-gui-fullscreen-key.md) | The configuration MUST offer a key that toggles fullscreen in the GUI client. | withdrawn |
| [REQ-0116](REQ-0116-gui-tested-per-platform.md) | The configuration's GUI support MUST be tested on each platform. | withdrawn |
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
| [REQ-0205](REQ-0205-install-copilot-server.md) | The configuration MUST install `copilot-language-server` itself. | withdrawn |
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
| [REQ-0355](REQ-0355-project-theme.md) | When Neovim works in a configured project's directory, the configuration MUST apply that project's theme. | approved |
| [REQ-0356](REQ-0356-reject-chained-project-commands.md) | The configuration MUST reject a project command that chains further commands with `\|`, `!`, `&` or a backtick. | withdrawn |
| [REQ-0357](REQ-0357-no-lua-in-project-commands.md) | The configuration MUST NOT let the project config file run arbitrary Lua. | withdrawn |
| [REQ-0358](REQ-0358-bounded-path-cache.md) | The configuration MUST bound the size of its project path cache. | withdrawn |
| [REQ-0359](REQ-0359-reject-newlines-in-project-commands.md) | The configuration MUST reject a project command that contains a newline or a carriage return. | withdrawn |
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
| [REQ-0445](REQ-0445-editor-and-terminal-switch-together.md) | When the system appearance changes under meowctl, the editor and the terminal MUST switch to the matching theme together. | approved |
| [REQ-0446](REQ-0446-default-macchiato.md) | The default theme MUST be Catppuccin Macchiato. | withdrawn |
| [REQ-0500](REQ-0500-leader-is-entry-point.md) | The configuration MUST make the leader key the main entry point for its functions. | approved |
| [REQ-0510](REQ-0510-navigation-degrades.md) | The LSP navigation mappings MUST NOT open an empty window when no language server answers. | approved |
| [REQ-0520](REQ-0520-document-symbols-fallback.md) | `<leader>ns` MUST list treesitter symbols when no language server provides document symbols. | approved |
| [REQ-0530](REQ-0530-workspace-symbols-fallback.md) | `<leader>nS` MUST grep the project when no language server provides workspace symbols. | approved |
| [REQ-0540](REQ-0540-name-the-missing-request.md) | A navigation mapping without a fallback MUST name the LSP request that no server answered. | approved |
| [REQ-0550](REQ-0550-enter-never-accepts.md) | `<CR>` in the completion menu MUST insert a newline and never accept an item. | approved |
| [REQ-0560](REQ-0560-popup-keeps-copilot-accept.md) | The completion popup MUST NOT swallow the key that accepts a Copilot suggestion. | approved |
| [REQ-0570](REQ-0570-organize-imports-warns.md) | `:LspOrganize` MUST warn, not raise an error, when no TypeScript client is attached. | approved |
| [REQ-0580](REQ-0580-mappings-run-what-exists.md) | Every mapping MUST run a command or function that exists. | approved |
| [REQ-0590](REQ-0590-escape-in-cyrillic-layout.md) | Leaving insert mode MUST work while a Cyrillic keyboard layout is active. | approved |
| [REQ-0591](REQ-0591-jump-by-label.md) | The configuration MUST let the user jump to any visible match by typing its label. | approved |
| [REQ-0592](REQ-0592-one-key-terminal.md) | One key MUST toggle a terminal from both normal mode and terminal mode. | approved |
| [REQ-0593](REQ-0593-completion-without-arrows.md) | The completion menu MUST be navigable without the arrow keys. | approved |
| [REQ-0600](REQ-0600-no-format-over-5000-lines.md) | The configuration MUST NOT format a buffer longer than 5000 lines on save. | approved |
| [REQ-0605](REQ-0605-auto-pair-brackets.md) | When the user types an opening bracket or quote, the configuration MUST insert its closing one. | approved |
| [REQ-0606](REQ-0606-tab-out-of-brackets.md) | The configuration MUST let the user tab out of a closing bracket. | withdrawn |
| [REQ-0607](REQ-0607-toggle-comments.md) | The configuration MUST toggle comments on a line or a selection. | approved |
| [REQ-0610](REQ-0610-large-format-after-write.md) | The configuration MUST format a buffer longer than 800 lines after the write, so that the write doesn't wait for the formatter. | approved |
| [REQ-0615](REQ-0615-parsers-installed-unasked.md) | The tree-sitter parsers for the configured languages MUST be installed without the user asking. | approved |
| [REQ-0620](REQ-0620-one-formatter.md) | The configuration MUST format through conform.nvim alone, with the language servers' own formatting turned off. | approved |
| [REQ-0630](REQ-0630-prettier-follows-project.md) | The configuration MUST let prettier read a project's own `.prettierrc`. | approved |
| [REQ-0640](REQ-0640-copilot-off-by-default.md) | The configuration MUST keep Copilot off until the user turns it on. | superseded |
| [REQ-0645](REQ-0645-copilot-off-until-toggle.md) | The configuration MUST keep Copilot off until `toggles.copilot` is true. | approved |
| [REQ-0650](REQ-0650-go-no-false-lint.md) | The configuration MUST NOT show linter warnings on properly formatted Go code. | approved |
| [REQ-0660](REQ-0660-gdscript-lsp.md) | The configuration MUST connect GDScript buffers to Godot's built-in language server. | approved |
| [REQ-0670](REQ-0670-one-roslyn-client.md) | The configuration MUST NOT start two Roslyn language-server clients for one buffer. | approved |
| [REQ-0680](REQ-0680-lsp-roots-use-language-markers.md) | The configuration MUST detect a language server's root from that language's usual project markers, not from `.git` alone. | approved |
| [REQ-0690](REQ-0690-rust-didsave-workaround-scoped.md) | The configuration MUST suppress rust-analyzer's didSave only when the server reports version 1.96. | approved |
| [REQ-0694](REQ-0694-typescript-hints-not-redundant.md) | TypeScript inlay hints MUST NOT show a variable's type, or an argument's parameter name, where the code already shows it. | approved |
| [REQ-0696](REQ-0696-rename-and-code-actions.md) | The configuration MUST offer rename and code actions in every buffer whose language server provides them. | approved |
| [REQ-0697](REQ-0697-clippy-on-save.md) | When the user saves a Rust file, the configuration MUST show clippy's diagnostics. | approved |
| [REQ-0698](REQ-0698-crate-completion-in-cargo-toml.md) | Crate completions MUST appear only in `Cargo.toml`. | approved |
| [REQ-0699](REQ-0699-code-lens-on-demand.md) | The configuration MUST show code lenses only when the user asks for them. | approved |
| [REQ-0700](REQ-0700-session-restore-conditions.md) | The configuration MUST restore a session only when Neovim starts with no file arguments and a session exists for the directory. | approved |
| [REQ-0710](REQ-0710-hidden-files-in-pickers.md) | The file and project pickers MUST list hidden dotfiles. | approved |
| [REQ-0720](REQ-0720-hidden-files-in-explorer.md) | The file explorer MUST show hidden dotfiles and directories. | approved |
| [REQ-0740](REQ-0740-indent-scope-visible.md) | The configuration MUST show the indentation scope around the cursor. | approved |
| [REQ-0750](REQ-0750-scratch-notes-per-directory.md) | The configuration MUST keep scratch notes for each working directory. | approved |
| [REQ-0760](REQ-0760-review-annotations.md) | The configuration MUST let the user annotate lines for review and export the annotations. | approved |
| [REQ-0765](REQ-0765-buffer-tab-line.md) | The configuration MUST show the open buffers in a tab line. | withdrawn |
| [REQ-0800](REQ-0800-docs-name-only-what-exists.md) | The documentation MUST name a `<leader>` mapping or a `:Command` only when the configuration defines it. | approved |
| [REQ-0810](REQ-0810-every-command-has-help-tag.md) | `doc/meowvim.txt` MUST carry a `*:Name*` tag for every user command the configuration defines. | approved |
| [REQ-0820](REQ-0820-docs-match-code.md) | The documentation MUST describe what the code does. | approved |
| [REQ-0830](REQ-0830-no-marketing-language.md) | The documentation MUST NOT use marketing language. | approved |
| [REQ-0840](REQ-0840-document-keymaps-outside-table.md) | The documentation MUST say where the mappings that aren't in `lua/config/keymaps.lua` are declared. | approved |
| [REQ-0850](REQ-0850-command-descriptions-accurate.md) | Every user command's description MUST describe what the command does. | approved |
| [REQ-0860](REQ-0860-name-in-lower-case.md) | The documentation MUST write the project's name as "meowvim". | approved |
| [REQ-0870](REQ-0870-readme-copy-paste-commands.md) | The README MUST give installation commands a reader can paste as they stand. | approved |
| [REQ-0875](REQ-0875-readme-keeps-taglines.md) | The README MUST keep the original taglines. | withdrawn |
| [REQ-0876](REQ-0876-raycast-headers-kept.md) | Shell scripts MUST keep their Raycast metadata after the standard header. | withdrawn |
| [REQ-0877](REQ-0877-meowg1k-spelling.md) | The AI tool's name MUST be spelled "meowg1k". | withdrawn |
| [REQ-0878](REQ-0878-recommend-jetbrains-mono.md) | The docs MUST name JetBrains Mono Nerd Font as the recommended font. | approved |
| [REQ-0880](REQ-0880-readme-opens-with-what-it-is.md) | The README MUST open with the project's name and what it is. | approved |
| [REQ-0881](REQ-0881-readme-lists-features.md) | The README MUST list the configuration's features. | approved |
| [REQ-0882](REQ-0882-readme-states-prerequisites.md) | The README MUST state the prerequisites, including the minimum Neovim version. | approved |
| [REQ-0883](REQ-0883-readme-quick-start.md) | The README MUST tell a new user how to get started after installing. | approved |
| [REQ-0884](REQ-0884-readme-explains-configuration.md) | The README MUST explain how to customise the configuration. | approved |
| [REQ-0885](REQ-0885-readme-contributing.md) | The README MUST tell a contributor how to contribute. | approved |
| [REQ-0886](REQ-0886-readme-licence.md) | The README MUST state the licence. | approved |
| [REQ-0887](REQ-0887-readme-for-newcomers.md) | The README MUST be written for a reader who has never used meowvim. | approved |
| [REQ-0888](REQ-0888-readme-code-blocks-tagged.md) | Every code block in the README MUST name its language. | approved |
| [REQ-0889](REQ-0889-readme-badges.md) | The README MUST show badges for the licence and for the build status. | approved |
| [REQ-0890](REQ-0890-readme-links-resolve.md) | Every link in the README MUST resolve. | approved |
| [REQ-0891](REQ-0891-readme-30-seconds.md) | A new reader MUST be able to tell what meowvim is within 30 seconds of opening the README. | approved |
| [REQ-0892](REQ-0892-install-tested-fresh.md) | The installation instructions MUST work on a fresh system. | approved |
| [REQ-0893](REQ-0893-readme-credits-plugins.md) | The README MUST credit the plugins the configuration uses. | approved |
| [REQ-0894](REQ-0894-readme-table-of-contents.md) | The README MUST have a table of contents. | withdrawn |
| [REQ-0895](REQ-0895-readme-usage-examples.md) | The README MUST have a usage-examples section. | withdrawn |
| [REQ-0896](REQ-0896-readme-troubleshooting-section.md) | The README MUST have a troubleshooting section. | withdrawn |
| [REQ-0897](REQ-0897-readme-visuals.md) | The README MUST include screenshots, GIFs or recordings. | withdrawn |
| [REQ-0898](REQ-0898-install-works-on-windows.md) | The installation MUST work on Windows. | withdrawn |
| [REQ-0899](REQ-0899-readme-feline-tone.md) | The README MUST keep a playful feline tone. | withdrawn |
| [REQ-0900](REQ-0900-stylua-formatted.md) | Every Lua file under `lua/` and `init.lua` MUST pass `stylua --check` with the settings in `.stylua.toml`. | approved |
| [REQ-0910](REQ-0910-luacheck-clean.md) | `luacheck lua/ init.lua` MUST report no warnings with the settings in `.luacheckrc`. | approved |
| [REQ-0920](REQ-0920-spdx-header.md) | Every Lua and shell file MUST open with the `SPDX-License-Identifier: MIT` line and the copyright line. | approved |
| [REQ-0921](REQ-0921-header-full-mit.md) | Every relevant text file MUST begin with a header holding the full MIT licence notice. | withdrawn |
| [REQ-0922](REQ-0922-header-file-field.md) | Each header's `@file` field MUST be the file's POSIX path from the repository root. | withdrawn |
| [REQ-0923](REQ-0923-header-brief-field.md) | Each header MUST carry a one-sentence `@brief` describing the file's role. | withdrawn |
| [REQ-0924](REQ-0924-header-after-shebang.md) | A file that starts with a shebang MUST carry its header after line 1. | withdrawn |
| [REQ-0925](REQ-0925-header-replaces-old.md) | Adding a header MUST replace an existing one, not add a second. | withdrawn |
| [REQ-0926](REQ-0926-header-blank-comment-after.md) | A header MUST end with exactly one empty comment line. | withdrawn |
| [REQ-0927](REQ-0927-no-header-in-data-files.md) | JSON, CSV, TSV, lock, generated and vendored files and `LICENSE` MUST NOT carry a header. | withdrawn |
| [REQ-0928](REQ-0928-header-keeps-file-properties.md) | Adding a header MUST keep the file's encoding, byte-order mark, line endings and permissions. | withdrawn |
| [REQ-0929](REQ-0929-briefs-written-by-hand.md) | Each header's `@brief` MUST be written by hand. | withdrawn |
| [REQ-0930](REQ-0930-tests-pass-on-matrix.md) | `bin/test-config.sh` MUST pass on Ubuntu and macOS with both stable and nightly Neovim. | approved |
| [REQ-0940](REQ-0940-lint-runs-on-macos.md) | The lint check MUST run on macOS as well as on Linux. | approved |
| [REQ-0950](REQ-0950-user-config-untracked.md) | The repository MUST keep user configuration files out of version control. | approved |
| [REQ-0960](REQ-0960-no-redundant-comments.md) | The code MUST NOT carry comments that restate the code. | approved |
| [REQ-0970](REQ-0970-test-validates-loaded-config.md) | The test script MUST validate the user config file the configuration loads. | approved |
| [REQ-0980](REQ-0980-test-lists-validation-errors.md) | When the user config fails validation, the test script MUST list the validation errors. | approved |
| [REQ-0985](REQ-0985-updates-reversible.md) | An update MUST be reversible to the plugin versions it replaced. | approved |
| [REQ-0986](REQ-0986-no-binary-images.md) | The repository MUST NOT carry binary image files. | approved |
| [REQ-0987](REQ-0987-one-spec-per-plugin.md) | Each plugin MUST be configured in exactly one spec file. | approved |
| [REQ-0988](REQ-0988-formatter-parses-luajit.md) | The formatter MUST parse the Lua dialect Neovim runs, LuaJIT. | approved |
| [REQ-0990](REQ-0990-harness-files-tracked.md) | The repository MUST keep `CLAUDE.md` and `.meowpaw/profile.toml` in version control. | approved |
| [REQ-0995](REQ-0995-no-agent-configuration.md) | The repository MUST NOT carry configuration for an AI agent. | withdrawn |
| [REQ-1000](REQ-1000-startup-trends-with-any-history.md) | `:StartupTrends` MUST show the recorded startups whenever at least one is recorded. | approved |
| [REQ-1010](REQ-1010-health-passes-supported-versions.md) | The health check MUST pass the version check on every Neovim release at or above 0.12. | approved |
| [REQ-1020](REQ-1020-health-names-installed-plugins.md) | The health check MUST name only plugins the configuration installs. | approved |
| [REQ-1100](REQ-1100-fullscreen-diff.md) | The configuration MUST show the working tree's Git changes hunk by hunk in a fullscreen view. | approved |
| [REQ-1110](REQ-1110-git-without-leaving.md) | The configuration MUST let the user stage, commit, pull and push without leaving Neovim. | approved |
| [REQ-1200](REQ-1200-autopair-off-in-ui-buffers.md) | The configuration MUST NOT auto-pair brackets in terminal, input or picker buffers. | rejected |
| [REQ-1202](REQ-1202-extend-allowlist-without-core-edits.md) | The configuration MUST let users extend the project command allowlist without editing core files. | rejected |
| [REQ-1204](REQ-1204-valid-catppuccin-flavour.md) | The configuration MUST NOT pass an invalid Catppuccin flavour to the theme at startup. | rejected |
| [REQ-1206](REQ-1206-treesitter-highlight-enabled.md) | The configuration MUST turn treesitter highlighting on. | rejected |
| [REQ-1208](REQ-1208-health-minimum-matches-docs.md) | The health check's minimum Neovim version MUST match the documented minimum. | rejected |
| [REQ-1210](REQ-1210-use-vim-uv.md) | The code MUST use `vim.uv` rather than the deprecated `vim.loop`. | rejected |
| [REQ-1212](REQ-1212-flash-f-override-opt-in.md) | flash.nvim's override of `f`, `F`, `t` and `T` MUST be opt-in or documented prominently. | rejected |
| [REQ-1214](REQ-1214-theme-switch-keeps-transparency.md) | Switching themes at runtime MUST keep `ui.transparency`. | rejected |
| [REQ-1216](REQ-1216-schema-accepts-only-handled-values.md) | The settings schema MUST NOT accept a value the configuration can't handle. | rejected |
| [REQ-1218](REQ-1218-persist-writes-valid-lua.md) | Persisting the settings MUST write valid Lua. | rejected |
| [REQ-1220](REQ-1220-one-copilot-key.md) | Copilot MUST be turned on by exactly one settings key. | rejected |
| [REQ-1222](REQ-1222-copilot-toggle-respected-at-startup.md) | The persisted Copilot toggle MUST take effect at startup. | rejected |
| [REQ-1224](REQ-1224-augroups-cleared.md) | Every autocmd MUST belong to a named group created with `clear = true`. | rejected |
| [REQ-1226](REQ-1226-survive-cmp-internals-change.md) | The configuration MUST keep working when nvim-cmp's private internals change. | rejected |
| [REQ-1228](REQ-1228-every-plugin-locked.md) | Every configured plugin MUST be pinned in `lazy-lock.json`. | rejected |
| [REQ-1230](REQ-1230-keymap-changes-reach-docs.md) | A pull request that changes mappings MUST update the docs that name them. | rejected |
| [REQ-1232](REQ-1232-escape-shell-paths.md) | The configuration MUST NOT build a shell command by concatenating an unescaped path. | rejected |
| [REQ-1234](REQ-1234-no-user-paths-in-runtimepath.md) | The configuration MUST NOT add a user-specific absolute path to `runtimepath`. | rejected |
| [REQ-1236](REQ-1236-no-hardcoded-config-path-in-scripts.md) | Scripts MUST NOT hardcode `~/.config/nvim`. | rejected |
| [REQ-1238](REQ-1238-no-backup-files-committed.md) | The repository MUST NOT carry backup files such as `lualine.lua.backup`. | rejected |
| [REQ-1240](REQ-1240-copilot-env-exactly-true.md) | Copilot MUST turn on only when `MEOW_ENABLE_COPILOT` is exactly `"true"`. | rejected |

By topic:

- diagnostics: REQ-1000, REQ-1010, REQ-1020
- docs: REQ-0108, REQ-0109, REQ-0800, REQ-0810, REQ-0820, REQ-0830, REQ-0840, REQ-0850, REQ-0860, REQ-0870, REQ-0875, REQ-0877, REQ-0878, REQ-0880, REQ-0881, REQ-0882, REQ-0883, REQ-0884, REQ-0885, REQ-0886, REQ-0887, REQ-0888, REQ-0889, REQ-0890, REQ-0891, REQ-0892, REQ-0893, REQ-0894, REQ-0895, REQ-0896, REQ-0897, REQ-0898, REQ-0899
- editing: REQ-0600, REQ-0605, REQ-0606, REQ-0607, REQ-0610, REQ-0615, REQ-0620, REQ-0630, REQ-0640, REQ-0645, REQ-0650, REQ-0660, REQ-0670, REQ-0680, REQ-0690, REQ-0694, REQ-0696, REQ-0697, REQ-0698, REQ-0699
- git: REQ-1100, REQ-1110
- keymaps: REQ-0500, REQ-0510, REQ-0520, REQ-0530, REQ-0540, REQ-0550, REQ-0560, REQ-0570, REQ-0580, REQ-0590, REQ-0591, REQ-0592, REQ-0593
- platform: REQ-0100, REQ-0101, REQ-0105, REQ-0106, REQ-0107, REQ-0110, REQ-0111, REQ-0112, REQ-0113, REQ-0114, REQ-0115, REQ-0116, REQ-0120, REQ-0130, REQ-0140, REQ-0150, REQ-0160, REQ-0170, REQ-0180, REQ-0190, REQ-0195
- repo: REQ-0876, REQ-0900, REQ-0910, REQ-0920, REQ-0921, REQ-0922, REQ-0923, REQ-0924, REQ-0925, REQ-0926, REQ-0927, REQ-0928, REQ-0929, REQ-0930, REQ-0940, REQ-0950, REQ-0960, REQ-0970, REQ-0980, REQ-0985, REQ-0986, REQ-0987, REQ-0988, REQ-0990, REQ-0995
- review: REQ-1200, REQ-1202, REQ-1204, REQ-1206, REQ-1208, REQ-1210, REQ-1212, REQ-1214, REQ-1216, REQ-1218, REQ-1220, REQ-1222, REQ-1224, REQ-1226, REQ-1228, REQ-1230, REQ-1232, REQ-1234, REQ-1236, REQ-1238, REQ-1240
- settings: REQ-0300, REQ-0310, REQ-0320, REQ-0330, REQ-0340, REQ-0350, REQ-0355, REQ-0356, REQ-0357, REQ-0358, REQ-0359, REQ-0360, REQ-0370, REQ-0380, REQ-0390, REQ-0395
- themes: REQ-0400, REQ-0410, REQ-0420, REQ-0430, REQ-0440, REQ-0445, REQ-0446
- tools: REQ-0200, REQ-0205, REQ-0210, REQ-0220, REQ-0230, REQ-0240, REQ-0250, REQ-0260
- workspace: REQ-0700, REQ-0710, REQ-0720, REQ-0740, REQ-0750, REQ-0760, REQ-0765
<!-- /meow-flow index -->
