---
name: simple-linear-task
description: Use when working on a small implementation task from a Linear issue, especially when the user provides a Linear URL or issue key and expects code changes plus draft PR creation or PR description updates.
author: Phoomparin Mano
---

# Simple Linear Task

Use this for small, well-scoped Linear tasks where the expected flow is: understand the issue, make the minimal implementation, verify it, and prepare the GitHub PR.

## Workflow

1. Resolve the Linear issue.
   - Always fetch the issue with Linear MCP tools. Search by issue key or URL if needed, then fetch the full issue.
   - Read the title, description, labels, status, attachments, and suggested branch name.
   - Summarize the user-facing problem and the likely implementation target before editing.

2. Ask before guessing.
   - If the Linear description, acceptance criteria, wording, target surface, or implementation detail is unclear, ask Poom a concise question before changing code.
   - If the issue is clear, proceed without asking.
   - Do not invent product copy when the issue gives a specific phrase or when a screenshot/user feedback suggests a copy nuance; ask or use the provided wording.

3. Prepare the branch context.
   - Check the current branch and working tree.
   - If already on the issue branch, continue there.
   - If a branch is needed and the issue includes `gitBranchName`, use that branch name.
   - Do not overwrite or revert unrelated local changes.

4. Implement narrowly.
   - Start from the concrete files implied by the issue, search with `rg`, and follow existing repo patterns.
   - Keep the change scoped to the issue.
   - Update nearby focused tests when behavior, accessible interactions, or request payloads change.
   - Prefer tests that exercise a user interaction and assert its observable result, such as saved state, a request payload, or a changed UI state. Avoid tests that merely restate declarations, including form-field labels, descriptions, or configured values, unless the text itself is the user-facing behavior under test.

5. Verify honestly.
   - Run focused checks appropriate to the touched files.
   - If a test command fails because of environment/tooling problems, retry once with a more focused or better-configured command when reasonable.
   - Report blocked verification plainly, including the exact failure type.

6. Prepare GitHub PR.
   - Resolve the current branch's PR with `gh pr view` when possible.
   - If a PR already exists, update its description by preserving the existing body first.
   - Never replace an existing PR body wholesale unless Poom explicitly asks you to rewrite it from scratch.
   - Before editing an existing PR body, read it with `gh pr view --json body` and decide whether it contains manual content. Treat non-placeholder verification steps, screenshots/images, demo sections, reviewer notes, context, or unusual formatting as user-authored work that must be preserved.
   - Merge concise updates into the existing body: update stale sentences, add missing bullets, or adjust checklist items, but keep manual "How to verify" steps, images, demo assets, and other hand-written sections intact.
   - If the existing body is only the untouched repository template, replace the placeholders with a concise description.
   - If no PR exists and the user asked for follow-through, create a draft PR.
   - Use the repository PR template. Read `.github/PULL_REQUEST_TEMPLATE.md` first when present.
   - Fill in concrete sections from the actual diff and verification:
     - closing issue reference
     - description of the problem and implementation
     - "How to verify" steps a reviewer can follow
     - checklist state based on tests/docs actually changed
   - For manual verification, make unusual repro states operationally precise. Do not write vague steps like "create a broken model" or "use an invalid object"; include the exact entity type, required IDs or preconditions, API/CLI commands or fields to change, expected result, and restore/cleanup step.
   - Remove unused placeholder sections such as Demo when there is no demo asset, but only when the section is still placeholder text. Never remove a Demo section with screenshots, videos, links, or user-written notes.
   - Read the PR back after creation/editing to confirm the saved body.

## PR Body Guidance

Prefer concise PR descriptions. For Metabase-style PRs, this shape is usually enough:

```markdown
Closes ISSUE-123

### Description

<What user-facing problem this solves and what changed.>

### How to verify

1. <Concrete reviewer step>
2. <Concrete reviewer step>
3. <Restore or clean up any temporary repro data>

### Checklist

- [x] Tests have been added/updated to cover changes in this PR
- [ ] If adding new Loki tests: they pass [stress testing](https://github.com/metabase/metabase/actions/workflows/loki-stress-test-flake-fix.yml)
```

Only mark checklist items as complete when true.
