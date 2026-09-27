---
id: REQ-0140
artifact: requirement
topic: platform
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0140

The configuration MUST force a full redraw when the terminal is resized.

Pull request #52 adds it to stop partial-redraw glitches under Zellij and other multiplexers.

(from https://github.com/meowshed/meowvim/pull/52, high)
