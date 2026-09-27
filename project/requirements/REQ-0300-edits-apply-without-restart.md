---
id: REQ-0300
artifact: requirement
topic: settings
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0300

The configuration MUST apply a saved edit to the user config file without a restart, except for options read before the plugins load.

`leader_key` is the example the docs give of an option that needs a restart.

(from docs/02-CONFIGURATION.md:8-9; docs/04-TROUBLESHOOTING.md:57-64, high)
