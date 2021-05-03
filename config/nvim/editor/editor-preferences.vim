" Thanks to https://www.chrisatmachine.com/Neovim/02-vim-general-settings!

" Enable the use of bold fonts in dracula.
let g:enable_bold_font = 1

" Disable Netrw
" let g:loaded_netrwPlugin = 0
" let g:netrw_banner = 0

" Make the editor background transparent.
hi! Normal ctermbg=NONE guibg=NONE

" Enable 256 colors in non-gui mode.
if !has('gui_running')
  set t_Co=256
endif

" Enables syntax highlighting
syntax enable

" Set the shell to use in !command and nvim integrated terminal.
set shell=/bin/sh

" Enable GUI colors in terminal
set termguicolors

" If there are multiple buffers, hide the buffers instead of closing them.
set hidden

" Display long lines as one line.
set nowrap

" Use UTF-8 encoding in display.
set encoding=utf-8

" Use UTF-8 encoding in saved files.
set fileencoding=utf-8

" Makes popup smaller.
set pumheight=10

" Always show cursor position.
set ruler

" Set command line height to 2 to avoid annoying "enter to continue" messages.
set cmdheight=2

" Treat dash-separated words as a word text object.
set iskeyword+=-

" Enable mouse control.
set mouse=a

" Make the new window appear below.
set splitbelow

" Make the new window appear on the right.
set splitright

" Makes it possible to see code blocks in markdown files
set conceallevel=0

" A tab is two spaces.
set tabstop=2

" Use two spaces for indentation.
set shiftwidth=2

" Makes tabbing smarter :)
set smarttab

" Convert tabs to spaces.
set expandtab

" Reacts to the syntax of the code you are editing (e.g. C)
set smartindent

" Auto-indents your code.
set autoindent

" Always display the last status line.
set laststatus=2

" Enable line numbers.
set number

" Highlight the current line.
set cursorline

" Specify the background color for the editor.
set background=dark

" Always show tab lines.
set showtabline=2

" We already have airline to show current mode in the status line.
set noshowmode

" Disable swap and backup files.
set nobackup
set noswapfile
set nowritebackup

" Enable faster completion timeout
set updatetime=300

" Shorten the timeout duration to 500ms
set timeoutlen=500

" Stop newline continuation of comments.
set formatoptions-=cro

" Copy-paste between vim and other applications.
set clipboard=unnamedplus

" Automatically change working directory. 
" set autochdir

" Line numbers are relative to your cursor.
" Indicates the distance to use in hjkl{number}
set relativenumber

"" Show the result of your substitution as you type!
" :%s/a/b/g will highlight and preview the replaced text.
" Use tab or esc to ignore, use enter to accept substitution.
" (Change this to `split` to show extra preview pane.)
set inccommand=nosplit

" Persist undo history across sessions.
set undofile
set undodir=~/.vim/undo

" Make vim completion menu works like an IDE.
" Read more: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=menu

" Use abbreviations and disable intro messages
" Read more at :help shortmess
set shortmess=aIsA

" Enable vim command completion
set wildmode=full

" Do not redraw while executing macros to improve performance.
set lazyredraw

" Enable extended regular expressions.
set magic

" Use multiple of shiftwidth when indenting with < and >
set shiftround

" Merge signcolumn and number column
set signcolumn=number

" Automatically reload configuration when writing to init.vim.
au! BufWritePost $MYVIMRC source %

" Escalate permissions when saving with w!!
cmap w!! w !sudo tee %

