#!/usr/bin/env bash

echo "🍰 installing additional dependencies..."

# Install Node.js for the LTS version.
echo "🍰 installing node"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo bash -

# Install Yarn
echo "🍰 installing yarn"
curl -o- -L https://yarnpkg.com/install.sh | bash

# Install Global Node Packages
echo "🍰 installing global node packages"

# Install diff-so-fancy via yarn (needed for git diff views)
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
yarn global add diff-so-fancy

# Install essential linux dependencies when CODESPACES_MODE is true.
# Do not run when in dockerized container, since that repeats the cached dependency setup.
if [[ $CODESPACES_MODE && ! $DOCKERIZED ]]
then
  echo "🍰 codespaces mode detected in non-dockerized environment. installing linux dependencies in userland."

  ./deps/install.sh
fi

# if ! command -v brew &> /dev/null
# then
#   echo "🌟 Installing Linuxbrew (Homebrew for Linux)..."
#   yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#   echo "✅ Linuxbrew installed!"
# else
#   echo "👍 Linuxbrew is already installed."
# fi

