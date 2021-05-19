" Huge thanks to https://www.chrisatmachine.com/Neovim and https://github.com/raviqqe/begin-with-init.vim <3
" YouTube Playlist Reference: https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg

" Dependencies: Don't forget to `pip3 install neovim` and `gem install neovim` and `yarn global add neovim`

" Load the paths.
source ~/.config/nvim/editor/paths.vim

" Load the neovim preferences.
source ~/.config/nvim/editor/editor-preferences.vim

" Load the plugin settings.
source ~/.config/nvim/plugin/plugin-settings.vim
source ~/.config/nvim/plugin/lightline.vim
source ~/.config/nvim/plugin/rnvimr.vim
source ~/.config/nvim/plugin/fzf.vim
source ~/.config/nvim/plugin/start-screen.vim

" Load the plugins.
source ~/.config/nvim/plugin/plugins.vim

" Use the dracula color scheme.
if !empty(glob("~/.local/share/nvim/plugged/dracula/colors/dracula.vim"))
  color dracula
endif

" Load custom commands.
source ~/.config/nvim/commands/lightline.vim
source ~/.config/nvim/commands/coc.vim
source ~/.config/nvim/commands/fzf.vim

" Load the keymaps.
source ~/.config/nvim/keymap/keymap.vim
source ~/.config/nvim/keymap/coc.vim
source ~/.config/nvim/keymap/fzf.vim
source ~/.config/nvim/keymap/which-key.vim

" Load the color scheme for the integrated nvim terminal.
source ~/.config/nvim/theme/colors.vim

" Load lua configurations
luafile ~/.config/nvim/lua/plug-colorizer.lua

" Clear default background color
highlight Normal guibg=none ctermbg=none
" highlight NonText guibg=none ctermbg=none

