---
name: brainstorming
description: Use when creating or developing, before writing code or implementation plans - refines rough ideas into fully-formed designs through collaborative questioning, alternative exploration, and incremental validation. Don't use during clear 'mechanical' processes
---

# Brainstorming Ideas Into Designs

<CHAIN_POSITION>
You are at step 1 of the workflow chain:

```
[YOU ARE HERE: brainstorming] → writing-plans → [choice] → droids implement
```

**NEXT STEP IS MANDATORY:** After design approved → `SKILL(skill: "writing-plans")`
</CHAIN_POSITION>

<CRITICAL_CONSTRAINT>
THIS SKILL IS FOR DESIGN ONLY.
YOU ARE FORBIDDEN FROM WRITING IMPLEMENTATION CODE OR RUNNING SETUP COMMANDS.
YOUR ONLY OUTPUT IS A MARKDOWN DESIGN DOCUMENT.

AFTER DESIGN IS SAVED, YOU MUST LOAD THE NEXT SKILL.
YOU ARE FORBIDDEN FROM CREATING ANY FILES (html, css, js, py, etc).
YOU ARE FORBIDDEN FROM IMPLEMENTING ANYTHING YOURSELF.
</CRITICAL_CONSTRAINT>

<FORBIDDEN_ACTIONS priority="ABSOLUTE">
After saving design document, you are ABSOLUTELY FORBIDDEN from:

❌ Creating implementation files (index.html, style.css, script.js, app.py, etc.)
❌ Writing any code beyond the design document
❌ Saying "saya akan langsung membuat implementasinya"
❌ Skipping writing-plans for ANY reason
❌ Implementing "because it's simple"
❌ Implementing "because there's no git repo"
❌ Implementing "because it's just 3 files"
❌ Using TodoWrite/PLAN for implementation tasks (only for tracking workflow)

If you do ANY of these, you have FAILED the protocol.
</FORBIDDEN_ACTIONS>

## Overview

Help turn ideas into fully formed designs and specs through natural collaborative dialogue.

Start by understanding the current project context, then ask questions one at a time to refine the idea. Once you understand what you're building, present the design in small sections (200-300 words), checking after each section whether it looks right so far.

## The Process

**Understanding the idea:**

- Check out the current project state first (files, docs, recent commits)
- Ask questions one at a time to refine the idea
- Prefer multiple choice questions when possible, but open-ended is fine too
- Only one question per message - if a topic needs more exploration, break it into multiple questions
- Focus on understanding: purpose, constraints, success criteria

---

## Frontend/UI Projects: Load `frontend-design` Skill

<FRONTEND_DESIGN_TRIGGER>
If the project involves UI/frontend (web app, component, page, interface), you MUST load the `frontend-design` skill to determine aesthetic direction.
</FRONTEND_DESIGN_TRIGGER>

**Detect frontend project by keywords:**
- HTML, CSS, JavaScript, React, Vue, Next.js, frontend
- UI, interface, component, page, web app
- Design, styling, layout, theme

**When detected:**
```
Say: "Project ini melibatkan UI/frontend. Saya akan load skill frontend-design untuk menentukan aesthetic direction."

SKILL(skill: "frontend-design")
```

**Then include in design document:**
- **Aesthetic Direction**: Tone/style (minimalist, brutalist, luxury, playful, etc.)
- **Typography**: Font choices and pairings
- **Color Palette**: Dominant colors, accents, CSS variables
- **Motion**: Animation approach (staggered reveals, hover effects, etc.)
- **Layout**: Spatial composition (asymmetry, grid-breaking, etc.)
- **Special Effects**: Textures, gradients, overlays

**This ensures:** Droids implementing UI tasks will have clear aesthetic direction from the design doc, resulting in distinctive, non-generic UI.

**Exploring approaches:**

- Propose 2-3 different approaches with trade-offs
- Present options conversationally with your recommendation and reasoning
- Lead with your recommended option and explain why

**Presenting the design:**

- Once you believe you understand what you're building, present the design
- Break it into sections of 200-300 words
- Ask after each section whether it looks right so far
- Cover: architecture, components, data flow, error handling, testing
- Be ready to go back and clarify if something doesn't make sense

---

## ⚠️ CRITICAL: Asking for Design Confirmation

