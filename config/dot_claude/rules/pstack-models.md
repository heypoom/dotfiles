# pstack model configuration. One line per role. Delete a line to fall back to the skill default.
# `inherit-parent` or `auto` as a value: the role runs on the parent chat model (omit Task `model`). Alias entries in a panel list still count toward its fan-out.
# budget: medium (high)
feature, refactoring: inherit-parent
bug-fix: inherit-parent
perf-issue: inherit-parent
hillclimb: inherit-parent
judgment and prose: opus high
hardest tasks: opus high
how explorer: inherit-parent
how explainer: opus high
why investigators: inherit-parent
why synthesizer: opus high
reflect tooling: inherit-parent
reflect judgment, divergent, synthesizer: opus high
arena runners: opus high, inherit-parent
arena cross-judge pool: opus high, inherit-parent
swarm workers: inherit-parent
architect runners: opus high, inherit-parent
interrogate reviewers: opus high, inherit-parent
