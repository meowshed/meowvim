---
id: onboarding
artifact: onboarding
status: approved
revised: 2026-09-27
---

<!-- Written to the writing standard meow-prose ships: lead with what was found, give each figure its source, and state a gap as plainly as a finding. -->

# Onboarding meowvim

What this repository already is, read from its documentation, its harness, its code and its GitHub history, and what couldn't be determined. The record holds 1 vision, 9 specifications, 60 draft requirements and 50 draft decisions. Every requirement and decision is recovered from something a person wrote down: a document, an issue, a pull request or a review comment. None comes from code alone.

## Verbs

`meow-verbs status` resolves three of the five verbs:

| Verb | State | Command |
| ---- | ----- | ------- |
| format | resolved | `stylua --check lua/ init.lua` |
| lint | resolved | `luacheck lua/ init.lua` |
| check | unresolved | the repository has no type checker |
| test | resolved | `bash bin/test-config.sh` |
| build | unresolved | the repository has no build step |

## Conventions

Each of these is what the repository does most often, offered as a decision for you to take and not recorded as a rule.

- Commit subjects: 63 of 63 commits on `main` follow `type(scope): description` within 72 characters. That's after the history rewrite of 2026-09-27; before it, 52 of 54 followed the form and 43 of 54 fit 72 characters. `.meowpaw/profile.toml` already declares this convention. Keep it?
- Licence header: 73 of 73 Lua and shell files carry the SPDX line. 69 of 73 carry an `@file:` line and 68 of 73 an `@brief:` line; `bin/test-config.sh`, `bin/update-meowvim.sh`, `lua/utils/session.lua` and `lua/utils/toggles.lua` lack both, and `lua/plugins/conform.lua` lacks `@brief:`. Require `@file:` and `@brief:` as well?
- Plugin specs: 47 files in `lua/plugins/`, one spec each. Keep one spec per file?
- Mappings: most mappings sit in the which-key table in `lua/config/keymaps.lua`; 21 `vim.keymap.set` calls sit in 5 other files, and 3 plugin specs declare a `keys` table. Name where a plugin's own mappings may live?
- Version pins: 6 of 47 plugin specs pin a version range, 4 follow the latest commit with `version = false`, and 37 rely on `lazy-lock.json` alone. Pin a range for every plugin, or for none?
- Notification titles: 19 of 106 `vim.notify` calls pass the title "Meowvim". Give every notification the title?
- Guides: four numbered guides in `docs/` (`01-INSTALLATION.md` to `04-TROUBLESHOOTING.md`) and two upper-case references (`KEYMAPS.md`, `KEYMAPS_QUICK_REFERENCE.md`). Keep that naming?

## Documents

Every document outside the record, each with one outcome. Nothing is deleted before its row is approved.

| Document | Outcome | Where, or why |
| -------- | ------- | ------------- |
| `README.md` | cited | the vision and 8 requirements cite it; it stays the entry point for users |
| `TODO.md` | migrated | "Decided against" became `ADR-0100`, `ADR-0110` and `ADR-0120`; "Carrying a known cost" became `ADR-0090` and `REQ-0690`. Its line 14 cites `4850b89`, which isn't a commit here; the diffview removal is `e1da177`. Delete the file once those records are approved? |
| `CLAUDE.md` | cited | it is the constitution and is left as it is. Its line 50 cites `66e04ea`, which the history rewrite of 2026-09-27 renamed to `77ffb5f` |
| `.meowpaw/profile.toml` | cited | the harness's own declaration |
| `LICENSE` | cited | MIT; its holder is "meowvim" where every file header names Andrew Vasilyev |
| `docs/01-INSTALLATION.md` | cited | a user guide the requirements cite |
| `docs/02-CONFIGURATION.md` | cited | the settings reference the requirements and decisions cite |
| `docs/03-WORKFLOWS.md` | cited | a user guide the requirements cite |
| `docs/04-TROUBLESHOOTING.md` | cited | a user guide the requirements and decisions cite |
| `docs/KEYMAPS.md` | cited | the mapping reference |
| `docs/KEYMAPS_QUICK_REFERENCE.md` | cited | the one-page mapping card |
| `doc/meowvim.txt` | cited | the `:help` reference |
| `.github/workflows/ci.yml` | cited | its comments record two decisions, `ADR-0250` and `ADR-0260` |
| `mise.toml` | cited | its comment records `ADR-0240` |
| `bin/check-docs.lua` | cited | its header records `ADR-0210` and `ADR-0220` |
| `bin/update-meowvim.sh` | cited | its header records `ADR-0130` |
| `bin/test-config.sh` | cited | the test verb |
| `init.lua` | cited | its comments record `ADR-0010` and `ADR-0460` |
| `.gitignore` | cited | its comment states `REQ-0950` |
| `.luacheckrc`, `.luarc.json`, `.stylua.toml` | cited | tool settings the lint and format verbs read |
| `lazy-lock.json` | cited | plugin pins; no prose |
| `github-copilot/versions.json` | cited | pins copilot.lua 1.344.0; no document explains it |
| `.claude/settings.local.json` | discarded | not tracked (`.gitignore:88`), so it isn't the repository's |
| GitHub issues and pull requests | cited | 56 issues and pull requests, 26 comments and 230 review comments, read with `meow-github history` |