<CONFIRMATION_SCRIPT priority="ABSOLUTE">
When asking user to confirm the design, you MUST use this EXACT script.
DO NOT deviate. DO NOT say "lanjut ke implementasi".
</CONFIRMATION_SCRIPT>

**YOU MUST SAY EXACTLY THIS:**

```
Apakah desain ini sudah sesuai? Jika ya, saya akan:
1. Menyimpan dokumen desain
2. Membuat implementation plan dengan task-task detail
3. Kemudian dispatch ke specialist droids untuk implementasi

Lanjutkan?
```

**YOU ARE FORBIDDEN FROM SAYING:**
- ❌ "Jika ya, saya akan lanjut ke implementasi"
- ❌ "Jika ya, saya akan langsung membuat..."
- ❌ "Jika ya, saya akan mulai coding..."
- ❌ Any variation that implies YOU will implement

**WHY:** The confirmation message sets expectations. If you say "implementasi", you've already planned to skip the workflow.

---

## After the Design

**Documentation:**

- Write the validated design to `docs/plans/YYYY-MM-DD-<topic>-design.md`
- Use clear, concise writing: short sentences, active voice, specific terms
- Commit the design document to git

**TRANSITION TRIGGER:**
Saving the design document is the **TRIGGER** to load the next skill.
Do NOT ask the user "what next".
Do NOT start coding (npm create, etc).
Do NOT execute implementation steps.

**ACTION:** Call `Skill(skill: "writing-plans")` immediately.

---

## ⚠️ MANDATORY NEXT STEP - DO NOT SKIP

<CHAIN_ENFORCEMENT priority="CRITICAL">
After design document is saved, you MUST follow this EXACT sequence.
SKIPPING ANY STEP IS A PROTOCOL VIOLATION.
</CHAIN_ENFORCEMENT>

**When user confirms implementation:**

1. **IMMEDIATELY** load: `Skill(skill: "writing-plans")`
2. Complete implementation plan
3. **ONLY THEN** offer execution choice

**You are FORBIDDEN from:**

- Offering execution choice before `writing-plans` is complete
- Jumping directly to coding without the plan
- Asking "what would you like to do next?" without loading next skill

**The sequence is:**

```
brainstorming → writing-plans → [THEN offer choice] → droids implement
```

**NOT:**

```
brainstorming → "what next?" → [skip to choice]  ← VIOLATION
brainstorming → CREATE files → VIOLATION!
```

---

## Key Principles

- **One question at a time** - Don't overwhelm with multiple questions
- **Multiple choice preferred** - Easier to answer than open-ended when possible
- **YAGNI ruthlessly** - Remove unnecessary features from all designs
- **Explore alternatives** - Always propose 2-3 approaches before settling
- **Incremental validation** - Present design in sections, validate each
- **Be flexible** - Go back and clarify when something doesn't make sense

---

## Anti-Rationalization (MEMORIZE THIS)

If you think ANY of these, STOP - you're about to violate the protocol:

| Rationalization | Reality |
|-----------------|---------|
| "Proyek ini sederhana, langsung implement saja" | WRONG. Simple projects STILL need plan. |
| "Hanya 3 file, tidak perlu plan" | WRONG. Even 1 file needs the workflow. |
| "User sudah setuju design, langsung coding" | WRONG. Load `writing-plans` FIRST. |
| "Biar cepat, saya implement sendiri" | WRONG. Dispatch to specialist droids. |
| "Design sudah jelas, skip planning" | WRONG. `writing-plans` creates TASKS, not design. |
| "Ini bukan proyek besar" | WRONG. Size doesn't matter. Workflow is mandatory. |
| "User minta cepat" | WRONG. Workflow IS the fastest path. |

**THE CHAIN IS NON-NEGOTIABLE:**
```
brainstorming → writing-plans → [choice] → droids implement
```

**YOU (the orchestrator) NEVER implement. DROIDS implement.**

---

## Correct Output After Design Saved

```
Design document saved to docs/plans/YYYY-MM-DD-<topic>-design.md

Now loading writing-plans skill to create implementation tasks...

SKILL(skill: "writing-plans")
```

## WRONG Output After Design Saved (VIOLATION)

```
Design document saved.

Karena ini proyek sederhana, saya akan langsung membuat implementasinya...

CREATE (index.html)  ← VIOLATION!
CREATE (style.css)   ← VIOLATION!
```

**If you catch yourself about to CREATE implementation files: STOP. Load the next skill instead.**
