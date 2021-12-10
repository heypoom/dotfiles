#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
  echo "🌟 Installing Homebrew..."
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "✅ Homebrew installed!"
else
  echo "👍 Homebrew is already installed."
fi

