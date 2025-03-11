abbr -a zz "zellij"
abbr -a zzn "zellij -s"
abbr -a zza "zellij attach"
abbr -a zj zellij
abbr -a zjn "zellij -s"
abbr -a zja "zellij attach"

abbr -a claude "env SHELL=bash claude"

abbr -a dev "yarn dev"
abbr -a scr "scripts"
abbr -a sb "yarn storybook"

abbr -a raya "env TERM=xterm-256color ssh raya"

abbr -a edit-abbr "chezmoi edit --apply ~/.config/fish/conf.d/2-abbreviations.fish"
abbr -a edit-zj "chezmoi edit --apply ~/.config/zellij/config.kdl"
abbr -a edit-ghostty "chezmoi edit --apply ~/.config/ghostty/config"
abbr -a edit-kitty "chezmoi edit --apply ~/.config/kitty/kitty.conf"
abbr -a edit-aero "chezmoi edit --apply ~/.config/aerospace/aerospace.toml"

abbr -a v nvim
abbr -a vi nvim
abbr -a lv nvim
abbr -a vich 'chezmoi edit --apply'
abbr -a nv 'env NVIM_APPNAME=nvchad nvim'
abbr -a nvchad 'env NVIM_APPNAME=nvchad nvim'
abbr -a nvim-base 'nvim'
abbr -a nvim-chad 'env NVIM_APPNAME=nvchad nvim'
abbr -a lazyvim 'env NVIM_APPNAME=lazyvim nvim'
abbr -a nvim-lazy 'env NVIM_APPNAME=lazyvim nvim'
abbr -a nvim-astro 'env NVIM_APPNAME=astro nvim'
abbr -a nvim-kick 'env NVIM_APPNAME=kickstart nvim'
abbr -a nvim-lunar 'lvim'
abbr -a ls eza
abbr -a ch chezmoi
abbr -a chez chezmoi
abbr -a chcd 'chezmoi cd'
abbr -a ched 'chezmoi edit --apply'
abbr -a tree 'eza --tree'
abbr -a grv 'gh repo view -w'
abbr -a ta 'tmux attach'
abbr -a l eza
abbr -a deps 'jq .dependencies package.json'
abbr -a tns 'tmux new -s'
abbr -a devdeps 'jq .devDependencies package.json'
abbr -a o chatgpt

abbr -a brewi 'brew install'
abbr -a gpv 'gh pr view -w'
abbr -a vim lvim
abbr -a gaa 'git add --all'
abbr -a caski 'brew install --cask'
abbr -a g git
abbr -a gfo 'git fetch origin'
abbr -a gl 'git pull'
abbr -a gp 'git push'
abbr -a gc 'git commit'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gdh 'git diff HEAD'
abbr -a gst 'git stash'
abbr -a gstp 'git stash pop'
abbr -a scripts 'jq .scripts package.json'
abbr -a staging 'git fetch origin staging && git merge origin/staging'

# Neovim Codi abbreviations (live playground)
abbr -a crb 'lvim "+Codi ruby"'
abbr -a cjs 'lvim "+Codi javascript"'
abbr -a cts 'lvim "+Codi typescript"'
abbr -a cclj 'lvim "+Codi clojure"'
abbr -a cpy 'lvim "+Codi python"'
abbr -a clua 'lvim "+Codi lua"'
abbr -a cex 'lvim "+Codi elixir"'
abbr -a cjl 'lvim "+Codi julia"'
abbr -a chs 'lvim "+Codi haskell"'
abbr -a cmath 'lvim "+Codi mathjs"'

# emacs new frame
abbr -a emacsf "emacsclient --no-wait --create-frame"

