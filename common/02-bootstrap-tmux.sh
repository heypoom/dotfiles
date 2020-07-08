#!/usr/bin/env bash

if [ -d "$HOME/.tmux/plugins/tpm" ]
then
  echo "👍 tmux plugin manager is already installed."
  exit 0
fi

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "✅ installed tmux plugin manager."


