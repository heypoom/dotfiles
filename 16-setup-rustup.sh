#!/usr/bin/env bash

# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Rust Components (rls clippy rustfmt)
for component in rls clippy rustfmt
do
  rustup component add $component
done
