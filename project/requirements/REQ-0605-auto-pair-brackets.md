---
id: REQ-0605
artifact: requirement
topic: editing
class: functional
status: approved
revised: 2026-09-27
elaborates: []

verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0605

When the user types an opening bracket or quote, the configuration MUST insert its closing one.

The need behind ultimate-autopair (#32), which mini.pairs now serves.

(from https://github.com/meowshed/meowvim/pull/32; lua/plugins/mini-pairs.lua:7-9, high)
