# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.xgyUQh/config.fish @ line 2
function config
	function config_edit_file
		$EDITOR "$HOME/"$argv[1]
	end

	function config_edit_as_json
		nvim -c 'set ft=json' "$HOME/"$argv[1]
	end

	function config_edit
		config_edit_file ".config/"$argv[1]
	end

	function config_edit_cd
		set confDir $argv[1]
		set confFile $argv[2]

		pushd "$HOME/$confDir"
		config_edit_file "$confDir"/"$confFile"
		popd
	end

	function config_edit_cd_without_pop
		set confDir $argv[1]
		set confFile $argv[2]

		pushd "$HOME/$confDir"
		config_edit_file "$confDir"/"$confFile"
	end

	switch $argv[1]
		case yabai
			config_edit yabai/yabairc
			$HOME/.config/yabai/yabairc
		case skhd
			config_edit skhd/skhdrc
			skhd -r
		case kitty
			config_edit kitty/kitty.conf
		case alacritty
			config_edit alacritty/alacritty.yml
		case phoenix
			config_edit_cd_without_pop .config/phoenix src/phoenix.ts
			yarn build &
			popd
		case phoenix-reload
			pushd ~/.config/phoenix
			yarn build &
			popd
		case nvim
			config_edit_cd .config/nvim init.vim
		case nvim-keymap
			config_edit_cd .config/nvim/editor keymap.vim
		case nvim-settings
			config_edit_cd .config/nvim/plugin plugin-settings.vim
		case nvim-prefs
			config_edit_cd .config/nvim/editor editor-preferences.vim
		case nvim-plugins
			config_edit_cd .config/nvim/plugin plugins.vim
		case nvim-coc
			config_edit_cd .config/nvim coc-settings.json
		case nvim-colors
			config_edit_cd .config/nvim/theme colors.vim
		case ranger
			config_edit_cd .config/ranger rc.conf
		case widgets
			config_edit_cd .widgets Hello.jsx
		case fish
			config_edit_cd .config/fish conf.d/1-environment.fish
		case path
			config_edit_cd .config/fish/conf.d 1-environment.fish
		case dot
			config_edit_cd dotfiles install.conf.yaml
		case git
			config_edit_file .gitconfig
		case ipython
			config_edit_file .ipython/profile_default/ipython_config.py
		case tmux
			config_edit_file .tmux.conf
		case obsidian
			config_edit_as_json Dropbox/Notes/.obsidian/config
		case obsidian-css
			config_edit_file Dropbox/Notes/obsidian.css
		case starship
			config_edit starship.toml
		case karabiner
			config_edit_file .config/karabiner.edn
			goku
			launchctl stop org.pqrs.karabiner.karabiner_console_user_server
			launchctl start org.pqrs.karabiner.karabiner_console_user_server
		case commit
			pushd "$HOME/dotfiles"
			git add --all
			git commit -m $argv[2]
			popd
		case push
			pushd "$HOME/dotfiles"
			git push -u origin master
			popd
		case sync
			pushd "$HOME/dotfiles"
			git add --all
			git commit -m "chore: synchronizing dotfiles"
			git push
			popd
		case save
			config commit $argv[2]
			config push
		case install
			pushd "$HOME/dotfiles"
			$HOME/dotfiles/install
			popd
		case link
			pushd "$HOME/dotfiles"
			$HOME/dotfiles/install
			popd
		case skhd-hotreload
			tmux new -d -s "skhd-reload" "echo $HOME/.config/skhd/skhdrc | entr skhd -r"
		case edit
			funced config
			funcsave config
		case config
			funced config
			funcsave config
		case self
			funced config
			funcsave config
		case status
			pushd "$HOME/dotfiles"
			git status
			popd
		case diff
			pushd "$HOME/dotfiles"
			git add --all
			git diff HEAD
			popd
		case reset
			pushd "$HOME/dotfiles"
			git reset --hard HEAD
			popd
		case "*"
			echo "Config" $argv[1] "not found."
	end
end
