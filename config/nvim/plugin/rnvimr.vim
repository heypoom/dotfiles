" Ranger Integration (rnvimr)
" https://github.com/kevinhwang91/rnvimr

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 0

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Disable a border for floating window
" let g:rnvimr_draw_border = 0

" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1

" Initial Layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.9 * &columns)),
            \ 'height': float2nr(round(0.9 * &lines)),
            \ 'col': float2nr(round(0.05 * &columns)),
            \ 'row': float2nr(round(0.05 * &lines)),
            \ 'style': 'minimal'
            \ }

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" nnoremap <silent> <M-o> :RnvimrToggle<CR>
" tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

" Resize floating window by all preset layouts
" tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>

" Resize floating window by special preset layouts
" tnoremap <silent> <M-l> <C-\><C-n>:RnvimrResize 1,8,9,11,5<CR>

" Resize floating window by single preset layout
" tnoremap <silent> <M-y> <C-\><C-n>:RnvimrResize 6<CR>

" " Add views for Ranger to adapt the size of floating window
" let g:rnvimr_ranger_views = [
"             \ {'minwidth': 90, 'ratio': []},
"             \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
"             \ {'maxwidth': 49, 'ratio': [1]}
"             \ ]

" " Customize the initial layout
" let g:rnvimr_layout = {
"   \ 'relative': 'editor',
"   \ 'width': float2nr(round(0.7 * &columns)),
"   \ 'height': float2nr(round(0.7 * &lines)),
"   \ 'col': float2nr(round(0.15 * &columns)),
"   \ 'row': float2nr(round(0.15 * &lines)),
"   \ 'style': 'minimal'
"   \ }

" " Customize multiple preset layouts
" " '{}' represents the initial layout
" let g:rnvimr_presets = [
"             \ {'width': 0.600, 'height': 0.600},
"             \ {},
"             \ {'width': 0.800, 'height': 0.800},
"             \ {'width': 0.950, 'height': 0.950},
"             \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0},
"             \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0.5},
"             \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0},
"             \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0.5},
"             \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
"             \ {'width': 0.500, 'height': 1.000, 'col': 0.5, 'row': 0},
"             \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0},
"             \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0.5}
"             \ ]

" " Only use initial preset layout
" " let g:rnvimr_presets = [{}]

