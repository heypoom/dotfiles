"" Vim Move Configuration

" Use C-k and C-j to move text up and down
let g:move_key_modifier = 'C'

"" Polyglot Configuration

" Disable these languages.
" We use vim-go, vim-javascript and vim-markdown instead.
let g:polyglot_disabled = ['go', 'javascript', 'jsx', 'markdown']

"" Disable Default Keymaps

" Prevent ranger from setting default keybinds (leader + f)
let g:ranger_map_keys = 0

" Prevent autopairs from registering control + h and control + r
" TODO: Make this work!
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0

"" Better Whitespace

" Set the trailing whitespace color to red.
let g:better_whitespace_guicolor='#fc625d'

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

  " Disable auto-completion.
	" call deoplete#disable()
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

  " Re-enable auto-completion.
  " call deoplete#enable()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" UltiSnips Snippets Configuration

" Split vertically.
let g:UltiSnipsEditSplit="vertical"

"" Prettier Configuration

let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#config_precedence = 'prefer-file'

" Disable default auto-format configuration (we wanna have more control)
let g:prettier#autoformat = 0

" Enable async auto-format for these type of files.
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

"" Deoplete auto-completion configuration

" Enable deoplete with use smart-cases
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1

" Configure Racer for Rust
let g:racer_cmd = "/Users/phoomparin/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Configure Clang for C/C++/Obj-C
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/7.0.0_1/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/7.0.0_/lib/clang/"

"" TernJS completion configuration for JavaScript
"" Read more: https://github.com/carlitux/deoplete-ternjs

let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'javascript.jsx', 'vue']

"" Go Completion Configuration (deoplete-go)
"" Read more: https://github.com/zchee/deoplete-go

" Use cache for Go
let g:deoplete#sources#go#use_cache = 1

" Specify path to gocode to improve performance.
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'

" Display all words while sorting.
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

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

"" Asynchronous Lint Engine (ALE) Settings

" Extend default linters.
let b:ale_linters = ['flake8', 'pylint']

" Automatically apply fixers on save.
let b:ale_fixers = ['eslint']
let b:ale_fix_on_save = 1

"" Close Tag

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"" NERDTree

" Tree view should by positioned on the left.
let g:NERDTreeWinPos = "left"

" Show hidden files.
let g:NERDTreeShowHidden=1

" Ignore the python cache files.
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Set the window width to 25 characters.
let g:NERDTreeWinSize=25
