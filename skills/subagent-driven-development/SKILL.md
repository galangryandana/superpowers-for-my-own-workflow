---
name: subagent-driven-development
description: Use when executing implementation plans with independent tasks in the current session - dispatches fresh subagent for each task with code review between tasks, enabling fast iteration with quality gates
---

# Subagent-Driven Development

Execute plan by dispatching fresh subagent per task, with code review after each.

**Core principle:** Fresh subagent per task + review between tasks = high quality, fast iteration

---

## Overview

**vs. Executing Plans (parallel session):**
- Same session (no context switch)
- Fresh subagent per task (no context pollution)
- Code review after each task (catch issues early)
- Faster iteration (no human-in-loop between tasks)

**When to use:**
- Staying in this session
- Tasks are mostly independent
- Want continuous progress with quality gates

**When NOT to use:**
- Need to review plan first (use `executing-plans`)
- Tasks are tightly coupled (manual execution better)
- Plan needs revision (brainstorm first)

---

## BEFORE YOU START

**Say this exactly:** "I will route each task to the correct specialist droid and call code-reviewer after each task."

---

## AVAILABLE DROIDS (TRUST THIS LIST)

**These droids EXIST and are available. Do NOT check system prompt - use THIS list:**

**Frontend/UI:**
- `frontend-developer` - HTML, CSS, UI, React, Vue, styling, layout
- `javascript-pro` - Vanilla JS, event handlers, DOM manipulation
- `typescript-pro` - TypeScript code

**Backend:**
- `backend-specialist` - API, endpoints, server logic
- `python-pro` - Python code
- `golang-pro` - Go code
- `java-pro` - Java code
- `rust-pro` - Rust code
- `php-pro` - PHP code
- `ruby-pro` - Ruby code
- `elixir-pro` - Elixir code
- `scala-pro` - Scala code
- `csharp-pro` - C# code
- `cpp-specialist` - C/C++ code
- `django-pro` - Django projects
- `fastapi-pro` - FastAPI projects

**Data/Database:**
- `database-specialist` - SQL, schema, queries, migrations
- `sql-pro` - Complex SQL queries
- `data-specialist` - ETL, data pipelines

**Infrastructure:**
- `devops-specialist` - CI/CD, Docker, deployment
- `kubernetes-architect` - K8s, GitOps
- `observability-engineer` - Monitoring, logging
- `network-engineer` - Networking, DNS, SSL

**Quality:**
- `test-automator` - Unit tests, E2E, integration tests
- `code-reviewer` - Code review (MANDATORY after each task)
- `ui-visual-validator` - Visual verification, UI testing
- `debugger` - Debugging issues
- `security-specialist` - Auth, JWT, encryption

**Other:**
- `documentation-specialist` - Docs, README
- `mermaid-expert` - Diagrams
- `general-purpose` - ONLY for research/exploration or fallback if no any specialist matches

---

## ROUTING TABLE (MEMORIZE THIS)

**STOP and check this table BEFORE every dispatch.**

| If task mentions... | DISPATCH TO | NOT TO |
|---------------------|-------------|--------|
| HTML, CSS, UI, styling, layout, frontend | `frontend-developer` | ~~backend-specialist~~ |
| JavaScript, JS, vanilla JS, event handlers | `javascript-pro` | ~~general-purpose~~ |
| TypeScript, TS | `typescript-pro` | ~~general-purpose~~ |
| Python | `python-pro` | ~~general-purpose~~ |
| React, Next.js, Vue | `frontend-developer` | ~~backend-specialist~~ |
| API, endpoint, server, backend logic | `backend-specialist` | ~~frontend-developer~~ |
| Database, SQL, schema, query | `database-specialist` | ~~backend-specialist~~ |
| Auth, JWT, security, encryption | `security-specialist` | ~~backend-specialist~~ |
| Test, unit test, E2E, testing | `test-automator` | ~~general-purpose~~ |
| Verify, validation, check if works | `ui-visual-validator` | ~~general-purpose~~ |
| CI/CD, Docker, deploy | `devops-specialist` | ~~general-purpose~~ |

**NEVER use `general-purpose` if ANY specialist matches.**

---

## THE PROCESS

### For Each Task, Do This EXACTLY:

```
STEP 1: READ the task description from plan file

STEP 2: CHECK routing table above
        Ask: "What does this task mention?"
        Find the matching row in the table
        
STEP 3: SAY the routing decision
        "Task N mentions [keyword], routing to [droid-name]"

STEP 4: DISPATCH to that EXACT droid
        TASK ([droid-from-step-3]: "Task with full context")
        
STEP 5: AFTER task completes, ALWAYS dispatch code-reviewer
        TASK (code-reviewer: "Review Task N: [Task Title]")
```

