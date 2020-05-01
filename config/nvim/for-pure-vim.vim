" Enable syntax-highlighting.
syntax on

" Set the syntax highlighting and indentation for the current file type.
filetype plugin indent on

" Always auto-indent!
set autoindent

" Insert tabs on the start of a line according to shiftwidth
set smarttab

" Make backspace works like other programs
" Read more: https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

" Highlight the search
set hlsearch
set incsearch
set showcmd

" Detect when a file has changed on the disk.
set autoread

" Always use UTF-8 for the encoding.
set encoding=utf8

augroup Rc
autocmd!
augroup END

" Enable swap file.
set swapfile

" Make tilde (~) work normally
set tildeop

" Make scrolling much faster
set ttyfast

" Enable word-wrapping
set wrap
