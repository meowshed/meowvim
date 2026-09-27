---
id: REQ-0892
artifact: requirement
topic: docs
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0892

The installation instructions MUST work on a fresh system.

CI installs from scratch on Ubuntu and macOS on every push (`.github/workflows/ci.yml:36-94`).

(from https://github.com/meowshed/meowvim/issues/1, high)

Settled by Claude on 2026-09-27, on the owner's instruction to answer the remaining onboarding gaps.
