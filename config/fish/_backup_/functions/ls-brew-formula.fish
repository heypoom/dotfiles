function ls-brew-formula
	$EDITOR "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/"(exa /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula | fzf)
end
