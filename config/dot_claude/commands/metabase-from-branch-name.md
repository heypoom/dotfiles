# Start implementing from the branch name

1. Look at the branch's name using `git symbolic-ref --short HEAD`
2. If the branch starts with `emb-xxx`, that is the Linear ID. Example: emb-666-my-task has the id of EMB-666.
3. Use the Linear MCP to read the task information off Linear.
4. Create an implementation plan in `./claude-private/plans` as a Markdown file with the prefix of `emb-xxx`.
5. Ask for me to approve the implementation plan.
6. Start implementing.

