#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ "$USE_MODULAR_BREWFILE" = true ]
then
  source ../utils/install-brewfile.sh

  sudo chown -R $(whoami) /usr/local/share/man/man8

  install-brewfile "Browsers" "/Applications/Google Chrome.app"
  install-brewfile "Terminals" "/Applications/Kitty.app"
  install-brewfile "Essentials" "/Applications/Keybase.app"
  install-brewfile "Development" "/Applications/Docker.app"
  install-brewfile "Productivity" "/Applications/Alfred 4.app"
  install-brewfile "Fonts" "$HOME/Library/Fonts/JetBrainsMono-Regular.ttf"

  install-brewfile-cli "Essentials" "exa"
  install-brewfile-cli "Extras" "tcpdump"
  
  exit 0
fi

echo "📦 Installing from brewfile..."
brew bundle --global
echo "✅ Installed brewfile!"

