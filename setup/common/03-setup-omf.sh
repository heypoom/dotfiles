#!/usr/bin/env bash

if [ `uname` != Darwin ]
then
  echo "🟡 setup fish variables for linux"
  # cp ~/.config/fish/fish_variables.linux ~/.config/fish/fish_variables
fi

if [ ! -d "$HOME/.local/share/omf/" ]
then
  echo "🟡 installing oh-my-fish"

  mkdir -p "$HOME/.local/share"

  # Install oh-my-fish
  curl -s -L https://get.oh-my.fish > /tmp/omf.install.fish
  fish /tmp/omf.install.fish --noninteractive --yes &> /dev/null

  # Clean up oh-my-fish installation script
  rm -f /tmp/omf.install.fish

  echo "✅ oh-my-fish is installed!"
else
  echo "🟡 oh-my-fish is installed."
fi

