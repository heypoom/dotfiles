#!/usr/bin/env bash

if [ ! -d "$HOME/.local/share/omf/" ]
then
	echo "📦 Installing oh-my-fish..."

  mkdir -p "$HOME/.local/share"

  # Install oh-my-fish
  curl -s -L https://get.oh-my.fish > omf.install.fish
  chmod +x omf.install.fish
  fish omf.install.fish --noninteractive --yes
  
	echo "✅ oh-my-fish is installed!"
else
  echo "👍 oh-my-fish is already installed."
fi

