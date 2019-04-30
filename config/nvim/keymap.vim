" Space becomes your <Leader> key!
" It is much easier to push now~
let g:mapleader = "\<space>"

" control + s = reload configuration
nnoremap <leader>s :so $MYVIMRC<cr>

" escape + escape = un-highlight search highlights.
nnoremap <esc><esc> :nohlsearch<cr>

" Y = yank line
nnoremap Y y$

" Enable going up and down on wrapped lines.
" This makes navigating long lines (e.g. minified code) much easier.
" Read more: http://tilvim.com/2013/05/16/visual-lines.html
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap gj j
nnoremap gk k

"" Fzf key bindings
"" Read more: https://github.com/junegunn/fzf.vim

" space + f = search files in current directory (like :FZF)
nnoremap <leader>f :Files<cr>

" space + r = search through file with ripgrep
nnoremap <leader>r :Rg<cr>

" space + m = view all keymappings
nnoremap <leader>m :Maps<cr>

" space + l = jump to other lines in the file
nnoremap <leader>l :Lines<cr>

" space + h = open the files you have recently viewed
nnoremap <leader>h :History<cr>

" space + c = search through previously executed vim commands~!
nnoremap <leader>c :History:<cr>

" space + b = switch between open buffers~
nnoremap <leader>b :Buffers<cr>

"" Move

" Use alt as the move key modifier.
" The control key conflicts with tmux seamless pane switch.
" let g:move_key_modifier = 'A'

"" Multiple Cursors

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"" Ranger

" space + control + r = open ranger file manager
nnoremap <leader><C-r> :Ranger<cr>

"" Tig

" control + g = open tig (text-mode interface for git)
nnoremap <C-g> :Tig<Cr>

"" Deoplete auto-completion

" When auto-completing: tab = control + n
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" When auto-completing: shift + tab = control + p
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"" NERDTree

" space + nn = toggle nerdtree
map <leader>nn :NERDTreeToggle<cr>

" space + nn = open nerdtree from bookmark
map <leader>nb :NERDTreeFromBookmark<Space>

" space + nf = find via nerdtree
map <leader>nf :NERDTreeFind<cr>

"" UltiSnips Snippets

" tab = expand snippets
let g:UltiSnipsExpandTrigger="<tab>"

" control + b = jump forward
let g:UltiSnipsJumpForwardTrigger="<c-b>"

" control + z = jump backward
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" Goyo distraction-free writing

" space + z = toggle distraction-free writing mode
nnoremap <silent> <leader>z :Goyo<cr>

map <leader>m :call VimuxInterruptRunner() <bar> :call VimuxRunCommand("make")<CR>

"" Emmet

" tab = expand emmet abbreviation
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
