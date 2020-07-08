#!/usr/bin/env bash

if [ -f ~/.cache/bat/themes.bin ]
then
  echo "👍 bat theme is already cached."
  exit 0
fi

bat cache --build

