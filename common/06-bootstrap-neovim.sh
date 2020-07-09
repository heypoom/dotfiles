#!/usr/bin/env bash

export PATH="$PATH:$HOME/.asdf/shims:$HOME/.asdf/bin"

if [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]
then
  echo "👍 vim-plug is already installed."
  exit 0
else
  echo "🌟 installing vim-plug..."

  # Initialize vim-plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  echo "✅ vim-plug is installed!"
fi

echo "🌟 installing vim-plug plugins..."

# Install the plugins
nvim --headless +PlugInstall +qa

echo "🌟 installing neovim CoC plugins..."

# Build CoC
nvim --headless "+call coc#util#build()" +qa

echo "🌟 installing neovim ruby and nodejs dependencies..."

# Install neovim dependencies
pip3 install neovim
yarn global add vim-node-rpc

