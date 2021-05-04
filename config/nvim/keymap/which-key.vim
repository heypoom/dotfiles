" Create map to add keys to
let g:which_key_map = {}

" Single mappings
let g:which_key_map['r'] = [':RnvimrToggle', 'Ranger']

" c is for coc
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ 'c' : [':CocList commands', 'Commands'],
      \ 'd' : [':CocList diagnostics', 'Diagnostics'],
      \ 'e' : [':CocList extensions', 'Extensions'],
      \ 'f' : [':CocList format-selected', 'Format Selected'],
      \ 'o' : [':CocList outline', 'Outline'],
      \ 'p' : [':CocListResume', 'Open List'],
      \ 's' : [':CocList -I symbols', 'Symbols'],
      \ }

let g:which_key_map.m = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6 fish' , 'terminal'],
      \ 'f' : [':FloatermNew fzf' , 'fzf'],
      \ 's' : [':FloatermNew fish' , 'fish'],
      \ 'g' : [':FloatermNew lazygit', 'git'],
      \ 'd' : [':FloatermNew lazydocker', 'docker'],
      \ 'n' : [':FloatermNew node', 'node'],
      \ 'p' : [':FloatermNew python', 'python3'],
      \ 'r' : [':FloatermNew ranger', 'ranger'],
      \ 't' : [':FloatermToggle', 'toggle'],
      \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

