#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo "⚪ installing linux dependencies..."

function install-from-package-list() {
  packages="$(awk '! /^ *(#|$)/' "$1")" 
  xargs -a <(echo "$packages") -r -- echo "⚪ installing packages:"
  xargs -a <(echo "$packages") -r -- sudo apt-get install -yq
}

cd "$(dirname "$0")" || exit

echo "⚪ adding GitHub CLI repository."

if [[ ! $DOCKERIZED ]]
then
  echo "⚪ in non-dockerized mode, upgrading system packages."

  # Update and Upgrade Packages
  sudo apt update -yq
  sudo apt upgrade -yq
fi

# Install packages with apt-get
install-from-package-list "essentials"

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update -yq
sudo apt install gh

