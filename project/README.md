# The record

The specifications of meowvim, one per part of the system.

<!-- meow-flow index -->

9 specifications in all: 9 live.

| Identifier | What it concluded | Status |
| --- | --- | --- |
| [SPC-0010](specs/SPC-0010-startup-and-plugin-loading.md) | Startup and plugin loading | live |
| [SPC-0020](specs/SPC-0020-user-settings-projects-and-toggles.md) | User settings, projects and toggles | live |
| [SPC-0030](specs/SPC-0030-themes-and-day-night.md) | Themes and day/night switching | live |
| [SPC-0040](specs/SPC-0040-keymaps-and-which-key.md) | Keymaps, which-key and the conflict checker | live |
| [SPC-0050](specs/SPC-0050-language-tooling.md) | Language tooling | live |
| [SPC-0060](specs/SPC-0060-workspace-and-editing-ui.md) | Workspace and editing UI | live |
| [SPC-0070](specs/SPC-0070-git-integrations.md) | Git integrations | live |
| [SPC-0080](specs/SPC-0080-diagnostics-tools.md) | Diagnostics tools | live |
| [SPC-0090](specs/SPC-0090-maintenance-scripts-and-ci.md) | Maintenance scripts and CI | live |
<!-- /meow-flow index -->

## Defects

`paw index` writes one generated block per file, and this file indexes specifications, epics and defects, so the defects are listed by hand until it writes more than one.

| Identifier | What is wrong | Severity | Status |
| --- | --- | --- | --- |
| [BUG-0010](bugs/BUG-0010-user-editor-settings-overwritten-at-startup.md) | User editor and UI settings are overwritten at startup | major | approved |
| [BUG-0020](bugs/BUG-0020-leader-br-runs-a-missing-command.md) | `<leader>br` runs a command that doesn't exist | minor | approved |
| [BUG-0030](bugs/BUG-0030-startuptrends-fails-with-one-sample.md) | `:StartupTrends` raises a Lua error when one startup is recorded | minor | approved |
| [BUG-0040](bugs/BUG-0040-show-deleted-has-two-defaults.md) | `git.show_deleted` has two different defaults | minor | approved |
| [BUG-0050](bugs/BUG-0050-copilot-loads-at-startup.md) | copilot.lua loads at startup, not on InsertEnter | minor | approved |
| [BUG-0060](bugs/BUG-0060-health-rejects-neovim-1.md) | The health check would report Neovim 1.x as too old | minor | approved |
| [BUG-0070](bugs/BUG-0070-health-names-telescope.md) | The health check names Telescope, which isn't installed | minor | approved |
| [BUG-0080](bugs/BUG-0080-persisted-toggles-not-applied-at-startup.md) | Persisted toggles for wrap, spell, cursorline and list aren't applied at startup | major | approved |
| [BUG-0090](bugs/BUG-0090-template-writes-an-unread-key.md) | The settings template writes a key nothing reads | minor | approved |
| [BUG-0100](bugs/BUG-0100-colorschemeselect-claims-live-preview.md) | `:ColorschemeSelect` describes a live preview it doesn't give | minor | approved |
| [BUG-0110](bugs/BUG-0110-day-night-mode-not-persisted.md) | Day/night mode changes are lost on restart | minor | approved |
| [BUG-0120](bugs/BUG-0120-persist-writes-runtime-values.md) | Persisting settings writes runtime values and drops the user's comments | major | approved |
| [BUG-0130](bugs/BUG-0130-test-script-ignores-xdg-config-home.md) | The test script skips validation when the user config is under `XDG_CONFIG_HOME` | minor | approved |
| [BUG-0140](bugs/BUG-0140-test-script-prints-table-address.md) | The test script prints a table address in place of validation errors | minor | approved |
| [BUG-0150](bugs/BUG-0150-project-matches-sibling-directory.md) | A project matches a sibling directory whose name starts with its own | minor | approved |
| [BUG-0160](bugs/BUG-0160-installation-guide-miscounts-checks.md) | The installation guide says the test script checks nine things and lists ten | minor | approved |
| [BUG-0170](bugs/BUG-0170-workflows-guide-miscounts-sequences.md) | The workflows guide says ten sequences and has twelve | minor | approved |
| [BUG-0180](bugs/BUG-0180-readme-option-count.md) | The README's option count matches neither the schema nor the guide | minor | approved |
| [BUG-0190](bugs/BUG-0190-keymaps-guide-misdescribes-leader-ff.md) | The keymaps guide misdescribes `<leader>ff` | minor | approved |
| [BUG-0200](bugs/BUG-0200-help-says-plugins-install-on-demand.md) | The help file says plugins install on demand, where they load on demand | minor | approved |
| [BUG-0210](bugs/BUG-0210-readme-omits-mise-tools.md) | The README omits three tools `mise install` fetches | minor | approved |
| [BUG-0220](bugs/BUG-0220-docs-name-core-enable-copilot.md) | The docs name `core.enable_copilot` as Copilot's switch | minor | approved |
| [BUG-0230](bugs/BUG-0230-health-reports-copilot-from-wrong-key.md) | The health check reports Copilot's state from `core.enable_copilot` | minor | approved |
| [BUG-0240](bugs/BUG-0240-stylua-parses-lua52.md) | stylua is set to parse Lua 5.2, not LuaJIT | minor | approved |
| [BUG-0250](bugs/BUG-0250-readme-has-no-build-badge.md) | The README has no build-status badge | minor | approved |
| [BUG-0260](bugs/BUG-0260-readme-credits-no-plugins.md) | The README credits none of the plugins it uses | minor | approved |