### Example - Correct Flow:

```
Task 1: "Create HTML structure for todo app"

STEP 2: Check table → "HTML" → frontend-developer
STEP 3: Say: "Task 1 mentions HTML, routing to frontend-developer"
STEP 4: TASK (frontend-developer: "Create HTML Structure")
        ↳ Done
STEP 5: TASK (code-reviewer: "Review Task 1: Create HTML Structure")
        ↳ Approved
```

### Example - WRONG Flow (Don't Do This):

```
Task 1: "Create HTML structure for todo app"

❌ TASK (backend-specialist: "Create HTML structure")  ← WRONG DROID!
❌ TASK (general-purpose: "Create HTML structure")  ← USE SPECIALIST!
```

---

## VALIDATION CHECK

Before EVERY dispatch, ask yourself:

1. "What keyword is in this task?" → [keyword]
2. "What droid does the table say for [keyword]?" → [droid]
3. "Am I about to dispatch to [droid]?" → Must be YES

If the droid you're about to call does NOT match the table, STOP and correct.

---

## COMPLETE WORKFLOW

### Phase 1: Setup
```
1. Read plan file
2. Create TodoWrite with all tasks
3. Say: "Starting subagent-driven-development. I will route each task to the correct specialist."
```

### Phase 2: Execute Tasks

For EACH task:
```
1. Say: "Task N mentions [keyword], routing to [droid]"
2. TASK ([droid]: "Implement Task N...")
3. TASK (code-reviewer: "Review Task N...") ← NEVER SKIP
4. Fix issues if any
5. Mark task complete in TodoWrite
6. Move to next task
```

### Phase 3: Final Review (MANDATORY - DO NOT SKIP)

<FINAL_REVIEW_GATE priority="CRITICAL">
After ALL tasks are complete, you MUST dispatch a final code-reviewer.
This reviews the ENTIRE implementation, not just individual tasks.
SKIPPING THIS STEP IS A PROTOCOL VIOLATION.
</FINAL_REVIEW_GATE>

```
1. Say: "All tasks complete. Dispatching final code review for entire implementation."

2. Get git SHAs for full implementation:
   BASE_SHA = commit before first task (or origin/main)
   HEAD_SHA = current commit (after all tasks)

3. TASK (code-reviewer: "Final review of ENTIRE implementation:
   
   WHAT_WAS_IMPLEMENTED: [Summary of all tasks completed]
   PLAN_OR_REQUIREMENTS: [Full plan file path]
   BASE_SHA: [commit before implementation started]
   HEAD_SHA: [current commit]
   
   Review checklist:
   - All plan requirements met?
   - Architecture coherent across all tasks?
   - No regressions introduced?
   - Tests comprehensive?
   - Ready for merge?")

4. Act on final review feedback:
   - Fix Critical issues immediately
   - Fix Important issues before proceeding
   - Note Minor issues for future

5. If issues found, dispatch fix subagent and re-review
```

**Final Review Output Expected:**
```
### Strengths
[What's well done across entire implementation]

### Issues
#### Critical (Must Fix)
#### Important (Should Fix)  
#### Minor (Nice to Have)

### Assessment
**Ready to merge?** [Yes/No/With fixes]
**Reasoning:** [1-2 sentences]
```

### Phase 4: Verification

```
1. Say: "Final review passed. Loading verification-before-completion skill."
   SKILL (verification-before-completion)
   
2. Run ALL verification commands:
   - Full test suite
   - Linter
   - Type check (if applicable)
   - Build (if applicable)

3. Confirm ALL pass before proceeding
```

### Phase 5: Completion

```
1. Say: "Verification passed. Loading finishing-a-development-branch skill."
   SKILL (finishing-a-development-branch)
   
2. Follow that skill to:
   - Present 4 options (merge/PR/keep/discard)
   - Execute user's choice
   - Clean up worktree if needed
```

---

## QUICK REFERENCE - Common Tasks

| Task Example | Route To |
|--------------|----------|
| "Create HTML structure" | `frontend-developer` |
| "Add CSS styling" | `frontend-developer` |
| "Add JavaScript functionality" | `javascript-pro` |
| "Implement event handlers" | `javascript-pro` |
| "Create API endpoint" | `backend-specialist` |
| "Add database schema" | `database-specialist` |
| "Implement authentication" | `security-specialist` |
| "Write unit tests" | `test-automator` |
| "Verify app works" | `ui-visual-validator` |
| "Set up CI/CD" | `devops-specialist` |