## Gaps

The questions below are what the sources don't settle.

Vision:

1. In what order do the quality goals rank when they conflict?
2. What do the second and third audiences in the vision use today, and why wasn't LazyVim, one of the named inspirations, enough?

Decisions that address nothing:

3. These 19 draft decisions record a choice and the alternative it rejected, but no source names the need behind them, so `paw check` reports that each addresses no requirement: `ADR-0070`, `ADR-0080`, `ADR-0110`, `ADR-0130`, `ADR-0270`, `ADR-0280`, `ADR-0290`, `ADR-0310`, `ADR-0320`, `ADR-0330`, `ADR-0340`, `ADR-0370`, `ADR-0380`, `ADR-0390`, `ADR-0410`, `ADR-0420`, `ADR-0470`, `ADR-0490` and `ADR-0500`. What requirement does each serve, or should any be dropped?

History not recovered:

4. The GitHub history records these choices, which later history reversed, so none is recovered as a decision. Should any be recorded as a superseded decision? Mason over manual executable checks (#32), later replaced by mise; the Neovim 0.11 floor (#42), now 0.12; `root_dir` over `root_markers` (#46), which the code now uses again; mason-lspconfig with auto-enable off (#48); mini.tabline (#32); ultimate-autopair (#32, #33), now mini.pairs; mini.comment (#32); installing copilot-language-server through mason-registry (#53); the `~/.meowvim.yaml` project file and its parser, command validation and cache (#36 to #41), now `projects.lua`; the crates completion source limited to `Cargo.toml` (#39), now crates' in-process LSP; the macchiato default flavour (#35), now mocha; the README scope decisions of #4.
5. These obligations were stated and later reversed, so none is recovered as a requirement: the GUI client obligations of issue #10; the full-MIT-text header standard of issue #23, now SPDX; the project-command validation obligations of #37, #38, #40 and #41; the Neovim 0.11 floor; stylua-only CI of #42, now stylua and luacheck. Confirm they're withdrawn?
6. Issue #1 lists 22 README obligations, such as an acknowledgments list, badges, screenshots and a feline tone. The owner removed some in review of #4 and #47, and the README was rewritten plainly on 2026-09-18. Which, if any, still stand?
7. The GitHub review bot suggested 21 obligations whose adoption no later pull request records, such as named augroups with `clear = true` (#49), `vim.uv` over `vim.loop` (#42), escaping paths in shell commands (#29) and making flash's `f`/`t` override opt-in (#42). Should any become requirements?
8. Code comments record 70 choices with the alternative they rejected, such as mini.pairs replacing ultimate-autopair (`lua/plugins/mini-pairs.lua:7-9`) and the dap keymaps moving out of the plugin spec (`lua/plugins/nvim-dap.lua:7-10`). Onboarding recovers no decision from code alone. Should any be recorded?
9. Did pull request #52's "no image preview under Zellij", #36's "code lens off", #34's pruned TypeScript inlay hints and #53's Run group on `<leader>R` survive? The code notes don't settle them.
10. Pull request #56 states that every lock entry stays inside its spec's range and records the LuaSnip lock decision, but it is still open, so `REQ-0180` rests on an unmerged pull request and no decision is recorded. Merge it?

Requirements that the code may not meet:

11. `REQ-0350` asks for project paths to match on a directory boundary, which #38 adopted for the old projects system; `projects.lua` matching is a string prefix, so `/a/foo` matches `/a/foobar` (`lua/meowvim/config/init.lua:388`). Does the requirement still hold?
12. `REQ-0640` follows the docs, which name `core.enable_copilot` as the switch, but copilot.lua reads only `toggles.copilot`, and only the health check reads `core.enable_copilot` (`lua/plugins/copilot.lua:46`). Which key is right?
13. `REQ-0830` asks for no marketing language, but the owner asked to keep some taglines in #7, and `README.md:129-130` says "Keep the cat puns tasteful". Which stands?
14. The user-environment statements in the docs, such as needing a Nerd Font, `gh auth login` or Git 2.30, bind the user rather than the configuration, so none is recovered as a requirement. Should they be?

Code that disagrees with the docs or with itself. Each is a defect candidate, which the method records as a defect before anyone fixes it:

15. `lua/config/options.lua` runs after the settings are applied and overwrites the user's `editor.*`, `ui.cmdheight` and `ui.pumheight` at startup (`init.lua:26, 34`).
16. `<leader>br` runs `:BufRename`, which nothing defines (`lua/config/keymaps.lua:490`).
17. `:StartupTrends` raises a Lua error with exactly one recorded startup (`lua/meowvim/startup_tracker.lua:88, 108`).
18. `git.show_deleted` defaults to false in `defaults.lua:83` and to true in `schema.lua:71`.
19. copilot.lua loads at startup through lualine, not on `InsertEnter` (`lua/plugins/lualine.lua:171-174`).
20. The health check reports Neovim 1.x as too old (`lua/meowvim/health.lua:23`) and names Telescope where the pickers are snacks (`lua/meowvim/health.lua:239, 248`).
21. Nine toggles, such as wrap and spell, are read from the settings but not applied until their key is pressed.
22. The settings template writes `performance.lazy_load_plugins`, which nothing reads (`lua/meowvim/config/init.lua:62`).
23. `:ColorschemeSelect` claims a live preview it doesn't give (`lua/meowvim/colorscheme_switcher.lua:187`).
24. `:DayNightMode` and `:DayNightToggle` don't persist, and persisting writes runtime-only values such as a project's theme into `config.lua`.
25. The test script ignores `XDG_CONFIG_HOME` for the user config (`bin/test-config.sh:96`).
26. The docs disagree with themselves: `docs/01-INSTALLATION.md:157` says "nine things" and lists ten; `docs/03-WORKFLOWS.md:3` says "Ten sequences" and has twelve; `README.md:18-19` says 56 options where `docs/02-CONFIGURATION.md` lists 60; `docs/KEYMAPS.md:14-16` and `docs/03-WORKFLOWS.md:24-26` describe `<leader>ff` differently; `doc/meowvim.txt:24-25` says the plugins install on demand where they load on demand; `README.md:126` omits three tools `mise install` fetches.
27. `.stylua.toml:10` sets `syntax = "Lua52"`, while `mise.toml`, `.luarc.json` and `.luacheckrc` target Lua 5.1 or LuaJIT. Deliberate?
28. The CI comment says the macOS runner gets the tree-sitter CLI from Homebrew; the run log shows Homebrew installing tree-sitter 0.27.0 during the Neovim install step, but no step asks for it. Should the step install it explicitly?

The harness:

29. `paw` indexes specifications, epics and defects in the same `project/README.md` but writes only one generated block there, so the epic and defect indexes always read as out of date while specifications exist. The research index lives in `project/research/RES-0001-synthesis.md`, a research record onboarding may not write. These three index findings stay open until `paw` changes or a research record exists.
30. The specifications state no requirement, because a living specification that states a draft requirement fails the coverage check. Once requirements are approved, which should each specification state?

## Adoption

Each step leaves the repository working:

1. Review this report and the drafts, and approve or reject each; nothing else in the repository changed. Once it is approved, the record stays, and `paw onboarding remove` isn't needed.
2. Correct the two commit hashes: `CLAUDE.md:50` to `77ffb5f` and `TODO.md:14` to `e1da177`. The docs then point at commits that exist.
3. Answer gaps 1 to 14, then withdraw, amend or approve the affected drafts; the record then states only what somebody decided.
4. Record gaps 15 to 28 as defects with `paw new bug`, reproduce each, and fix them through the method; each fix then has its own evidence.
5. Once the migrated decisions are approved, delete `TODO.md`; the record is then the only place those decisions live.
6. Add `states:` to each specification for the requirements approved in step 3; `paw check coverage` then relates the specifications to what they must do.
