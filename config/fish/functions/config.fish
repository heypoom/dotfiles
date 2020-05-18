# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.8K6Qbr/config.fish @ line 2
function config
	switch $argv[1]
		case yabai
			$EDITOR "$HOME/.config/yabai/yabairc"
		case skhd
			$EDITOR "$HOME/.config/skhd/skhdrc"
		case kitty
			$EDITOR "$HOME/.config/kitty/kitty.conf"
		case alacritty
			$EDITOR "$HOME/.config/alacritty/alacritty.yml"
		case git
			$EDITOR "$HOME/.gitconfig"
		case tmux
			$EDITOR "$HOME/.tmux.conf"
		case nvim
			pushd "$HOME/.config/nvim"
			$EDITOR "$HOME/.config/nvim/settings.vim"
			popd
		case widgets
			pushd "$HOME/.widgets"
			$EDITOR "$HOME/.widgets"
			popd
		case fish
			pushd "$HOME/.config/nvim"
			$EDITOR "$HOME/.config/fish"
			popd
		case alacritty
			$EDITOR "$HOME/.config/alacritty/alacritty.yml"
		case dot
		case dotfiles
			pushd "$HOME/.dotfiles"
			$EDITOR "$HOME/.dotfiles/install.conf.yaml"
			popd
		case commit
			pushd "$HOME/.dotfiles"
			git add --all
			git commit -m $argv[2]
			popd
		case push
			pushd "$HOME/.dotfiles"
			git push -u origin master
			popd
		case save
			config commit $argv[2]
			config push
		case install
			pushd "$HOME/.dotfiles"
			$HOME/.dotfiles/install
			popd
		case skhd-hotreload
			tmux new -d -s "skhd-reload" "echo $HOME/.config/skhd/skhdrc | entr skhd -r"
		case edit
			funced config
			funcsave config
		case "*"
			echo "Config" $argv[1] "not found."
	end
end
