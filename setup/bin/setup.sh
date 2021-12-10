#!/usr/bin/env bash

echo "🍰 bootstrapping system environment setup..."

if [ `uname` == Darwin ]
then
  export USE_MODULAR_BREWFILE=true

  ./setup-macos.sh
else
  ./setup-linux.sh
fi
