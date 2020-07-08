#!/usr/bin/env bash

if [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]
then
  echo "👍 vim-plug is already installed."
  exit 0
fi

# Initialize vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the plugins
nvim --headless +PlugInstall +qa

# Build CoC
nvim --headless "+call coc#util#build()" +qa

# Install neovim dependencies
pip3 install neovim
yarn global add vim-node-rpc

