#!/usr/bin/env bash

if command -v starship &> /dev/null
then
  echo "🟡 starship prompt is available."
else
  echo "🟡 installing starship prompt."

	sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force

  echo "✅ starship prompt is installed."
fi

