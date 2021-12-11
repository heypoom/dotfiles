#!/usr/bin/env bash

if [ -d "$HOME/.local/share/lunarvim" ]
then
  echo "🟡 LunarVim is available."
  exit 0
fi

echo "🟡 installing LunarVim (https://www.lunarvim.org)"

# Fetch the LunarVim script.
curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh > /tmp/install-lunarvim.sh
chmod +x /tmp/install-lunarvim.sh

# Install LunarVim.
/tmp/install-lunarvim.sh --install-dependencies
rm /tmp/install-lunarvim.sh

echo "✅ installed LunarVim."

