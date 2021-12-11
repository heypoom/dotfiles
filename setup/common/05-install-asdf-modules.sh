#!/usr/bin/env bash

YELLOW="\e[93m"
RESET="\e[0m"

# HACK: add asdf to PATH.
export PATH="$PATH:$HOME/.asdf/bin"

# Skip if the asdf command is missing.
if ! command -v asdf &> /dev/null
then
  echo "🔴 asdf not found!"
  exit 0
fi

# Skip if node is already installed.
if command -v node &> /dev/null
then
  echo "🟡 node is installed."
  exit 0
fi

# Export SDKROOT for macOS installations.
if [ "$(uname)" == Darwin ]
then
	SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
  export SDKROOT
fi

# Install the required modules.
# Ruby and Java takes time to install, so we can skip those.
for plugin in nodejs python yarn golang
do
	echo -e "$YELLOW🟡 installing $plugin.$RESET"
	asdf install $plugin
done

echo "✅ asdf modules are installed."

# Import Node.js team's OpenPGP keys to the main keyring.
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

