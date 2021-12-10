#!/usr/bin/env bash

if [ -f ~/.cache/bat/themes.bin ]
then
  echo "👍 bat theme is already cached."
  exit 0
fi

if command -v bat &> /dev/null
then
  bat cache --build

  echo "✅ bat theme cache is built!"
fi
