#!/usr/bin/env bash

if [ -d ~/.terminfo/78 ]
then
  echo "👍 kitty terminfo is already configured."
  exit 0
fi

# Copy Kitty's Terminfo
mkdir -p ~/.terminfo/78/
ln -s /Applications/kitty.app/Contents/Resources/terminfo/78/ ~/.terminfo/78/

