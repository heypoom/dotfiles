#!/usr/bin/env bash

if command -v rustup &> /dev/null
then
  echo "🟡 rustup is installed."
  exit 0
fi

# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/install-rustup.sh
chmod +x /tmp/install-rustup.sh
/tmp/install-rustup.sh -y

# Configure the rustup command.
source "$HOME/.cargo/env"

# Install Rust components.
for component in rls clippy rustfmt
do
  rustup component add $component
done
