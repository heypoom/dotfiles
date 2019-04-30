#!/usr/bin/env bash

# Initialize vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Please do :PlugInstall in order to install the plugins."