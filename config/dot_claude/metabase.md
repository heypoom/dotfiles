# Metabase

- We use git-spice (command: `gs`) to manage branch slicing
- My local Metabase directory is in `/Users/poom/Workspaces/metabase/metabase`
  - It has the git-excluded `.claude-private` directory which should contain
    the Claude memory files for project planning.
  - Always update the local memory file within `.claude-private` unless stated
    otherwise. Do not update the project's `CLAUDE.md` unless stated explicitly.
  - `.claude-private/emb-*` (e.g. emb-451) contains my reference worktrees that
    are used for Claude to use as quick references (e.g. when splitting a huge
    proof-of-concept implementation branches into smaller stacked PRs)
  - `.claude-private/testing-plans` contains full copy of testing plans.
    This contains the dimensions, actions and test cases for writing e2e and unit tests.
  - `.claude-private/tech-docs` contains full copy of technical documents.
    This contains the technical specification of a project.
  - `.claude-private/plans/` contains implementation plans for Linear issues and features.
    Each plan breaks down requirements, architecture, tasks, and testing strategies.
  - `.claude-private/learnings/` contains learnings and reflections that Claude creates
    automatically after fixing issues and implementing tasks. This preserves knowledge
    about patterns, challenges, solutions, and best practices for future sessions. Keep
    the learnings short and concise so I can easily read and edit it.

