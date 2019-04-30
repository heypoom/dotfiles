#!/usr/bin/env bash

source "utilities.sh"

# Link configurations
for config in kitty fish nvim omf
do
  link_config $config
done

# Link .gitconfig
link_file "git/gitconfig" ~/.gitconfig

# Link .tmux.conf
link_file "tmux/tmux.conf" ~/.tmux.conf
link_file "tmux/tmuxline.tmux.conf" ~/.tmuxline.tmux.conf