#!/usr/bin/env bash

echo "🍰 configuring common CLI environment..."

common_scripts="$(\ls common/*.sh)"

for script in $common_scripts
do
  $script
done
