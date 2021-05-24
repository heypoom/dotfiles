#!/usr/bin/env bash

echo "🌟 installing linux dependencies..."

function install-from-package-list() {
  packages="$(awk '! /^ *(#|$)/' $1)" 
  xargs -a <(echo $packages) -r -- echo "📦 installing packages:"
  xargs -a <(echo $packages) -r -- sudo apt-get install -y
}

cd "$(dirname "$0")"

if [[ ! $DOCKERIZED ]]
then
  echo "📦 In non-dockerized mode, upgrading system packages."

  # Update and Upgrade Packages
  sudo apt update -y
  sudo apt upgrade -y
fi

# Install packages with apt-get
install-from-package-list "essentials"
