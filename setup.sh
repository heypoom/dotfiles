#!/usr/bin/env bash

echo "🍰 bootstrapping system environment setup..."

if [ `uname` == Darwin ]
then
  ./setup-macos.sh
else
  ./setup-linux.sh
fi
