---
id: REQ-0800
artifact: requirement
topic: docs
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0800

The documentation MUST name a `<leader>` mapping or a `:Command` only when the configuration defines it.

A renamed mapping otherwise leaves an instruction that no longer works.

(from CLAUDE.md:41-45; README.md:129; bin/check-docs.lua:12-13, high)
