#!/usr/bin/env bash
# Run linux setup scripts

export DEBIAN_FRONTEND="noninteractive"

if [ `uname` = Darwin ]
then
  echo "⚠️ Detecting macOS. Skipping linux configuration."
  exit 0
fi

echo "🍰 configuring linux installation..."

linux_scripts="$(\ls linux/*.sh)"

for script in $linux_scripts
do
  $script
done

# automatically setup common CLI environment with scripts.
./setup-common.sh
