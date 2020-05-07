#!/usr/bin/env bash

source "utilities.sh"

# Copy Kitty's Terminfo
mkdir -p ~/.terminfo
ln -s /Applications/kitty.app/Contents/Resources/terminfo/78/ ~/.terminfo/78/
