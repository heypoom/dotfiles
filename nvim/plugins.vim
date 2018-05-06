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
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-scriptease'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mattn/emmet-vim'
Plug 'lilydjwg/colorizer'
Plug 'Galooshi/vim-import-js'
Plug 'ElmCast/elm-vim'
Plug 'chr4/nginx.vim'
Plug 'godlygeek/tabular'
Plug 'jlanzarotta/bufexplorer'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'neovim/node-host'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/snipmate-snippets'
Plug 'shaunlebron/parinfer'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/mru.vim'
Plug 'w0rp/ale'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'amix/vim-zenroom2'
Plug 'christoomey/vim-tmux-navigator'
Plug 'digitaltoad/vim-pug'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'fidian/hexmode'
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
Plug 'mxw/vim-jsx'
Plug 'nvie/vim-flake8'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rakr/vim-one'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'sheerun/vim-polyglot'
Plug 'shemerey/vim-peepopen'
Plug 'shinokada/dragvisuals.vim'
Plug 'sophacles/vim-bundle-mako'
Plug 'styled-components/vim-styled-components'
Plug 'terryma/vim-expand-region'

Plug 'fatih/vim-go'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-clang'

Plug 'SirVer/ultisnips'
Plug 'mhartington/nvim-typescript'
Plug 'benmills/vimux'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'Yggdroot/indentLine'

" WakaTime Time Tracker
Plug 'wakatime/vim-wakatime'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'matze/vim-move'

call plug#end()

let g:move_key_modifier = 'C'

" NERDCommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Prettier
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#config_precedence = 'prefer-file'

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1

let g:deoplete#sources#go#use_cache = 1

let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'javascript.jsx', 'vue']

let g:deoplete#sources#rust#racer_binary='/Users/phoomparin/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/phoomparin/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'

filetype plugin indent on

" Close Tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Vim JSX
let g:jsx_ext_required = 0

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
let g:ctrlp_user_command = ['.git', 'cd %s && rg --files-with-matches ".*"', 'find %s -type f']


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

" Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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
