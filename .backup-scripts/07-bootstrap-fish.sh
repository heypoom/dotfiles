#!/usr/bin/env bash

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish

# Install the missing dependencies
omf install

# Switch to bobthefish theme
omf theme bobthefish
