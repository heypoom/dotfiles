#!/usr/bin/env bash

# Initialize vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the plugins
nvim --headless +PlugInstall +qa

# Build CoC
nvim --headless "+call coc#util#build()" +qa

# Install neovim dependencies
pip3 install neovim
yarn global add vim-node-rpc
