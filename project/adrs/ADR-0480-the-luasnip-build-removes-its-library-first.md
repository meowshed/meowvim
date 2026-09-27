---
id: ADR-0480
artifact: adr
status: approved
revised: 2026-09-27
addresses: [REQ-0170]
supersedes: []
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# 0480. The LuaSnip build removes its library first

## Decision

The LuaSnip build step deletes `deps/luasnip-jsregexp.so` before `make install_jsregexp` copies the new one. (from https://github.com/meowshed/meowvim/pull/56; lua/plugins/luasnip.lua:13-16, high)

This record was recovered during onboarding from what the repository already does, so it works now; it promises nothing new.

## Why

The Makefile copies over the file in place, and when Neovim has it loaded the rewrite corrupts the mapped library and Neovim segfaults on exit.

## Alternatives

| Option | Better at | Why it lost |
| --- | --- | --- |
| Do nothing: `make install_jsregexp` | LuaSnip's documented build | Neovim crashed on exit after a rebuild |

## What it costs

Not recorded in the sources.

## What would reverse it

- A condition isn't recorded; the onboarding report asks for one.

## Consequences

Nothing beyond the decision itself is recorded.

## How I will know it was realised

1. The tree already does what the Decision section describes; a reviewer confirms it against the cited source.

## What this does not settle

- Anything beyond the choice the source records.
