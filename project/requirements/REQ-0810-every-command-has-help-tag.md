---
id: REQ-0810
artifact: requirement
topic: docs
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0810

`doc/meowvim.txt` MUST carry a `*:Name*` tag for every user command the configuration defines.

That file is the reference a user reaches through `:help`.

(from bin/check-docs.lua:134-136, high)
