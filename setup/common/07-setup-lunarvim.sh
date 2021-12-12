#!/usr/bin/env bash

if [ -d "$HOME/.local/share/lunarvim" ]
then
  echo "🟡 LunarVim is available."
  exit 0
fi

# Add asdf shims to path.
export PATH="$PATH:$HOME/.asdf/shims:$HOME/.asdf/bin"

# Fetch the LunarVim script.
curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh > /tmp/install-lunarvim.sh
chmod +x /tmp/install-lunarvim.sh

# Create installation directory.
mkdir -p ~/.config/lvim

# Install LunarVim.
# The dependencies installation depends on NodeJS, Python and Rust.
if command -v node &> /dev/null
then
	echo "🟡 installing LunarVim with dependencies."
	yes | /tmp/install-lunarvim.sh --overwrite --install-dependencies
else
	echo "🟡 installing LunarVim without dependencies."
	/tmp/install-lunarvim.sh --overwrite --no-install-dependencies
fi

# Cleanup installation script.
rm /tmp/install-lunarvim.sh

echo "✅ installed LunarVim."

