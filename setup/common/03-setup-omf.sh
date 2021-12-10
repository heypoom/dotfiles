#!/usr/bin/env bash

if [ `uname` != Darwin ]
then
  cp ~/.config/fish/fish_variables.linux ~/.config/fish/fish_variables
fi

if [ ! -d "$HOME/.local/share/omf/" ]
then
  echo "🌟 Installing oh-my-fish..."

  mkdir -p "$HOME/.local/share"

  # Install oh-my-fish
  curl -s -L https://get.oh-my.fish > omf.install.fish
  fish omf.install.fish --noninteractive --yes &> /dev/null

  # Clean up oh-my-fish installation script
  rm -f omf.install.fish

  echo "✅ oh-my-fish is installed!"
else
  echo "🟡 oh-my-fish is installed."
fi

