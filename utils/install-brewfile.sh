#!/usr/bin/env bash

install-brewfile() {
  if [ -e "$2" ]
  then
    echo "👍 $1 are already installed."
  else
    echo "📦 Installing $1..."
    brew bundle --file "deps/$1"
    echo "✅ Installed $1!"
  fi
}

install-brewfile-cli() {
  if command -v "$2" &> /dev/null
  then
    echo "👍 CLI $1 are already installed."
  else
    echo "📦 Installing CLI $1..."
    brew bundle --file "cli-deps/$1"
    echo "✅ Installed CLI $1!"
  fi
}

