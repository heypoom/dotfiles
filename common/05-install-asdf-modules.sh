#!/usr/bin/env bash

if ! command -v asdf &> /dev/null
then
  echo "🔴 asdf not found!"
  exit 0
fi

if command -v node &> /dev/null
then
  echo "👍 node is already installed."
  exit 0
fi

export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

asdf install

# Import Node.js team's OpenPGP keys to main keyring
# bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

