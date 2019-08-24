call plug#begin('~/.local/share/nvim/plugged')

"""
""" Essential Plugins.
"""

" Dracula Theme.
Plug 'dracula/vim', { 'as': 'dracula' }

" Use lightline to make startup time faster
Plug 'itchyny/lightline.vim'

" Move lines and selections with alt + {hjkl}
Plug 'matze/vim-move'

" Fuzzy Finder
" :Rg for ripgrep, :Ag for silver searcher
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Surround (cs'" to change surrounding '' to "")
Plug 'tpope/vim-surround'

" Colorize all the color codes! (e.g. #2d2d30, rgb(5, 5, 5))
Plug 'lilydjwg/colorizer'

" Tab Expansions for HTML files.
Plug 'mattn/emmet-vim'

" Repeat the surround command using the dot (.) command.
Plug 'tpope/vim-repeat'

" Follow the EditorConfig configuration.
" Depend on editorconfig to be installed.
Plug 'editorconfig/editorconfig-vim'

" NERDTree: file tree explorer.
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

" Add file icons to other plugins (e.g. NERDTree, Airline)
" Always load this as the very last one!
Plug 'ryanoasis/vim-devicons'

" " Seamless switching between nvim splits and tmux panes!
" " Use ctrl + {hjkl} to move between them as usual.
" " Note: conflicts with vim-move.
" Plug 'christoomey/vim-tmux-navigator'

"""
""" Nice-to-have Plugins
"""

" Press <tab> to expand snippets, integrates with deoplete.
Plug 'SirVer/ultisnips'

" Ranger Integration (:Ranger)
Plug 'francoiscabrol/ranger.vim'

" Required by Ranger
Plug 'rbgrouleff/bclose.vim'

" Tig Integration (:Tig)
Plug 'codeindulgence/vim-tig'

" Distraction-free writing with :Goyo
Plug 'junegunn/goyo.vim'

