#!/usr/bin/env bash

pushd setup/macos
rm Brewfile
brew bundle dump --file Brewfile
popd
