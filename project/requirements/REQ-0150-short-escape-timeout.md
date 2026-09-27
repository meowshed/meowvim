---
id: REQ-0150
artifact: requirement
topic: platform
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0150

The configuration MUST set `ttimeoutlen` so that terminal escape sequences don't stall under a multiplexer.

Without it Neovim waits for escape-sequence responses, and Zellij's latency then causes partial redraws.

(from https://github.com/meowshed/meowvim/pull/51, high)
