---
id: BUG-0240
artifact: bug
status: approved
severity: minor
violates: REQ-0988
enters: implement
found: 2026-09-27
revised: 2026-09-27
issue: 81
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# stylua is set to parse Lua 5.2, not LuaJIT

## Reproduction

stylua 2.5.2 on macOS, at the head of `chore/onboard-record`.

1. Write `local x = 0x1LL`, a LuaJIT integer literal, to a file.
2. Run `stylua --syntax Lua52 --check` on it, then `stylua --syntax LuaJit --check`.

## What the system does

`.stylua.toml:10` sets `syntax = "Lua52"`. With it, stylua fails to parse the file (exit 2); with `LuaJit` it parses (exit 0).

## What it should do, and why

stylua parses LuaJIT, the dialect Neovim runs, as `REQ-0988` requires.

## Triage

It enters at implement. Minor, because no file in the tree uses LuaJIT-only syntax yet.

## Closed by

Not closed: no fix and no regression check exist yet.
