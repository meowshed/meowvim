---
id: REQ-0700
artifact: requirement
topic: workspace
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0700

The configuration MUST restore a session only when Neovim starts with no file arguments and a session exists for the directory.

(from docs/02-CONFIGURATION.md:152-153, high)
