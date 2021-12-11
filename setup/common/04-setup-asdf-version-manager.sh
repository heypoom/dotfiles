#!/usr/bin/env bash

YELLOW="\e[93m"
RESET="\e[0m"

setup_asdf() {
  if ! test -e ~/.asdf
  then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8 --quiet &> /dev/null
  else
    echo "asdf is already installed!"
  fi

  mkdir -p ~/.config/fish/completions
  cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

  # HACK: add asdf to PATH!
  export PATH="$PATH:$HOME/.asdf/bin"

  if ! command -v asdf
  then
    echo "asdf binary is not found."
    return
  fi

  echo "🟡 Updating asdf to latest stable version..."

  # Update asdf to the latest stable version.
  asdf update

  for plugin in java nodejs python ruby
  do
    echo -e "$YELLOW🟡 adding $plugin plugin$RESET"
    asdf plugin add $plugin
  done

	echo -e "$YELLOW🟡 adding golang plugin$RESET"
  asdf plugin add golang https://github.com/kennyp/asdf-golang.git
}

if command -v asdf &> /dev/null
then
  echo "🟡 asdf is installed."
else
  echo "🟡 Installing asdf package manager..."
  setup_asdf
  echo "✅ installed asdf!"
fi

