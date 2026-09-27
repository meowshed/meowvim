---
id: REQ-0640
artifact: requirement
topic: editing
class: functional
status: superseded
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0640

The configuration MUST keep Copilot off until the user turns it on.

The docs name `core.enable_copilot` as the switch. The code follows `toggles.copilot`, which is a gap the onboarding report lists.

(from docs/04-TROUBLESHOOTING.md:162; docs/02-CONFIGURATION.md:34, high)
