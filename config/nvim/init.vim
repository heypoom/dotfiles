" Thanks to https://github.com/raviqqe/begin-with-init.vim :)
" Also, thanks to https://www.chrisatmachine.com/Neovim! <3

" Don't forget to `pip3 install neovim` and `gem install neovim`

" Load the neovim preferences.
source ~/.config/nvim/editor/editor-preferences.vim

" Load the plugin settings.
source ~/.config/nvim/plugin/plugin-settings.vim

" Load the plugins.
source ~/.config/nvim/plugin/plugins.vim

" Use the dracula color scheme.
if !empty(glob("~/.local/share/nvim/plugged/dracula/colors/dracula.vim"))
  color dracula
endif

" Load lightline.vim settings.
source ~/.config/nvim/plugin/lightline.vim

" Load the keymaps.
source ~/.config/nvim/keymap/keymap.vim

" Load the color scheme for the integrated nvim terminal.
source ~/.config/nvim/theme/colors.vim

" Custom commands and useful functions
source ~/.config/nvim/editor/functions.vim

" Clear default background color
highlight Normal guibg=none ctermbg=none
" highlight NonText guibg=none ctermbg=none

" Register custom syntaxes
" au! Syntax todo source ~/.config/nvim/syntax/todo.vim
" au BufNewFile,BufRead *.todo set filetype=todo

