#!/usr/bin/env bash

if [ -d "$HOME/.tmux/plugins/tpm" ]
then
  echo "👍 tmux plugin manager is already installed."
  exit 0
fi

echo "🌟 installing tmux plugin manager..."

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm --quiet

echo "✅ installed tmux plugin manager!"


