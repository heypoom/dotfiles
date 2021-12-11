#!/usr/bin/env bash

YELLOW="\e[93m"
RESET="\e[0m"

# HACK: add asdf to PATH!
export PATH="$PATH:$HOME/.asdf/bin"

if ! command -v asdf &> /dev/null
then
  echo "🔴 asdf not found!"
  exit 0
fi

if command -v node &> /dev/null
then
  echo "🟡 node is installed."
  exit 0
fi

if [ `uname` == Darwin ]
then
  export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
fi

echo -e "$YELLOW🟡 installing asdf modules. this will take a while!$RESET"
asdf install

echo "✅ asdf modules are installed!"

# Import Node.js team's OpenPGP keys to the main keyring.
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

