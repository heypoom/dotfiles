# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.U3Q0G6/killall-vscode.fish @ line 1
function killall-vscode
	ps aux | ag 'Visual Studio Code' | awk '{print $2}' | xargs kill -9
end
