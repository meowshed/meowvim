---
id: REQ-0310
artifact: requirement
topic: settings
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0310

`config.get(key, default)` MUST return the default only when the key is absent.

An option set to `false` then comes back as `false`, not as the default.

(from docs/02-CONFIGURATION.md:261-262; doc/meowvim.txt:104-105, high)
