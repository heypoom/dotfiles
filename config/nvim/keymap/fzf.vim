"" Fzf key bindings.
"" Read more: https://github.com/junegunn/fzf.vim

" space + t = search files in current directory (like :FZF)
nnoremap <leader>t :Files<cr>

" space + f = search through every file with ripgrep
nnoremap <leader>f :Rg<cr>

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

