# RTX, the asdf-like package manager written in Rust
if type -q rtx
	rtx activate fish | source
end

# Starship, the cross-shell prompt written in Rust
# Using Tide for now, as Starship does not support asynchronous prompt.
# This is needed for large git repos.
if type -q starship
  # starship init fish | source
end
