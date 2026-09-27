---
id: REQ-0410
artifact: requirement
topic: themes
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0410

The configuration MUST load only the active colorscheme at startup.

The other colorschemes are installed but idle, so switching costs a load and not a download.

(from docs/02-CONFIGURATION.md:198-200, high)
