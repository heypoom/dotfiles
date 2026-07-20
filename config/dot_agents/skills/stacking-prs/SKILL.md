---
name: stacking-prs
description: Use when deciding whether to split implementation or refactoring work into stacked pull requests, especially when small slices could hide the end-to-end change from reviewers.
author: Phoomparin Mano
---

# Stacking PRs

## Overview

Stack for reviewability, not for small diffs. Each PR must let a reviewer
understand its purpose, boundary, behavior, and verification without reading
the rest of the stack.

## Choose reviewable boundaries

Make each PR a logical unit of change. A reviewer should be able to answer all
four questions from that PR and its parent:

1. What problem or architectural boundary does this PR address?
2. What behavior, contract, or ownership changes here?
3. Why is this a complete step rather than preparation for a later PR?
4. How does its focused verification prove that step?

Keep supporting helpers with their first meaningful consumer. Extract a helper
first only when the helper itself has a clear contract, independent tests, and a
reviewable reason to exist.

## Shape the stack

Prefer one of these shapes:

- **Incremental feature:** each PR extends a working vertical slice with a
  comprehensible user or API behavior.
- **Incremental refactor:** first PR establishes the complete new boundary;
  later PRs perform mechanical moves or remove the old path without changing
  behavior.

Avoid stacks of utilities, types, or helpers whose intent becomes clear only
after reviewing every later PR. Combine those with the behavior they enable.

## Example

For a refactor that introduces a reusable API and removes a misleading module
boundary:

1. Add the reusable API, its complete input-to-output boundary, and the
   compatibility tests in one PR.
2. Follow with a behavior-preserving namespace relocation in a second PR.

Do not split the first PR into separate "add options", "add parser", and
"add builder" PRs. Reviewing those independently obscures the boundary that
the refactor is meant to create.

## Final check

- State the purpose and verification of each PR in its description.
- Name each stack level by its logical change, not by a helper it happens to add.
- Flatten adjacent PRs if either needs the other for a reviewer to understand
  its purpose.
- Keep the stack as short as the logical boundaries allow.
