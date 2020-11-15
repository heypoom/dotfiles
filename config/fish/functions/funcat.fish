# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.zyi6i4/funcat.fish @ line 2
function funcat
	set -lx VISUAL cat

	echo "funced" $argv[1]
	funced $argv[1]
end
