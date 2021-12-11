" Reference: https://github.com/mhinz/vim-startify
" Thanks to https://www.chrisatmachine.com/Neovim/11-startify!

let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
   \ '    ___       ___       ___       ___',
   \ '   /\  \     /\  \     /\  \     /\__\',
   \ '  /::\  \   /::\  \   /::\  \   /::L_L_',
   \ ' /::\:\__\ /:/\:\__\ /:/\:\__\ /:/L:\__\',
   \ ' \/\::/  / \:\/:/  / \:\/:/  / \/_/:/  /',
   \ '    \/__/   \::/  /   \::/  /    /:/  /',
   \ '             \/__/     \/__/     \/__/'
  \]

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['Files']            },
  \ { 'type': 'dir',       'header': ['Current Directory '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['Bookmarks']      },
  \ ]

let g:startify_bookmarks = [
  \ '~/Projects',
  \ '~/Labs',
  \ '~/Workspaces',
  \ { 'i': '~/dotfiles/config/nvim/init.vim' },
  \ ]
