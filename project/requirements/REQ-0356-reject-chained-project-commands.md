---
id: REQ-0356
artifact: requirement
topic: settings
class: functional
status: withdrawn
revised: 2026-09-27
elaborates: []

verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0356

The configuration MUST reject a project command that chains further commands with `|`, `!`, `&` or a backtick.

Withdrawn with `~/.meowvim.yaml`: `projects.lua` is a Lua file the user writes, so its commands are trusted.

(from https://github.com/meowshed/meowvim/pull/37, high)
