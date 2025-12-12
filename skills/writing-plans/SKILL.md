---
name: writing-plans
description: Use when design is complete and you need detailed implementation tasks for engineers with zero codebase context - creates comprehensive implementation plans with exact file paths, complete code examples, and verification steps assuming engineer has minimal domain knowledge
---

# Writing Plans

<CRITICAL_CONSTRAINT>
THIS SKILL IS FOR CREATING IMPLEMENTATION PLANS ONLY.
AFTER PLAN IS SAVED, YOU MUST OFFER EXECUTION CHOICE.
YOU ARE FORBIDDEN FROM IMPLEMENTING ANYTHING YOURSELF.
YOU ARE FORBIDDEN FROM CREATING FILES (html, css, js, py, etc).
DROIDS IMPLEMENT. YOU ORCHESTRATE.
</CRITICAL_CONSTRAINT>

<CHAIN_POSITION>
You are at step 2 of the workflow chain:

```
brainstorming → [YOU ARE HERE: writing-plans] → [choice] → droids implement
```

**NEXT STEP IS MANDATORY:** After plan saved → OFFER EXECUTION CHOICE (subagent-driven OR executing-plans)
</CHAIN_POSITION>

## Overview

Write comprehensive implementation plans assuming the engineer has zero context for our codebase and questionable taste. Document everything they need to know: which files to touch for each task, code, testing, docs they might need to check, how to test it. Give them the whole plan as bite-sized tasks. DRY. YAGNI. TDD. Frequent commits.

Assume they are a skilled developer, but know almost nothing about our toolset or problem domain. Assume they don't know good test design very well.

**Announce at start:** "I'm using the writing-plans skill to create the implementation plan."

**Context:** This should be run in a dedicated worktree (created by brainstorming skill).

**Save plans to:** `docs/plans/YYYY-MM-DD-<feature-name>.md`

## Bite-Sized Task Granularity

**Each step is one action (2-5 minutes):**
- "Write the failing test" - step
- "Run it to make sure it fails" - step
- "Implement the minimal code to make the test pass" - step
- "Run the tests and make sure they pass" - step
- "Commit" - step

## Plan Document Header

**Every plan MUST start with this header:**

```markdown
# [Feature Name] Implementation Plan

> **For Droid:** REQUIRED SUB-SKILL: Use `executing-plans` skill to implement this plan task-by-task.

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---
```

## Task Structure

```markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/exact/path/to/test.py`

#### Step 1: Write the failing test

```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

#### Step 2: Run test to verify it fails

Run: `pytest tests/path/test.py::test_name -v`
Expected: FAIL with "function not defined"

#### Step 3: Write minimal implementation

```python
def function(input):
    return expected
```

#### Step 4: Run test to verify it passes

Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS

#### Step 5: Commit

```bash
git add tests/path/test.py src/path/file.py
git commit -m "feat: add specific feature"
```
```

## Remember
- Exact file paths always
- Complete code in plan (not "add validation")
- Exact commands with expected output
- Reference relevant skills with @ syntax
- DRY, YAGNI, TDD, frequent commits

## Execution Handoff

After saving the plan, offer execution choice:

**"Plan complete and saved to `docs/plans/<filename>.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?"**

---

## CRITICAL: Execution Choice Handling

### If User Chooses Option 1 (Subagent-Driven):

**YOU MUST DO THIS EXACTLY:**

```
Step 1: Say "Loading subagent-driven-development skill for execution"

Step 2: Actually load the skill:
SKILL (subagent-driven-development)

Step 3: Wait for skill to load

Step 4: Follow the loaded skill's instructions EXACTLY
```

**DO NOT skip the SKILL() call. DO NOT just start executing.**

### If User Chooses Option 2 (Parallel Session):

- Guide them to open new session in worktree
- New session uses `executing-plans` skill

---

## FORBIDDEN BEHAVIORS

- ❌ Starting execution without loading subagent-driven-development skill
- ❌ Dispatching tasks without following the skill's routing table
- ❌ Using general-purpose for HTML/CSS/JS tasks
- ❌ Skipping code-reviewer after tasks
