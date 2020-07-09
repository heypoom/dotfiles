# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.3rZRUs/sync-brewfile.fish @ line 2
function sync-brewfile
	pushd ~/dotfiles

	echo "ℹ updating brewfile..."
	rm Brewfile
	brew bundle dump

	echo "ℹ generating sha1 checksum..."
	sha1sum Brewfile > Brewfile.sha1

	popd
end
