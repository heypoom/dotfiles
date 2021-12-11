#!/usr/bin/env bash

if [ ! -f "$HOME/.config/fish/functions/fisher.fish" ]
then
  echo "🟡 installing fisher"

  # Install fisher package manager.
	# https://github.com/jorgebucaran/fisher
	fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

  echo "✅ fisher is installed!"
else
  echo "🟡 fisher is available."
fi

