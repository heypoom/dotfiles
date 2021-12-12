#!/usr/bin/env fish

echo "🟡 applying abbreviations."

# git abbreviations.
abbr -a g git
abbr -a gaa 'git add --all'
abbr -a gc 'git commit'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gdh 'git diff HEAD'
abbr -a gl 'git pull'
abbr -a gp 'git push'

# gh abbreviations.
abbr -a gpv 'gh pr view -w'
abbr -a grv 'gh repo view -w'

# exa abbreviations.
abbr -a l exa
abbr -a ls exa
abbr -a tree 'exa --tree'

# tmux abbreviations.
abbr -a ta 'tmux attach'
abbr -a tns 'tmux new -s'

# lunarvim abbreviations.
abbr -a v lvim
abbr -a vi lvim
abbr -a vim lvim

# chezmoi abbreviations.
abbr -a ch chezmoi
