#!/usr/bin/env bash

if [ ! -d "$HOME/.local/share/omf/" ]
then
	echo "📦 Installing oh-my-fish..."

  # Install oh-my-fish
  curl -L https://get.oh-my.fish | fish
  
  # Install the missing dependencies
  omf install
  
	echo "✅ oh-my-fish is installed!"
else
  echo "👍 oh-my-fish is already installed."
fi

