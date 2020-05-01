" Enable the use of bold fonts in dracula.
let g:enable_bold_font = 1

" Disable python host checks
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" Disable Netrw
let g:loaded_netrwPlugin = 1
let g:netrw_banner = 0

" Make the editor background transparent.
hi! Normal ctermbg=NONE guibg=NONE

" Set the shell to use in !command and nvim integrated terminal.
set shell=/bin/sh

" Enable GUI colors in terminal
set termguicolors

" Line numbers are relative to your cursor.
" Indicates the distance to use in hjkl{number}
set relativenumber

" Yank will copy into the global clipboard!
set clipboard=unnamed

" Allow the use of mouse!
set mouse=a

" We already have airline to show current mode in the status line.
set noshowmode

"" Show the result of your substitution as you type!
" :%s/a/b/g will highlight and preview the replaced text.
" Use tab or esc to ignore, use enter to accept substitution.
" (Change this to `split` to show extra preview pane.)
set inccommand=nosplit

" Persist undo history across sessions.
set undofile
set undodir=~/.vim/undo

" Disable swap and backup files.
set nobackup
set noswapfile

" Make vim completion menu works like an IDE.
" Read more: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=menu

" Highlight the current line.
set cursorline

" Use abbreviations and disable intro messages
" Read more at :help shortmess
set shortmess=aI

" Make the new window appear below.
set splitbelow

" Make the new window appear on the right.
set splitright

" Enable vim command completion
set wildmode=full

" Do not redraw while executing macros to improve performance.
set lazyredraw

" Hide the buffers instead of closing them.
set hidden

" Enable extended regular expressions.
set magic

"" Whitespace settings

" A tab is two spaces.
set tabstop=2

" Use two spaces for auto-indenting.
set shiftwidth=2

" Displays invisible whitespaces as a character.
" set list

" Use multiple of shiftwidth when indenting with < and >
set shiftround

" Reacts to the syntax of the code you are editing (e.g. C)
set smartindent
