---
id: REQ-0350
artifact: requirement
topic: settings
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0350

The configuration MUST match a project path only on a directory boundary, so that `/home/user/app` doesn't match `/home/user/app-v2`.

A reviewer raised it in pull request #36 and pull request #38 adopted it, for the projects system of that time.

(from https://github.com/meowshed/meowvim/pull/36#discussion_r2659805727; https://github.com/meowshed/meowvim/pull/38, medium)
