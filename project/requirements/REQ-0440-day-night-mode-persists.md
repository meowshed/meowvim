---
id: REQ-0440
artifact: requirement
topic: themes
class: functional
status: approved
revised: 2026-09-27
elaborates: []
prompted-by: BUG-0110
verification: behavioural
---

<!-- Written to the writing standard meow-prose ships: lead with the answer, give each rule its reason in the same sentence, and show the failing case. -->

# REQ-0440

When the user changes the day/night mode, the new mode MUST still be in effect after a restart.

Chosen during the requirements step: the defect found no source saying whether a mode change should persist, and setting a slot or a preset already persists, so the mode now behaves the same way.

Imposed by the owner's instruction of 2026-09-27 to approve the defects and write the specifications.
