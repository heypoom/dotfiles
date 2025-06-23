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

