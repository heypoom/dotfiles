#!/usr/bin/env bash

echo "🌟 installing linux dependencies..."

function install-from-package-list() {
  packages="$(awk '! /^ *(#|$)/' $1)"

  xargs -a <(echo $packages) -r -- echo "📦 installing packages:"
  xargs -a <(echo $packages) -r -- sudo apt-get install -y
}

cd "$(dirname "$0")"

# Configure Node.js
curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Configure Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


install-from-package-list "essentials"
