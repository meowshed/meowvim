---
id: REQ-0160
artifact: requirement
topic: platform
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0160

The configuration MUST produce no `:checkhealth` warnings about the Python, Ruby, Perl or Node providers.

No plugin needs a provider, so pull request #52 disables all four to clear the warnings.

(from https://github.com/meowshed/meowvim/pull/52; init.lua:9, high)
