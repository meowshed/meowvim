---
id: SPC-0050
artifact: spec
status: live
revised: 2026-09-27
checked-at:
states: [REQ-0200, REQ-0210, REQ-0220, REQ-0230, REQ-0240, REQ-0250, REQ-0260, REQ-0570, REQ-0600, REQ-0610, REQ-0620, REQ-0630, REQ-0645, REQ-0650, REQ-0660, REQ-0670, REQ-0680, REQ-0690, REQ-0605, REQ-0607, REQ-0696, REQ-0697, REQ-0698]
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# Language tooling

## Scope

This covers language servers, completion, Copilot, treesitter, formatting, linting, debugging, tests and tasks. Where the tools come from is in the startup specification, and their mappings in the keymaps specification.

## Boundary

- 17 language servers are declared, from lua_ls to postgres_lsp and gdscript (from lua/plugins/nvim-lspconfig.lua:82-213, 265-270, high).
- Commands: `:LspOrganize`, `:FormatDisable[!]`, `:FormatEnable`, `:FormatToggle[!]`, `:LintInfo` and `:LintToggle` (from lua/plugins/nvim-lspconfig.lua:62-80, lua/plugins/conform.lua:130-173 and lua/plugins/nvim-lint.lua:113-132, high).
- `lsp.diagnostics` sets virtual text, signs, underline and update-in-insert (from lua/plugins/nvim-lspconfig.lua:26-47, high).
- `formatting.formatters`, `formatting.timeout_ms`, `linting.auto_lint` and `linting.linters` configure conform and nvim-lint (from lua/plugins/conform.lua:52-69 and lua/plugins/nvim-lint.lua:41-46, high).
- When `CI` or `DOCKER` is set, or `/.dockerenv` exists, all language-server setup is skipped with INFO "Skipping LSP setup in CI/container environment" (from lua/plugins/nvim-lspconfig.lua:17-21, high).
- Parsers install into `stdpath("data")/site` (from lua/plugins/nvim-treesitter.lua:27, high).

## Behaviour

It must do the following, as the requirements in force state:

- The configuration must check that an external tool exists before it uses the tool. (REQ-0200)
- The configuration must limit the effect of a missing external tool to the feature that uses it. (REQ-0210)
- The configuration must start without an error when a language server, formatter or linter is missing. (REQ-0220)
- The configuration must resolve language servers, formatters and linters when they run, not when Neovim starts. (REQ-0230)
- The configuration must not install any external tool from inside Neovim. (REQ-0240)
- The configuration must start a language server only when its binary is on `PATH`. (REQ-0250)
- The configuration must use a project-local toolchain that changes `PATH` without any change to the configuration. (REQ-0260)
- `:LspOrganize` must warn, not raise an error, when no TypeScript client is attached. (REQ-0570)
- The configuration must not format a buffer longer than 5000 lines on save. (REQ-0600)
- The configuration must format a buffer longer than 800 lines after the write, so that the write doesn't wait for the formatter. (REQ-0610)
- The configuration must format through conform.nvim alone, with the language servers' own formatting turned off. (REQ-0620)
- The configuration must let prettier read a project's own `.prettierrc`. (REQ-0630)
- The configuration must keep Copilot off until `toggles.copilot` is true. (REQ-0645)
- The configuration must not show linter warnings on properly formatted Go code. (REQ-0650)
- The configuration must connect GDScript buffers to Godot's built-in language server. (REQ-0660)
- The configuration must not start two Roslyn language-server clients for one buffer. (REQ-0670)
- The configuration must detect a language server's root from that language's usual project markers, not from `.git` alone. (REQ-0680)
- The configuration must suppress rust-analyzer's didSave only when the server reports version 1.96. (REQ-0690)
- When the user types an opening bracket or quote, the configuration must insert its closing one. (REQ-0605)
- The configuration must toggle comments on a line or a selection. (REQ-0607)
- The configuration must offer rename and code actions in every buffer whose language server provides them. (REQ-0696)
- When the user saves a Rust file, the configuration must show clippy's diagnostics. (REQ-0697)
- Crate completions must appear only in `Cargo.toml`. (REQ-0698)

What it does now:

- A server is enabled through `vim.lsp.config` and `vim.lsp.enable` only when its command is executable; gdscript is always enabled (from lua/plugins/nvim-lspconfig.lua:215-270, high).
- Inlay hints turn on for a buffer only when the server supports them and the inlay-hints toggle is on (from lua/plugins/nvim-lspconfig.lua:56-60, high).
- ts_ls, html and cssls have document formatting turned off, so conform formats their buffers (from lua/plugins/nvim-lspconfig.lua:125-128, 152-160, high).
- Completion takes LSP, path, snippet, buffer and spell sources; `<CR>` never accepts, and nothing is preselected (from lua/plugins/blink-cmp.lua:82, 103-154, high).
- Copilot uses `copilot-language-server` and is disabled right after setup unless the Copilot toggle is on; `core.enable_copilot` isn't read here (from lua/plugins/copilot.lua:19-48, medium).
- `<C-l>` accepts the Copilot suggestion when one shows and the selected completion otherwise (from lua/plugins/blink-cmp.lua:67-100, high).
- 27 parsers are installed asynchronously on every start, and treesitter is started on every buffer whose filetype has a parser (from lua/plugins/nvim-treesitter.lua:33-82, high).
- On save, conform formats synchronously up to 800 lines, asynchronously from 801 to 5000 lines, and not at all above 5000 lines or under `node_modules` (from lua/plugins/conform.lua:74-101, high).
- nvim-lint keeps only linters whose command is executable when linting runs, on write and on leaving insert mode (from lua/plugins/nvim-lint.lua:71-109, high).
- The C# debug configurations exist only when `netcoredbg` is executable, and Godot is debugged through `127.0.0.1:6006` (from lua/plugins/nvim-dap.lua:57-98, high).
- rust-analyzer's didSave is suppressed only for versions containing "1.96." (from lua/plugins/rustaceanvim.lua:12-50, high).
- roslyn is set up only when `roslyn-language-server` is executable (from lua/plugins/roslyn.lua:11-17, high).

## Failure paths

- A server whose binary is missing is skipped with no message (from lua/plugins/nvim-lspconfig.lua:241-244, high).
- `:LspOrganize` without a TypeScript client shows WARN "No TypeScript LSP client attached to current buffer" (from lua/plugins/nvim-lspconfig.lua:63-79, high).
- A linter whose binary is missing is dropped with no message, and `:LintInfo` marks it with a cross (from lua/plugins/nvim-lint.lua:98-101, 123, high).
- A missing parser is ignored, and the buffer keeps regex syntax (from lua/plugins/nvim-treesitter.lua:79-80, medium).
- In CI and containers `:LspOrganize` isn't defined and no diagnostic settings apply (from lua/plugins/nvim-lspconfig.lua:17-21, medium).
