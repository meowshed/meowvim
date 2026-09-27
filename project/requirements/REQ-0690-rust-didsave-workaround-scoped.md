---
id: REQ-0690
artifact: requirement
topic: editing
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0690

The configuration MUST suppress rust-analyzer's didSave only when the server reports version 1.96.

Suppressing didSave also stops `checkOnSave`, so cargo diagnostics never appear on write.

(from TODO.md:26-30, high)
