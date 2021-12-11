#!/usr/bin/env bash

# Install essential linux dependencies when CODESPACES_MODE is true.
# Do not run when in dockerized container, since that repeats the cached dependency setup.
if [[ $CODESPACES_MODE && ! $DOCKERIZED ]]
then
  echo "⚪ codespaces mode detected in non-dockerized environment. installing linux dependencies in userland."

  ./deps/install.sh
fi
