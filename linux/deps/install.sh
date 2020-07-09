#!/usr/bin/env bash

echo "🌟 installing linux dependencies..."

function install-from-package-list() {
  packages="$(awk '! /^ *(#|$)/' $1)"

  xargs -a <(echo $packages) -r -- echo "📦 installing packages:"
  xargs -a <(echo $packages) -r -- sudo apt-get install -y
}

cd "$(dirname "$0")"

# Install packages with apt-get
install-from-package-list "essentials"

# Configure Node.js
curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Configure Yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# Install sharkdp/bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb &> /dev/null
sudo dpkg -i bat_0.15.4_amd64.deb

# Install diff-so-fancy via yarn (needed for git diff views)
yarn global add diff-so-fancy
