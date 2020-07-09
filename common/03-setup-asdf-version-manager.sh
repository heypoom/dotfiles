#!/usr/bin/env bash

setup_asdf() {
  if ! test -e ~/.asdf
  then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1
  else
    echo "asdf is already installed!"
  fi

  mkdir -p ~/.config/fish/completions
  cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

  if ! command -v asdf
  then
    echo "asdf binary is not found."
    return
  fi

  for plugin in haskell java kotlin nodejs php python racket ruby rust sbt scala sqlite terraform tflint vault dotnet-core
  do
    echo "Adding Plugin: $plugin"
    asdf plugin-add $plugin
  done

  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
}

if command -v asdf &> /dev/null
then
  echo "👍 asdf is already installed."
else
  echo "🌟 Installing asdf package manager..."
  setup_asdf
  echo "✅ installed asdf!"
fi

