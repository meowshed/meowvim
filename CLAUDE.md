---
id: constitution
artifact: constitution
status: live
revised: 2026-09-27
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# CLAUDE.md

<role>
The root policy for this repository. The commit convention and the
verification commands live in `.meowpaw/profile.toml`, and that file wins
where the two disagree.
</role>

<project>
meowvim is a Neovim configuration for Neovim 0.12 and later. `init.lua` loads
the modules under `lua/`, the plugin specs sit one per file in `lua/plugins/`,
and each user keeps their own settings in `~/.config/meowvim/config.lua`.
</project>

<principles>

<principle name="stylua_formats_every_lua_file">
Format Lua with `stylua`, using the settings in `.stylua.toml`: 2 spaces,
120 columns, double quotes and parentheses on every call. CI runs
`stylua --check lua/ init.lua` and fails the push on any difference, so a
change formatted by hand fails CI even when the code is correct.
</principle>

<principle name="every_source_file_carries_a_licence_header">
Open every Lua and shell file with the `SPDX-License-Identifier: MIT` line
and the copyright line that the other files carry. All 73 tracked Lua and
shell files have them today, and a file without them has no licence stated
where a reader meets it.
</principle>

<principle name="the_docs_name_only_what_exists">
Name a `<leader>` mapping or a `:Command` in `README.md`, `TODO.md`, `docs/`
or `doc/meowvim.txt` only when the configuration defines it, because a
renamed mapping otherwise leaves an instruction that no longer works.
`bin/check-docs.lua` reads every name out of those files and looks each one
up in a running Neovim, and `bin/test-config.sh` fails when one is missing.
</principle>

<principle name="tools_come_from_the_path">
Find language servers, formatters and linters on `PATH` when they run, and
install none from inside Neovim. mise replaced Mason in 66e04ea so that a
project's own `mise.toml` picks its tool versions, and a machine without a
tool loses that one feature without an error at startup.
</principle>

</principles>

<gate>
CI in `.github/workflows/ci.yml` runs two jobs on every push and pull request
to `main`. The lint job fails when `stylua --check lua/ init.lua` finds a
formatting difference or `luacheck lua/ init.lua` reports a warning, with the
settings in `.luacheckrc`. The test job installs the plugins on Ubuntu and macOS
with stable and nightly Neovim, then runs `bash bin/test-config.sh`, which
fails on a startup error or on a docs name the configuration doesn't define.
</gate>
