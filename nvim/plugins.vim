" Initialize vim-plug

call plug#begin('~/.local/share/nvim/plugged')

" Nerdtree and Nerdcommenter
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'

" Airline (Status Line)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plugs for tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'edkolev/tmuxline.vim'

" Tpope's awesome plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'mattn/emmet-vim'
Plug 'lilydjwg/colorizer'
Plug 'Galooshi/vim-import-js'
Plug 'ElmCast/elm-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chr4/nginx.vim'
Plug 'godlygeek/tabular'
Plug 'jlanzarotta/bufexplorer'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'neovim/node-host'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/snipmate-snippets'
Plug 'shaunlebron/parinfer'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/mru.vim'
Plug 'w0rp/ale'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'amix/vim-zenroom2'
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go'
Plug 'garbas/vim-snipmate'
Plug 'git://git.wincent.com/command-t.git'
Plug 'groenewege/vim-less'
Plug 'honza/vim-snippets'
Plug 'jackiehluo/vim-material'
Plug 'jdkanani/vim-material-theme'
Plug 'kchmck/vim-coffee-script'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nvie/vim-flake8'
Plug 'plasticboy/vim-markdown'
Plug 'rakr/vim-one'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'shemerey/vim-peepopen'
Plug 'sophacles/vim-bundle-mako'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'styled-components/vim-styled-components'
Plug 'editorconfig/editorconfig-vim'
Plug 'shinokada/dragvisuals.vim'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-go'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-clang'

Plug 'SirVer/ultisnips'
Plug 'mhartington/nvim-typescript'
Plug 'mattn/emmet-vim'

" WakaTime Time Tracker
Plug 'wakatime/vim-wakatime'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

call plug#end()

" Prettier
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1

let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'javascript.jsx', 'vue']

let g:deoplete#sources#rust#racer_binary='/Users/phoomparin/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/phoomparin/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'

filetype plugin indent on

" Vim JSX
let g:jsx_ext_required = 0

" YCM
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

" Airline (themes: onedark powerlineish base16_spacemacs minimalist angr base16 luna)
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'

""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width = 100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'varcheck']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_gocode_unimported_packages = 1
let g:go_template_use_pkg = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>d :GitGutterToggle<cr>
let g:gitgutter_enabled=0

let g:polyglot_disabled = ['elm', 'javascript', 'jsx']
