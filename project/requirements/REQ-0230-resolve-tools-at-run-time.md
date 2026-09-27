---
id: REQ-0230
artifact: requirement
topic: tools
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0230

The configuration MUST resolve language servers, formatters and linters when they run, not when Neovim starts.

A project that brings its own toolchain then works without any change to the configuration.

(from README.md:12-14; CLAUDE.md:48-49, high)
