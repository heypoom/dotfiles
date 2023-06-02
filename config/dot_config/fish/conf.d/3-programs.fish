# RTX, the asdf-like package manager written in Rust
if type -q rtx
	rtx activate fish | source
end

# Starship, the cross-shell prompt written in Rust
if type -q starship
	starship init fish | source
end