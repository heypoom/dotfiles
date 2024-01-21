# MISE, the asdf-like package manager written in Rust
# This is done manually as MISE_FISH_AUTO_ACTIVATE results in race conditions.
if type -q mise
	# rtx activate fish | source
end

# Starship, the cross-shell prompt written in Rust
# Using Tide for now, as Starship does not support asynchronous prompt.
# This is needed for large git repos.
if type -q starship
  # starship init fish | source
end
