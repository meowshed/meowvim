---
id: REQ-0320
artifact: requirement
topic: settings
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0320

The configuration MUST reject a `projects.lua` entry that has no `path`.

The docs say `path` is required and don't say what happens without it.

(from docs/02-CONFIGURATION.md:246; doc/meowvim.txt:122, medium)
