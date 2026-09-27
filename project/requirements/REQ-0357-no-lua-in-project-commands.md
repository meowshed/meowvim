---
id: REQ-0357
artifact: requirement
topic: settings
class: functional
status: withdrawn
revised: 2026-09-27
elaborates: []

verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0357

The configuration MUST NOT let the project config file run arbitrary Lua.

Withdrawn with `~/.meowvim.yaml`: `projects.lua` is itself Lua.

(from https://github.com/meowshed/meowvim/pull/41, high)