---

## RED FLAGS - STOP IMMEDIATELY

If you notice any of these, STOP and correct:

- ❌ Routing says "frontend-developer" but dispatching to "backend-specialist"
- ❌ Task mentions "JavaScript" but dispatching to "general-purpose"
- ❌ Task mentions "HTML/CSS" but dispatching to "backend-specialist"
- ❌ Skipping code-reviewer after a task
- ❌ Using "general-purpose" for any implementation task

---

## MANDATORY CHECKLIST (Before Saying "Done")

- [ ] Every task routed to correct specialist per table
- [ ] Code-reviewer called after EVERY task
- [ ] Final verification with ui-visual-validator
- [ ] Final code review completed
- [ ] verification-before-completion skill loaded
- [ ] finishing-a-development-branch skill loaded

**If any unchecked, workflow is INCOMPLETE.**

---

## Example Workflow

```
You: I'm using Subagent-Driven Development to execute this plan.

[Load plan from docs/plans/2024-01-15-todo-app.md]
[Create TodoWrite with 4 tasks]

Say: "Starting subagent-driven-development. I will route each task to the correct specialist."

---

Task 1: Create HTML structure for todo app

Say: "Task 1 mentions HTML, routing to frontend-developer"
TASK (frontend-developer: "Create HTML Structure")
↳ Subagent: Created index.html with semantic structure

TASK (code-reviewer: "Review Task 1: Create HTML Structure")
↳ Reviewer: Strengths: Good semantic HTML. Issues: None. Ready.

[Mark Task 1 complete]

---

Task 2: Add CSS styling

Say: "Task 2 mentions CSS, routing to frontend-developer"
TASK (frontend-developer: "Add CSS Styling")
↳ Subagent: Added style.css with responsive design

TASK (code-reviewer: "Review Task 2: Add CSS Styling")
↳ Reviewer: Strengths: Clean CSS. Issues (Minor): Could use CSS variables.

[Mark Task 2 complete]

---

Task 3: Add JavaScript functionality

Say: "Task 3 mentions JavaScript, routing to javascript-pro"
TASK (javascript-pro: "Add JavaScript Logic")
↳ Subagent: Added script.js with CRUD operations

TASK (code-reviewer: "Review Task 3: Add JavaScript Logic")
↳ Reviewer: Issues (Important): Missing error handling

TASK (javascript-pro: "Fix: Add error handling for localStorage")
↳ Subagent: Added try-catch blocks

[Mark Task 3 complete]

---

[All tasks complete]

Say: "All tasks complete. Dispatching final code review for entire implementation."
TASK (code-reviewer: "Final review of entire Todo App implementation")
↳ Final reviewer: All requirements met, ready to merge

Say: "Final review passed. Loading verification-before-completion skill."
SKILL (verification-before-completion)
[Run tests, lint, etc.]

Say: "Verification passed. Loading finishing-a-development-branch skill."
SKILL (finishing-a-development-branch)
[Present 4 options to user]

Done!
```

---

## Advantages

**vs. Manual execution:**
- Specialist droids are more focused and competent than general-purpose
- Fresh context per task (no confusion from accumulated state)
- Parallel-safe (subagents don't interfere with each other)
- Routing table prevents wrong droid selection

**vs. Executing Plans:**
- Same session (no handoff overhead)
- Continuous progress (no waiting for human between tasks)
- Review checkpoints are automatic
- Faster iteration cycle

**Cost:**
- More subagent invocations
- But catches issues early (cheaper than debugging later)
- Specialist droids produce higher quality output

---

## Integration

**Required workflow skills:**
- **writing-plans** - REQUIRED: Creates the plan that this skill executes
- **requesting-code-review** - REQUIRED: Review after each task (see Phase 2, 3)
- **verification-before-completion** - REQUIRED: Verify before finishing (see Phase 4)
- **finishing-a-development-branch** - REQUIRED: Complete development (see Phase 5)

**Subagents must follow:**
- **test-driven-development** - Subagents follow TDD for each task
- **testing-anti-patterns** - Avoid testing mock behavior, no test-only methods

**Alternative workflow:**
- **executing-plans** - Use for parallel session instead of same-session execution

**If subagent fails task:**
- Dispatch fix subagent with specific instructions
- Don't try to fix manually (context pollution)
- Use `debugger` droid if issue is complex

See code-reviewer template: `requesting-code-review/code-reviewer.md`