## Onboarding gaps, settled

`onboarding.md` is approved and frozen, so the answers to its gaps live where each belongs. The owner answered gaps 3, 4, 5, 7 and 12 on 2026-09-27, and asked Claude to answer the rest the same day; each of Claude's choices says so in the record that holds it.

| Gap | Answer | Where |
| --- | --- | --- |
| 1 | The quality goals are ranked | `vision.md`, Quality goals |
| 2 | The meowctl audience merges into the owner's row; why not LazyVim isn't recorded | `vision.md`, Who it is for |
| 3 | Each of the 18 decisions addresses the need it serves | the `addresses` of each |
| 4, 5 | Reversed choices and obligations are recorded as superseded or withdrawn | `adrs/`, `requirements/` |
| 6 | Issue #1's README obligations are recorded, 14 in force and 6 withdrawn | `REQ-0880` to `REQ-0899`, `BUG-0250`, `BUG-0260` |
| 7 | The 21 bot suggestions are recorded as rejected | `REQ-1200` to `REQ-1240` |
| 8 | Decisions stated only in code comments stay in the code, because onboarding records only what a person wrote down | this table |
| 9 | Code lens and pruned TypeScript hints hold; the Zellij image switch and `<leader>R` are gone | `ADR-0880` to `ADR-0910` |
| 10 | #56 should land; `REQ-0180` rests on it | pull request #56 |
| 11 | `REQ-0350` holds, and the code breaks it | `BUG-0150` |
| 12 | `toggles.copilot` is the switch | `REQ-0645`, `BUG-0220`, `BUG-0230` |
| 13 | The taglines go; the README's note on puns is about the code and stays | `REQ-0875` |
| 14 | Needs that bind the user, such as a Nerd Font, stay in the docs and aren't requirements | this table |
| 15 to 26 | Filed as defects | `bugs/` |
| 27 | stylua parses Lua 5.2 where Neovim runs LuaJIT | `REQ-0988`, `BUG-0240` |
| 28 | Not a defect: Homebrew's neovim formula depends on tree-sitter, so the CI comment holds | this table |
| 29 | Open until `paw` writes more than one index block per file | this file |
| 30 | Every requirement in force is stated by one specification | `specs/` |
