---
name: using-git-worktrees
description: Use when starting feature work that needs isolation from current workspace or before executing implementation plans - creates isolated git worktrees with smart directory selection and safety verification
---

# Using Git Worktrees

<CRITICAL_CONSTRAINT>
THIS SKILL IS FOR WORKTREE SETUP ONLY.
AFTER WORKTREE IS READY, YOU MUST LOAD `writing-plans` SKILL.
YOU ARE FORBIDDEN FROM IMPLEMENTING ANYTHING YOURSELF.
YOU ARE FORBIDDEN FROM OFFERING EXECUTION CHOICE BEFORE PLAN EXISTS.
</CRITICAL_CONSTRAINT>

<OPTIONAL_SKILL>
This skill is OPTIONAL - not part of the core workflow chain.
Use when you need isolated workspace for feature development.

Core chain: `brainstorming → writing-plans → [choice] → droids implement`

**When to use this skill:**
- Working on existing git repository
- Need isolation from main branch
- Multiple features in parallel
</OPTIONAL_SKILL>

## Overview

Git worktrees create isolated workspaces sharing the same repository, allowing work on multiple branches simultaneously without switching.

**Core principle:** Systematic directory selection + safety verification = reliable isolation.

**Announce at start:** "I'm using the using-git-worktrees skill to set up an isolated workspace."

## Directory Selection Process

Follow this priority order:

### 1. Check Existing Directories

```bash
# Use LS to check directories
LS(directory_path: ".worktrees") # Preferred (hidden)
LS(directory_path: "worktrees")  # Alternative
```

**If found:** Use that directory. If both exist, `.worktrees` wins.

### 2. Check AGENTS.md

```bash
Grep(pattern: "worktree.*director", path: "AGENTS.md")
```

**If preference specified:** Use it without asking.

### 3. Ask User

If no directory exists and no AGENTS.md preference:

```
No worktree directory found. Where should I create worktrees?

1. .worktrees/ (project-local, hidden)
2. ~/.factory/worktrees/<project-name>/ (global location)

Which would you prefer?
```

## Safety Verification

### For Project-Local Directories (.worktrees or worktrees)

**MUST verify .gitignore before creating worktree:**

```bash
Grep(pattern: "^\.worktrees/$", path: ".gitignore")
Grep(pattern: "^worktrees/$", path: ".gitignore")
```

**If NOT in .gitignore:**

Per Jesse's rule "Fix broken things immediately":

1. Add appropriate line to .gitignore
2. Commit the change using Execute
3. Proceed with worktree creation

**Why critical:** Prevents accidentally committing worktree contents to repository.

### For Global Directory (~/.factory/worktrees)

No .gitignore verification needed - outside project entirely.

## Creation Steps

### 1. Detect Project Name

```bash
Execute(command: "basename $(git rev-parse --show-toplevel)")
```

### 2. Create Worktree

```bash
# Use Execute to create worktree
Execute(command: "git worktree add path/to/worktree -b branch-name")
```

Bash logic for path determination (internal reference):
```bash
case $LOCATION in
  .worktrees|worktrees)
    path="$LOCATION/$BRANCH_NAME"
    ;;
  ~/.factory/worktrees/*)
    path="~/.factory/worktrees/$project/$BRANCH_NAME"
    ;;
esac
```

### 3. Run Project Setup

Auto-detect and run appropriate setup:

```bash
# Use Execute for setup commands
if [ -f package.json ]; then npm install; fi

# Rust
if [ -f Cargo.toml ]; then cargo build; fi

# Python
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
if [ -f pyproject.toml ]; then poetry install; fi

# Go
if [ -f go.mod ]; then go mod download; fi
```

### 4. Verify Clean Baseline

Run tests to ensure worktree starts clean:

```bash
# Use Execute to run tests
npm test
cargo test
pytest
go test ./...
```

**If tests fail:** Report failures, ask whether to proceed or investigate.

