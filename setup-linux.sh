#!/usr/bin/env bash
# Run linux setup scripts

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

common_scripts="$(\ls common/*.sh)"

for script in $common_scripts
do
  $script
done
