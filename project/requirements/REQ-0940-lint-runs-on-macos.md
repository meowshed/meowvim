---
id: REQ-0940
artifact: requirement
topic: repo
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0940

The lint check MUST run on macOS as well as on Linux.

The lint verb failed on macOS with exit 126 until luacheck came from luarocks.

(from https://github.com/meowshed/meowvim/pull/55, high)
