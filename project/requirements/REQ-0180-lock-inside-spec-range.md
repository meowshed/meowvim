---
id: REQ-0180
artifact: requirement
topic: platform
class: non-functional
status: approved
revised: 2026-09-27
elaborates: []
verification: static
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0180

The configuration MUST keep every `lazy-lock.json` entry inside the version range its plugin spec asks for.

An entry outside the range makes every sync move the plugin and rebuild it. Pull request #56, which states this, was open when this was recovered.

(from https://github.com/meowshed/meowvim/pull/56, medium)
