" ------------ Initialize Neovim Plugins ------------

source ~/.config/nvim/basic.vim
source ~/.config/nvim/filetype.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/extended.vim

" ------------ Custom Keybindings ---------------

map <leader>m :call VimuxInterruptRunner() <bar> :call VimuxRunCommand("make")<CR>

let g:enable_bold_font = 1

map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-U>

set nostartofline

nnoremap <CR> :noh<CR><CR>

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
 
filetype plugin on
syntax enable

set encoding=utf8
set number relativenumber

set background=dark

set shiftwidth=2
set tabstop=2

" colorscheme material-theme
color dracula

set clipboard=unnamed

set mouse=a
set termguicolors

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

highlight Normal guibg=none
highlight NonText guibg=none
highlight SignColumn guibg=none
highlight FoldColumn guibg=none
highlight LineNr guibg=none
highlight EndOfBuffer guibg=none

let g:terminal_color_0  = "#313131"
let g:terminal_color_1  = "#ff6b64"
let g:terminal_color_2  = "#b6e097"
let g:terminal_color_3  = "#ffdd50"
let g:terminal_color_4  = "#4bcfff"
let g:terminal_color_5  = "#ff5c93"
let g:terminal_color_6  = "#00fdff"
let g:terminal_color_7  = "#f7f7f7"
let g:terminal_color_8  = "#708284"
let g:terminal_color_9  = "#ff5d4e"
let g:terminal_color_10 = "#b6e064"
let g:terminal_color_11 = "#ffcb43"
let g:terminal_color_12 = "#4fb6f7"
let g:terminal_color_13 = "#e23673"
let g:terminal_color_14 = "#00b9cc"
let g:terminal_color_15 = "#f7f7f7"

:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

set completeopt=longest,menuone

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <C-t> Ag()

let g:use_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key = '<Tab>'

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

