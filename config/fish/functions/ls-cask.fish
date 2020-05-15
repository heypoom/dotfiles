# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.H6V6Gd/ls-cask.fish @ line 2
function ls-cask
	brew cask list --versions | fzf
end
