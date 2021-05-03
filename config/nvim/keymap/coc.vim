" CoC (Conquer of Completion) configuration.

" space + cd = CoC Diagnostics
nnoremap <silent><nowait> <space>cd :<C-u>CocList diagnostics<cr>

" space + ce = CoC Extensions
nnoremap <silent><nowait> <space>ce :<C-u>CocList extensions<cr>

" space + cc = CoC Commands
nnoremap <silent><nowait> <space>cc :<C-u>CocList commands<cr>

" space + co = CoC Outline
nnoremap <silent><nowait> <space>co :<C-u>CocList outline<cr>

" space + cs = CoC Symbols
nnoremap <silent><nowait> <space>cs :<C-u>CocList -I symbols<cr>

" space + cj = CoC Next
nnoremap <silent><nowait> <space>cj :<C-u>CocNext<cr>

" space + ck = CoC Prev
nnoremap <silent><nowait> <space>ck :<C-u>CocPrev<cr>

" space + cp = CoC Resume
nnoremap <silent> <space>cp :<C-u>CocListResume<cr>

" Go-to code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename variable.
nmap <C-t> <Plug>(coc-rename)

" Format the selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Apply code-action and quick-fix.
xmap <leader>as <Plug>(coc-codeaction-selected)
nmap <leader>as <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Enter to auto-select the first completion item.
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