**If tests pass:** Report ready.

### 5. Report Location

```
Worktree ready at <full-path>
Tests passing (<N> tests, 0 failures)
Ready to implement <feature-name>
```

## Quick Reference

| Situation                   | Action                      |
| --------------------------- | --------------------------- |
| `.worktrees/` exists        | Use it (verify .gitignore with Grep)  |
| `worktrees/` exists         | Use it (verify .gitignore with Grep)  |
| Both exist                  | Use `.worktrees/`           |
| Neither exists              | Check AGENTS.md → Ask user  |
| Directory not in .gitignore | Add it immediately + commit |
| Tests fail during baseline  | Report failures + ask       |
| No package.json/Cargo.toml  | Skip dependency install     |

## Common Mistakes

**Skipping .gitignore verification**

- **Problem:** Worktree contents get tracked, pollute git status
- **Fix:** Always Grep .gitignore before creating project-local worktree

**Assuming directory location**

- **Problem:** Creates inconsistency, violates project conventions
- **Fix:** Follow priority: existing > AGENTS.md > ask

**Proceeding with failing tests**

- **Problem:** Can't distinguish new bugs from pre-existing issues
- **Fix:** Report failures, get explicit permission to proceed

**Hardcoding setup commands**

- **Problem:** Breaks on projects using different tools
- **Fix:** Auto-detect from project files (package.json, etc.)

## Example Workflow

```
You: I'm using the using-git-worktrees skill to set up an isolated workspace.

[Check .worktrees/ - exists]
[Grep .gitignore - contains .worktrees/]
[Execute: git worktree add .worktrees/auth -b feature/auth]
[Execute: npm install]
[Execute: npm test - 47 passing]

Worktree ready at /Users/galangryandana/myproject/.worktrees/auth
Tests passing (47 tests, 0 failures)
Ready to implement auth feature

TRANSITION: Loading writing-plans skill...
[SKILL(skill: "writing-plans")]
```

## Red Flags

**Never:**

- Create worktree without .gitignore verification (project-local)
- Skip baseline test verification
- Proceed with failing tests without asking
- Assume directory location when ambiguous
- Skip AGENTS.md check

**Always:**

- Follow directory priority: existing > AGENTS.md > ask
- Verify .gitignore for project-local
- Auto-detect and run project setup
- Verify clean test baseline

## Integration

**Called by:**

- **brainstorming** (Phase 4) - REQUIRED when design is approved and implementation follows
- Any skill needing isolated workspace

**Pairs with:**

- **finishing-a-development-branch** - REQUIRED for cleanup after work complete
- **executing-plans** or **subagent-driven-development** - Work happens in this worktree

---

## ⚠️ MANDATORY NEXT STEP - DO NOT SKIP

<CHAIN_ENFORCEMENT priority="CRITICAL">
After worktree is ready, you MUST immediately proceed to writing-plans.
SKIPPING THIS STEP IS A PROTOCOL VIOLATION.
</CHAIN_ENFORCEMENT>

**When worktree setup is complete:**

1. Report worktree location and test status
2. **IMMEDIATELY** load: `SKILL(skill: "writing-plans")`
3. Create detailed implementation plan
4. **ONLY THEN** offer execution choice

**You are FORBIDDEN from:**

- Asking "what would you like to do next?" after worktree ready
- Offering execution choice before plan exists
- Starting to code without calling `writing-plans`
- Skipping plan "because design is clear enough"

**Correct output after worktree ready:**

```
Worktree ready at /path/to/worktree
Tests passing (N tests, 0 failures)

Now I'll create the implementation plan.

[IMMEDIATELY call SKILL(skill: "writing-plans")]
```

**WRONG output (VIOLATION):**

```
Worktree ready at /path/to/worktree
Tests passing (N tests, 0 failures)

What would you like to do next?  ← VIOLATION - must call writing-plans
```
