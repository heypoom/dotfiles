#!/usr/bin/env bash

THEME_DIR="$(bat --config-dir)/themes"

mkdir -p $THEME_DIR

pushd $THEME_DIR

git clone https://github.com/dracula/sublime.git "Dracula"

bat cache --build

popd
