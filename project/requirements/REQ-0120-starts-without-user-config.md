---
id: REQ-0120
artifact: requirement
topic: platform
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0120

The configuration MUST start when no user config file exists.

The CI workflow says a run with no user config at all would also work.

(from .github/workflows/ci.yml:77-78, medium)
