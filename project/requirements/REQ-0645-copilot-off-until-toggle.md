---
id: REQ-0645
artifact: requirement
topic: editing
class: functional
status: approved
revised: 2026-09-27
elaborates: []

supersedes: [REQ-0640]
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0645

The configuration MUST keep Copilot off until `toggles.copilot` is true.

The owner chose on 2026-09-27 that `toggles.copilot`, which the code already reads, is the switch, and that `core.enable_copilot` goes.

Imposed by the owner's answer of 2026-09-27 to the onboarding gaps.
