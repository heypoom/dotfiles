#!/usr/bin/env bash

pushd setup/macos
rm Brewfile
brew bundle dump --file Brewfile
sha1sum Brewfile > Brewfile.sha1
popd
