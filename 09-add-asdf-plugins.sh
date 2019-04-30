#!/usr/bin/env bash

for plugin in bazel clojure cmake coq crystal dart dep docker-slim doctl dotty elasticsearch elixir elm erlang go gohugo gradle haskell helm helmfile idris imagemagick java julia kops kotlin kubectl link lua luajit maven minikube mongodb nim nodejs ocaml openresty php postgres protoc python r racket rancher redis ruby rust sbt scala sqlite terraform tflint vault dotnet-core
do
  echo "Adding Plugin: $plugin"
  asdf plugin-add $plugin
done

# Import Node.js team's OpenPGP keys to main keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
