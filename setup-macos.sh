# Run macOS setup scripts

if [ ! `uname` = Darwin ]
then
  echo "⚠️  Skipping macOS-specific configuration."
  exit 0
fi

macos_scripts="$(\ls macos/*.sh)"

for script in $macos_scripts
do
  $script
done

common_scripts="$(\ls common/*.sh)"

for script in $common_scripts
do
  $script
done
