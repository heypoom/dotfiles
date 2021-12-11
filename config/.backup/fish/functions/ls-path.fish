# Defined in /var/folders/ld/wvhk0wnx49176rt_01d1c2rw0000gp/T//fish.iBIUnX/ls-path.fish @ line 2
function ls-path
	# | sed "s/\/Users\/$USER/~/g" |
	echo $PATH | tr " " "\n" | fzf | xargs echo
end
