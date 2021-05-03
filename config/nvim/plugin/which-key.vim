" Create map to add keys to
let g:which_key_map = {}

" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key

autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['r'] = [':RnvimrToggle', 'Ranger']

" c is for coc
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ 's' : ['CocList -I symbols', 'Symbols'],
      \ 'c' : ['CocList commands', 'Commands'],
      \ 'd' : ['CocList diagnostics', 'Diagnostics'],
      \ 'e' : ['CocList extensions', 'Extensions'],
      \ 'f' : ['CocList format-selected', 'Format Selected'],
      \ 'o' : ['CocList outline', 'Outline'],
      \ 'p' : ['CocListResume', 'Open List'],
      \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
