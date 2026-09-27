---
id: REQ-0190
artifact: requirement
topic: platform
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: static
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0190

The configuration MUST NOT carry a hardcoded local `dir =` override in any plugin spec.

A local path makes the configuration unportable to another machine.

(from https://github.com/meowshed/meowvim/pull/54, high)
