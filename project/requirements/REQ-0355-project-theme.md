---
id: REQ-0355
artifact: requirement
topic: settings
class: functional
status: approved
revised: 2026-09-27
elaborates: []

verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0355

When Neovim works in a configured project's directory, the configuration MUST apply that project's theme.

The need behind `~/.meowvim.yaml` (#36), which `projects.lua` now serves.

(from https://github.com/meowshed/meowvim/pull/36, high)
