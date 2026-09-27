---
id: REQ-0610
artifact: requirement
topic: editing
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0610

The configuration MUST format a buffer longer than 800 lines after the write, so that the write doesn't wait for the formatter.

(from docs/03-WORKFLOWS.md:62-63, high)
