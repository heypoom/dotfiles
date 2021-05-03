"" Fzf key bindings.
"" Read more: https://github.com/junegunn/fzf.vim

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


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -g "!yarn.lock" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Ripgrep call RipgrepFzf(<q-args>, <bang>0)
