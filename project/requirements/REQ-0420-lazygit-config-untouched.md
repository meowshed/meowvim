---
id: REQ-0420
artifact: requirement
topic: themes
class: functional
status: approved
revised: 2026-09-27
elaborates: []
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0420

The configuration MUST NOT edit the user's lazygit config.

That file is often a symlink into a dotfiles tree.

(from docs/04-TROUBLESHOOTING.md:146; docs/02-CONFIGURATION.md:140-142, high)
