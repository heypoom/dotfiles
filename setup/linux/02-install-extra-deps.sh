#!/usr/bin/env bash

echo "⚪️ installing additional dependencies..."

# Install Node.js for the LTS version.
echo "⚪ installing node"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo bash -

# Install Global Node Packages
echo "⚪ installing global node packages"

# Install diff-so-fancy via yarn (needed for git diff views)
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
npm i -g diff-so-fancy

# Install essential linux dependencies when CODESPACES_MODE is true.
# Do not run when in dockerized container, since that repeats the cached dependency setup.
if [[ $CODESPACES_MODE && ! $DOCKERIZED ]]
then
  echo "⚪ codespaces mode detected in non-dockerized environment. installing linux dependencies in userland."

  ./deps/install.sh
fi