" " Auto-close HTML <tags>.
" Plug 'alvan/vim-closetag'
" 
" " Easymotion
Plug 'easymotion/vim-easymotion'
" 
" " Git Gutter (Show git diffs in left gutter)
" Plug 'airblade/vim-gitgutter'
" 
" " Auto-format your source code.
" Plug 'Chiel92/vim-autoformat'
" 
" " Re-open a file at the last cursor position.
" Plug 'farmergreg/vim-lastplace'
" 
" " Adds the ending pair for (parens), {braces} and 'quotes'
" " Features: https://github.com/jiangmiao/auto-pairs
" Plug 'jiangmiao/auto-pairs'
" 
" " Emacs kill-ring but it's in vim.
" " meta + p = cycle backward through your history of yanks
" " meta + shift + p = cycle forwards through your history of yanks
" Plug 'maxbrunsfeld/vim-yankstack'
" 
" " Highlight all trailing whitespaces. Prevent messy git diffs.
" Plug 'ntpeters/vim-better-whitespace'
" 
" " Create non-existent directories before writing file.
" Plug 'pbrisbin/vim-mkdir'
" 
" " Quickly execute vim plugins
" Plug 'thinca/vim-quickrun'
" 
" " Comment stuff out! (gc in visual, gcc in normal)
" Plug 'tpope/vim-commentary'
" 
" " Automatically add "end" in ruby block.
" Plug 'tpope/vim-endwise'
" 
" " Adjust shiftwidth and expandtab based on current file.
" Plug 'tpope/vim-sleuth'
" 
" "" Linter Settings
" 
" " Asynchronous Lint Engine, lints your code.
" Plug 'w0rp/ale'
" 
" " Flake8 Linter for Python. Combines PyFlakes, PEP8 and MacCabe.
" " Read more: https://github.com/nvie/vim-flake8
" Plug 'nvie/vim-flake8'
" 
" " W3m Plugin for vim
" Plug 'yuratomo/w3m.vim'
" 
" " Auto-save the file! no need to :w (like vscode)
" " Plug '907th/vim-auto-save'
"
" 
" 
" " Syntax highlighter for styled-components and emotion.
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" 
" "" Tmux Integration
" 
" " Interact with Tmux using :VimuxRunCommand and :VimuxRunLastCommand
" Plug 'benmills/vimux'
" 
" " Restore FocusGained and FocusLost events in tmux
" Plug 'tmux-plugins/vim-tmux-focus-events'
" 
" " Generate tmux status lines using the current airline theme.
" Plug 'edkolev/tmuxline.vim'
" 
" " Git wrapper (:Gcommit, :Gstatus, :Gblame)
" Plug 'tpope/vim-fugitive'
" 
" " Vim session manager!
" " :SaveSession <name> = save, :OpenSession <name> = load.
" " Read more: https://jvns.ca/blog/2017/09/10/vim-sessions
" Plug 'xolox/vim-session'
" 
" " Required by xolox/vim-session.
" Plug 'xolox/vim-misc'
" 
" " Use relative line numbers in active pane, absolute in others.
" " Read more: https://jeffkreeftmeijer.com/vim-number/#automatic-toggling-between-line-number-modes
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
" 
" " Syntax highlighting and more for nginx.conf files
" Plug 'chr4/nginx.vim'
" 
" " Align text with :Tabular
" Plug 'godlygeek/tabular'
" 
" " Class outline viewer with :TagbarToggle
" " Depend on universal-ctags to be installed.
" Plug 'majutsushi/tagbar'
" 
" " Snippet Packs for multiple languages!
" Plug 'honza/vim-snippets'
" 
" " Prettier! Prettifies your JavaScript code.
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
" 
" " Parinfer infers the ending parenthesis automatically!
" " Read more: https://shaunlebron.github.io/parinfer/
" Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
" 
" " Show indentation bars
" Plug 'Yggdroot/indentLine'
" 
" " Edit files in hex mode with :Hexmode or `vi -b`
" Plug 'fidian/hexmode'
" 
" 
" " Defines a text object for indentation levels.
" " ai = an indent with line above
" " ii = inner indent, no line above
" " aI = an indent with lines above and below
" Plug 'michaeljsmith/vim-indent-object'
" 
" " Visually select larger, enclosing regions of text.
" " + = expand, _ = shrink.
" Plug 'terryma/vim-expand-region'
" 
" " Multiple Cursors with <C-n>
" " Read more: https://github.com/terryma/vim-multiple-cursors
" Plug 'terryma/vim-multiple-cursors'
" 
" " Search for documentation in Dash.app using :Dash
" " Read more with :help dash
" Plug 'rizzatti/dash.vim'
" 
" " Track your coding time with WakaTime
" " Plug 'wakatime/vim-wakatime'
" 
" 
" "" Language Support
" 
" " Go Language Support
" " Auto Gofmt, :GoDoc, :GoRun, :GoLint, :GoTest, :GoDebugStart
" Plug 'fatih/vim-go'
" 
" " JavaScript Language Support
" Plug 'pangloss/vim-javascript'
" 
" " React JSX Syntax Support
" Plug 'mxw/vim-jsx'
" 
" " TypeScript Language Support
" " Plug 'mhartington/nvim-typescript'
" 
" " Conquer of Completion: Intellisense Engine
" " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" 
" Markdown Language Support
" Plug 'plasticboy/vim-markdown'
" 
" " Rust Language Support
" Plug 'rust-lang/rust.vim'
" 
" " Language Packs! (syntax highlighting, indentation, etc.)
" Plug 'sheerun/vim-polyglot'
" 
" "" Deoplete auto-completion support
" "" Read more: https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
" 
" " Provides auto-completion for your code.
" " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" 
" " Provides #include completion.
" " Plug 'Shougo/neoinclude.vim'
" 
" " Deoplete Completion for Go
" " Plug 'zchee/deoplete-go', { 'do': 'make' }
" 
" " Deoplete Completion for JavaScript using TernJS
" " Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
" 
" " Deoplete Completion for C/C++/Obj-C using clang-python3
" " Read more: https://github.com/zchee/deoplete-clang
" " Plug 'zchee/deoplete-clang'
" 
" " Deoplete Completion for Rust using Racer
" " Plug 'racer-rust/vim-racer'
"
" 
" " TidalCycles for Live Coding Music!
" " Plug 'tidalcycles/vim-tidal'
" 
" " Racket Support
" " Plug 'wlangstroth/vim-racket'

call plug#end()
