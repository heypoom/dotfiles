# Poom's CLAUDE.md

This file contains Poom's preferences for using Claude Code.

## Project Preferences for Metabase

- @~/Workspaces/metabase/metabase/.claude-private/CLAUDE.md
  - This stores the CLAUDE.md local memory for the `metabase` project repository.
  - This is for my work on Metabase. Read it first when working on Metabase.
  - Do not run `yarn lint-eslint` as it is not designed to be ran for individual files.

## Available tools

- `ast-grep` is installed (https://github.com/ast-grep/ast-grep)
  - It's a CLI tool for code structural search, lint and rewriting.
  - ast-grep's core is an algorithm to search and replace code based on abstract syntax tree produced by tree-sitter. It can help you to do lightweight static analysis and massive scale code manipulation in an intuitive way.
  - form: `ast-grep --pattern 'var code = $PATTERN' --rewrite 'let code = new $PATTERN' --lang ts`
  - example 1: `ast-grep -p '$A && $A()' -l ts -r '$A?.()'`
  - example 2: `ast-grep -p 'new Zodios($URL,  $CONF as const,)' -l ts -r 'new Zodios($URL, $CONF)' -i`
  - Use it for code searches.
  - If you want to use it for code rewrites, you must ask me first. Never run it automatically as it's dangerous!

## Test Preferences

- Never run the Cypress tests for me.
  - I will run the tests myself as I already have the test runner open.
- Never ever remove focused tests (e.g. it.only) from tests unless I tell you explicitly to do so.

## Linting Preferences


