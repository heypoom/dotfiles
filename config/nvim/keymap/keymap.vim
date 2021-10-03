" Keymappings for all Neovi> actions!
" Thanks to https://www.chrisatmachine.com/Neovim/02-vim-general-settings!  Space becomes your <Leader> key!
" It is much easier to push now, yay!
let g:mapleader = "\<space>"
let g:maplocalleader = ","

" space = trigger vim-which-key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" space + . + r = reload configuration
nnoremap <leader>.r :so $MYVIMRC<cr>

" escape + escape = un-highlight search highlights.
nnoremap <esc><esc> :nohlsearch<cr>

" Y = yank line
nnoremap Y y$

" Resize windows.
nnoremap <leader>wh :vertical resize -2<cr>
nnoremap <leader>wj :resize -2<cr>
nnoremap <leader>wk :resize +2<cr>
nnoremap <leader>wl :vertical resize +2<cr>

" Capitalize words with CTRL + U
inoremap <C-u> <esc>viwUI
nnoremap <C-u> viwU<esc>

" Tab to move to next buffer, SHIFT + Tab to go back.
nnoremap <TAB> :bnext<cr>
nnoremap <S-TAB> :bprevious<cr>

" Save with CTRL + S
nnoremap <C-s> :w<cr>

" Quit with CTRL + Q
nnoremap <C-Q> :wq!<cr>

" Escape with CTRL + C
nnoremap <C-c> <esc>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Better tab auto-completion
" function OnTab()
"   try
"     return emmet#expandAbbrIntelligent("\<tab>")
"   catch
"     return pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
"   endtry
" endfunction

" Tab to expand emmet and auto-complete.
" imap <expr><TAB> OnTab()

" Better tab!
vnoremap < <gv
vnoremap > >ge

" Better window navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enable going up and down on wrapped lines.
" This makes navigating long lines (e.g. minified code) much easier.
" Read more: http://tilvim.com/2013/05/16/visual-lines.html
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap gj j
nnoremap gk k

" space + r = open ranger file manager
nnoremap <leader>r :RnvimrToggle<cr>
nnoremap <leader>.rr :RnvimrResize<cr>

" Use C-k and C-j to move text up and down
" The control key conflicts with tmux seamless pane switch.
let g:move_key_modifier = 'C'

"" Multiple Cursors

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'    

"" Tig

" control + g = open tig (text-mode interface for git)
nnoremap <C-g> :Tig<Cr>

"" NERDTree

" space + nn = toggle nerdtree map <leader>nn :NERDTreeToggle<cr>
map <leader>nn :NERDTreeToggle<cr>

" space + nb = open nerdtree from bookmark
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

"" Signify: Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

"" Goyo distraction-free writing

" function ActivateGoyo()
"   if exists(":Goyo")
"     execute 'Goyo'
"   endif
" endfunction

" Space + g to toggle distraction-free writing mode
" nnoremap <leader>g :call ActivateGoyo() <cr>

" Space + m to call make in tmux.
" nnoremap <leader>m :call VimuxInterruptRunner() <bar> :call VimuxRunCommand("make") <cr>

