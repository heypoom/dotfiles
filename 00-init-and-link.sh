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

# Link IPython configuration
link_file "ipython" ~/.ipython

# Link .ideavimrc
link_file "ideavim/ideavimrc" ~/.ideavimrc

# Link SSH config
mkdir -p ~/.ssh
link_file "ssh/config" ~/.ssh/config

# Link pygments themes for IPython
function link_pygments_theme {
  echo "Linking Pygments Theme: $1"

  link_file "ipython/profile_default/$1.py" "/usr/local/lib/python3.7/site-packages/pygments/styles/"
}

link_pygments_theme awesome
link_pygments_theme dracula

