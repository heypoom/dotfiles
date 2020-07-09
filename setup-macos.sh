#!/usr/bin/env bash
# Run macOS setup scripts

if [ ! `uname` = Darwin ]
then
  echo "⚠️ Skipping macOS-specific configuration."
  exit 0
fi

echo "🍰 configuring macOS installation..."

macos_scripts="$(\ls macos/*.sh)"

for script in $macos_scripts
do
  $script
done

# automatically setup common CLI environment with scripts.
./setup-common.sh
