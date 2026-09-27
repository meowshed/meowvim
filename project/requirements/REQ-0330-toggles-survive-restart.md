---
id: REQ-0330
artifact: requirement
topic: settings
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0330

The configuration MUST keep the state of each `<leader>o` toggle across a restart once the user persists it.

`<leader>op` writes the toggles back to the config file.

(from README.md:32-33; https://github.com/meowshed/meowvim/pull/32, high)
