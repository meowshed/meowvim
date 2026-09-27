---
id: REQ-0100
artifact: requirement
topic: platform
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: static
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0100

The configuration MUST run on Neovim 0.12 or later.

The same floor is stated in four places, and `lua/plugins/rustaceanvim.lua:9` pins rustaceanvim v9 because v9 needs 0.12.

(from docs/01-INSTALLATION.md:9-10; README.md:48; CLAUDE.md:19; doc/meowvim.txt:47, high)
