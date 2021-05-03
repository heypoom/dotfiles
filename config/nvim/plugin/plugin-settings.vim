"" Polyglot Configuration

" Disable these languages.
let g:polyglot_disabled = []

"" Disable Default Keymaps

" Prevent ranger from setting default keybinds (leader + f)
let g:ranger_map_keys = 0

" Prevent autopairs from registering control + h and control + r
" TODO: Make this work!
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0

"" Better Whitespace

" Set the trailing whitespace color. Red = #fc625d
let g:better_whitespace_guicolor='#424450'

"" Indentation Lines

let g:indentLine_char = '│'
let g:indentLine_setColors = 1
let g:indentLine_color_gui = '#3B3F50'
let g:indentLine_bgcolor_gui = '#282A37'

"" Auto-save configuration
"" Always auto-save silently, except in insert mode.

let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

"" Emmet configuration

let g:user_emmet_mode = 'a'
let g:use_emmet_complete_tag = 1

"" Vim-session configuration

" Never auto-save vim sessions.
let g:session_autosave = 'no'

"" Auto-formatter configuration

" Always auto-format file.
" autocmd Rc BufEnter,BufWinEnter,BufRead,BufNewFile *
" 			\ if &filetype == "" | set filetype=text | endif
" autocmd Rc BufWrite * :Autoformat

"" Distraction-free writing configuration (:Goyo)

" What to do when we enter the distraction-free mode?
function! s:goyo_enter()
  " Disable tmux status lines
  silent !tmux set status off

  " Focus the current tmux panes
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z

  " Don't show the modeline and command.
  set noshowcmd

  " Set the scrolling offset to 999
  set scrolloff=999

  " Configure Theming.
  color dracula
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
  hi! StatusLine cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
  hi! StatusLineNC ctermbg=NONE guibg=NONE
  hi! VertSplit ctermbg=NONE guibg=NONE
  hi! CursorLine cterm=NONE guibg=NONE
endfunction

" What to do when we leave the distraction-free mode?
function! s:goyo_leave()
  " Re-enable tmux status lines
  silent !tmux set status on

  " Focus the current tmux panes
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z

  " Show the modeline and command.
  set showcmd

  " Set the scrolling offset to 5
  set scrolloff=5

  " Set the background to transparent.
  hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" UltiSnips Snippets Configuration

" Split vertically.
let g:UltiSnipsEditSplit="vertical"

"" Prettier Configuration

" let g:prettier#config#print_width = 80
" let g:prettier#config#tab_width = 2
" let g:prettier#config#use_tabs = 'false'
" let g:prettier#config#semi = 'false'
" let g:prettier#config#jsx_bracket_same_line = 'false'
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#bracket_spacing = 'false'
" let g:prettier#config#arrow_parens = 'avoid'
" let g:prettier#config#trailing_comma = 'all'
" let g:prettier#config#parser = 'babylon'
" let g:prettier#config#config_precedence = 'prefer-file'
" 
" " Enable auto-format if configuration is present.
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0
" let g:prettier#autoformat_config_present = 1
" let g:prettier#exec_cmd_async = 1

" Enable async auto-format for these type of files.
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"" Go language configuration

" Use goimports for auto-formatting
let g:go_fmt_command = "goimports"

" Do not auto-save in metalinter.
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'varcheck']

" Highlight types, struct methods and functions.
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1

" Automatically import un-imported packages for us.
let g:go_gocode_unimported_packages = 1

" Use pkg for template.
let g:go_template_use_pkg = 1

"" Hex-mode settings

" Open these kind of files in hex-mode automatically.
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.so'

" Pass the flags to xxd
let g:hexmode_xxd_options = '-g 1'

"" EditorConfig configuration

" Ignore vim-fugitive files and remote files over SSH.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Ignore these editorconfig rules.
let g:EditorConfig_disable_rules = []

"" JavaScript Language Configuration

" Highlight JSDocs
let g:javascript_plugin_jsdoc = 1

" Highlight Flow Type
let g:javascript_plugin_flow = 1

"" Markdown Language Configuration
"" Read more: https://github.com/plasticboy/vim-markdown

" Support LaTeX
let g:vim_markdown_math = 1
let g:tex_conceal = ""

" Support Markdown Front Matter (e.g. Jekyll, Hugo)
let g:vim_markdown_frontmatter = 1

" Support TOML Front Matter (e.g. Hugo)
let g:vim_markdown_toml_frontmatter = 1

" Support JSON Front Matter (e.g. Hugo)
let g:vim_markdown_json_frontmatter = 1

" Do not require .md extensions for Markdown links
let g:vim_markdown_no_extensions_in_markdown = 1

" Auto-write when following link
let g:vim_markdown_autowrite = 1

" Follow the named #anchor
let g:vim_markdown_follow_anchor = 1

" Enable Fenced Code Blocks
let g:markdown_fenced_languages = ['css', 'javascript', 'typescript']

"" Close Tag

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"" Vim Sneak
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
let g:sneak#prompt = '🔎'

"" Quickscope

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

"" NERDTree

" Tree view should by positioned on the left.
let g:NERDTreeWinPos = "left"

" Show hidden files.
let g:NERDTreeShowHidden = 1

" Ignore the python cache files.
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Set the window width to 25 characters.
let g:NERDTreeWinSize = 25

" Vim Wiki
let g:vimwiki_list = [{'path': '~/Notes/Wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Rainbow Parenthesis
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

""" Signify

"" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
