#!/usr/bin/env bash

BOLD="$(tput bold)"
RESET="\e[0m"
GREEN="$BOLD\e[32m"
BLUE="$BOLD\e[34m"

scripts="$(\ls *.sh | grep "^\d")"

echo "> Initializing..."
echo

for script in $scripts
do
  echo -e "$BLUE--- Executing $script ---$RESET"
  echo

  source $script

  echo
  echo -e "$GREEN--- Finished executing $script ---$RESET"
  echo
done