" :Format = format current buffer
command! -nargs=0 Format :call CocAction('format')

" :Fold = fold current buffer
command! -nargs=? Fold :call CocAction('fold')

" :OR = organize imports of the current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

