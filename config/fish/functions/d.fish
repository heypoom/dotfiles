# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.AvQTlw/d.fish @ line 1
function d
	if [ $TERM = "xterm-kitty" ]
		kitty +kitten diff $argv[1] $argv[2]
	else
		nvim -d $argv[1] $argv[2]
	end
end
