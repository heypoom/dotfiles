function ls-brew
	cd (brew list --versions | fzf | tr " " "/" | xargs -I _ echo "/usr/local/Cellar/_/")
end
