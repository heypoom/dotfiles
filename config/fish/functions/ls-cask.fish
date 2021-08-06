# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.MmZNqy/ls-cask.fish @ line 2
function ls-cask
	brew list --cask --versions | fzf
end
