#!/usr/bin/env bash

if ! command -v nix &> /dev/null
then
  echo "🔴 nix is not installed!"
  exit 1
fi

# Setup nix-darwin
echo "🟡 preparing to setup nix-darwin"
nix run nix-darwin -- switch --flake ~/.config/nix
echo "🟢 nix-darwin is ready"

# Activate nix configuration after nix-darwin is configured
pushd ~/.config/nix
echo "🟡 preparing to setup home-manager"
nix run .#activate
popd

echo "🟢 home-manager is ready"