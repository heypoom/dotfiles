#!/usr/bin/env sh

# Codespaces mode runs the linux dependency setup script in userland.
export CODESPACES_MODE=true

./install && exit 0

