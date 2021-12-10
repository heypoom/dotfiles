#!/usr/bin/env bash

echo "ℹ️ current user home is at $HOME."

if [[ $DOCKERIZED = true ]]
then
  echo "ℹ️ dockerized environment detected."

  echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
  echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
  echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf

  sudo locale-gen en_US.UTF-8
fi
