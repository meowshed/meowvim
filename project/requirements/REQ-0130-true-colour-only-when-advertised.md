---
id: REQ-0130
artifact: requirement
topic: platform
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0130

The configuration MUST enable true colour only when the terminal advertises it through `COLORTERM`, `TERM` or `TERM_PROGRAM`.

Forcing true colour under a multiplexer that doesn't support it causes partial redraws.

(from docs/04-TROUBLESHOOTING.md:39-41; docs/01-INSTALLATION.md:59-61; https://github.com/meowshed/meowvim/pull/51, high)
