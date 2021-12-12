#!/usr/bin/env fish

if test -e "$HOME/.config/fish/functions/fisher.fish"
  echo "🔵 fisher is available."
else
  echo "🔵 installing fisher"

  # Install fisher package manager.
	# https://github.com/jorgebucaran/fisher
  curl -sL https://git.io/fisher | source
	fisher update

  echo "✅ fisher is installed!"
end

