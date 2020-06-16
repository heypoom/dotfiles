if exists("b:current_syntax")
  finish
endif

" Custom conceal
syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[x\]" conceal cchar=
syntax match todoCheckbox "\[o\]" conceal cchar=ｏ
syntax match todoCheckbox "\[-\]" conceal cchar=•
syntax match todoCheckbox "\[\.\]" conceal cchar=•

let b:current_syntax = "todo"

hi def link todoCheckbox Identifier
hi Conceal guibg=NONE

setlocal cole=1

