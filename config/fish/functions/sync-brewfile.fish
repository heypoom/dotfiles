# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.Osbvkt/sync-brewfile.fish @ line 1
function sync-brewfile
	pushd ~/dotfiles

	echo "ℹ updating brewfile..."
	brew bundle dump

	echo "ℹ generating sha1 checksum..."
	sha1sum Brewfile > Brewfile.sha1

	popd
end
