"" Color Scheme for the Integrated :Terminal.
"" (Based on dracula config on kitty terminal)

" Black
let g:terminal_color_0 = '#21222d'
let g:terminal_color_8 = '#617d8a'

" Red
" let g:terminal_color_1 = '#FF424E'
let g:terminal_color_1 = '#ff6268'
let g:terminal_color_9 = '#ff6268'

" Green
" let g:terminal_color_2 = '#00FB69'
let g:terminal_color_2 = '#86F589'
let g:terminal_color_10 = '#86F589'

" Yellow
" let g:terminal_color_3 =  '#EEF77B'
let g:terminal_color_3 =  '#ffff98'
let g:terminal_color_11 = '#ffff98'

" Magenta
" let g:terminal_color_4 = '#c591ff'
let g:terminal_color_4 = '#deaaff'
let g:terminal_color_12 = '#deaaff'

" Pink
let g:terminal_color_5 = '#ff8be3'
let g:terminal_color_13 = '#ff8be3'

" Cyan
let g:terminal_color_6 = '#84ffff'
let g:terminal_color_14 = '#84ffff'

" White
let g:terminal_color_7 = '#ffffff'
let g:terminal_color_15 = '#ffffff'

" Syntax Highlight for Dracula

hi! link jsxTagName DraculaPink
hi! link jsxEqual DraculaPink
hi! link jsxAttrib DraculaGreen
hi! link jsxDot white
hi! link jsxComponentName DraculaCyan
hi! link jsxPunct white

" Virtual Text in Codi (Interactive Playground)
highlight CodiVirtualText guifg=#c68dff

" WhichKey Colors
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Signify Colors
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" Quickscope Colors
highlight QuickScopePrimary guifg='#69ebff' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

" Sneak Colors
highlight Sneak guifg=black guibg=#69ebff ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=#afff5f ctermfg=red ctermbg=yellow
