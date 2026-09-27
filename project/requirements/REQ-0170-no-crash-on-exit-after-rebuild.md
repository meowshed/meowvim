---
id: REQ-0170
artifact: requirement
topic: platform
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0170

The configuration MUST let Neovim exit without crashing after a plugin sync rebuilds LuaSnip.

A rebuild overwrote the loaded `luasnip-jsregexp.so`, and Neovim segfaulted on exit.

(from https://github.com/meowshed/meowvim/pull/55; https://github.com/meowshed/meowvim/pull/56, high)
