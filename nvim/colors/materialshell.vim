set background=dark
hi clear

if exists("syntax on")
	syntax reset
endif

let g:colors_name="materialshell"

hi Normal guifg=#f5f5f5 guibg=NONE gui=NONE
hi Comment guifg=#40c3ff guibg=NONE gui=NONE
hi Constant guifg=#ff4080 guibg=NONE gui=NONE
hi String guifg=#ff5252 guibg=NONE gui=NONE
hi htmlTagName guifg=#ffd640 guibg=NONE gui=NONE
hi Identifier guifg=#c4d82c guibg=NONE gui=NONE
hi Statement guifg=#ffd640 guibg=NONE gui=NONE
hi PreProc guifg=#ff4080 guibg=NONE gui=NONE
hi Type guifg=#c4d82c guibg=NONE gui=NONE
hi Function guifg=#c4d82c guibg=NONE gui=NONE
hi Repeat guifg=#f5f5f5 guibg=NONE gui=NONE
hi Operator guifg=#f5f5f5 guibg=NONE gui=NONE
hi Error guibg=#ff5252 guifg=NONE gui=NONE
hi TODO guibg=#40c3ff guifg=NONE gui=NONE

hi link character	constant 
hi link number	constant 
hi link boolean	constant 
hi link Float		Number 
hi link Conditional	Repeat 
hi link Label		Statement 
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

hi Normal guibg=none
hi NonText guibg=none
hi SignColumn guibg=none
hi FoldColumn guibg=none
hi LineNr guifg=#40c3ff guibg=none
hi EndOfBuffer guibg=none
