#!/usr/bin/env bash

echo "Installing LunarVim (https://www.lunarvim.org)"

curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | tee -a install-lunarvim.sh
chmod +x install-lunarvim.sh

./install-lunarvim.sh --no-install-dependencies

