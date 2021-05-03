" Keymappings for all Neovim actions!
" Thanks to https://www.chrisatmachine.com/Neovim/02-vim-general-settings!

" Space becomes your <Leader> key!
" It is much easier to push now, yay!
let g:mapleader = "\<space>"
let g:maplocalleader = ","

" space = trigger vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

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
function OnTab()
  " Is emmet active?
  try
    return emmet#expandAbbrIntelligent("\<tab>")
  catch
    return pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
  endtry
endfunction

" Tab to expand emmet and auto-complete.
imap <expr><TAB> OnTab()

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

"" Fzf key bindings
"" Read more: https://github.com/junegunn/fzf.vim

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -g "!yarn.lock" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Ripgrep call RipgrepFzf(<q-args>, <bang>0)

" space + t = search files in current directory (like :FZF)
nnoremap <leader>t :Files<cr>

" space + f = search through every file with ripgrep
nnoremap <leader>f :Ripgrep<cr>

" space + kb = view all keybindings.
nnoremap <leader>kb :Maps<cr>

" space + l = jump to other lines in the file
nnoremap <leader>l :Lines<cr>

" space + h = open the files you have recently viewed
nnoremap <leader>h :History<cr>

" space + . + c = search through previously executed vim commands~!
nnoremap <leader>.c :History:<cr>

" space + b = switch between open buffers~
nnoremap <leader>b :Buffers<cr>

" space + r = open ranger file manager
nnoremap <leader>r :Ranger<cr>

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
" map <leader>t :NERDTreeToggle<cr>

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

function ActivateGoyo()
  if exists(":Goyo")
    execute 'Goyo'
  endif
endfunction

" Space + g to toggle distraction-free writing mode
" nnoremap <leader>g :call ActivateGoyo() <cr>

" Space + m to call make in tmux.
" nnoremap <leader>m :call VimuxInterruptRunner() <bar> :call VimuxRunCommand("make") <cr>

