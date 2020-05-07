command! LightlineReload call LightlineReload()

function! LightlineReload()
  source ~/.config/nvim/settings.vim

  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

