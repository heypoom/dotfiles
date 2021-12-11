#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
  echo "🟣 installing homebrew."
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "✅ homebrew installed!"
else
  echo "🟣 homebrew is installed."
fi

