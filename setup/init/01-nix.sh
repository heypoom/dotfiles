#!/usr/bin/env bash

if command -v nix &> /dev/null
then
  echo "🟡 nix is installed."
  exit 0
fi

# Install Nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon
