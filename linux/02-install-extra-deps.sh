#!/usr/bin/env bash

echo "🍰 installing additional dependencies..."

# Install Node.js
echo "ℹ️ installing node.js"
curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Install Yarn
echo "ℹ️ installing yarn"
curl -o- -L https://yarnpkg.com/install.sh | bash

# Install sharkdp/bat
echo "ℹ️ installing sharkdp/bat"
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb &> /dev/null
sudo dpkg -i bat_0.15.4_amd64.deb

# Install diff-so-fancy via yarn (needed for git diff views)
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
yarn global add diff-so-fancy

# if ! command -v brew &> /dev/null
# then
#   echo "🌟 Installing Linuxbrew (Homebrew for Linux)..."
#   yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#   echo "✅ Linuxbrew installed!"
# else
#   echo "👍 Linuxbrew is already installed."
# fi
