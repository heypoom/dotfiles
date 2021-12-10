#!/usr/bin/env bash

echo "Installing Chezmoi"
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply heypoom

echo "Done!"

