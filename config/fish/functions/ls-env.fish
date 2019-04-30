function ls-env
	grc --colour on env | tr " " "\n" | fzf --ansi | xargs echo
end
