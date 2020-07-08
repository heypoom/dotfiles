#!/usr/bin/env bash

FISH_PATH="/usr/local/bin/fish"

function append_fish_to_shell_list() {
  if grep -qi $FISH_PATH /etc/shells
  then
    echo "Fish is already in /etc/shells."
  else
    echo $FISH_PATH | sudo tee -a /etc/shells
  fi
}

function use_fish_as_default_shell() {
  append_fish_to_shell_list
  
  echo "Setting $FISH_PATH as default shell."
  
  chsh -s $FISH_PATH
}

use_fish_as_default_shell
