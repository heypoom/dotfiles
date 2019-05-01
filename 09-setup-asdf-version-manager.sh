#!/usr/bin/env bash

function setup_asdf {
  if ! test -e ~/.asdf
  then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1
    echo "Installed ASDF."
  else
    echo "ASDF is already installed."
  fi

  mkdir -p ~/.config/fish/completions
  cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

  if ! command -v asdf
  then
    echo "ASDF binary not found!"
    return
  fi

  for plugin in bazel clojure cmake coq crystal dart dep docker-slim doctl dotty elasticsearch elixir elm erlang go gohugo gradle haskell helm helmfile idris imagemagick java julia kops kotlin kubectl link lua luajit maven minikube mongodb nim nodejs ocaml openresty php postgres protoc python r racket rancher redis ruby rust sbt scala sqlite terraform tflint vault dotnet-core
  do
    echo "Adding Plugin: $plugin"
    asdf plugin-add $plugin
  done

  # Import Node.js team's OpenPGP keys to main keyring
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
}

setup_asdf