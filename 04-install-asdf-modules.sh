#!/usr/bin/env bash

function install_module {
  asdf install $1 $2
  asdf global $1 $2
}

# Install asdf dependencies
install_module nodejs "10.15.3"
install_module ruby "2.6.3"
install_module java "oracle-8.141"

# Import Node.js team's OpenPGP keys to main keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring