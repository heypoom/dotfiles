call plug#begin('~/.local/share/nvim/plugged')

" Dracula Theme.
Plug 'dracula/vim', { 'as': 'dracula' }

" Use lightline to make startup time faster
Plug 'itchyny/lightline.vim'

" Move lines and selections.
Plug 'matze/vim-move'

" Conquer of Completion: Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language Packs! (syntax highlighting, indentation, etc.)
Plug 'sheerun/vim-polyglot'

" Fuzzy Finder
" :Rg for ripgrep, :Ag for silver searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Surround (cs'" to change surrounding '' to "")
Plug 'tpope/vim-surround'

" Tab Expansions for HTML files.
Plug 'mattn/emmet-vim', {'for': ['html', 'pug', 'jsx', 'typescriptreact', 'javascriptreact', 'javascript', 'typescript.tsx']}

" Repeat the surround command using the dot (.) command.
Plug 'tpope/vim-repeat'

" Follow the EditorConfig configuration.
" Depend on editorconfig to be installed.
Plug 'editorconfig/editorconfig-vim'

" NERDTree: file tree explorer.
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

" Auto-close HTML <tags>.
Plug 'alvan/vim-closetag', {'for': 'html'}

" Seamless switching between nvim splits and tmux panes!
" Use ctrl + {hjkl} to move between them as usual.
" ERROR: conflicts with vim-move.
" Plug 'christoomey/vim-tmux-navigator'

" Retrieve the cheat sheet from cht.sh
" Use the :Cheat command to get the cheat sheet.
" ERROR: Causes significant issues with Python.
" Plug 'dbeniamine/cheat.sh-vim'

" Enable +AnsiEsc
Plug 'powerman/vim-plugin-AnsiEsc'

" Ranger Integration (:Ranger)
Plug 'francoiscabrol/ranger.vim'

" Required by Ranger
Plug 'rbgrouleff/bclose.vim'

" Tig Integration (:Tig)
Plug 'codeindulgence/vim-tig'

" Distraction-free writing with :Goyo
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'text']}

" Easymotion: <leader><leader>s
Plug 'easymotion/vim-easymotion'

" Sneak: s{char}{char}
Plug 'justinmk/vim-sneak'

" Vue
Plug 'posva/vim-vue', {'for': ['vue']}

" Git Gutter (Show git diffs in left gutter)
" Plug 'airblade/vim-gitgutter'

" Adds the ending pair for (parens), {braces} and 'quotes'
" Features: https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" Highlight all trailing whitespaces. Prevent messy git diffs.
Plug 'ntpeters/vim-better-whitespace'

" Comment stuff out! (gc in visual, gcc in normal)
Plug 'tomtom/tcomment_vim'

" Adjust shiftwidth and expandtab based on current file.
Plug 'tpope/vim-sleuth'

" Syntax highlighter for styled-components and emotion.
" Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['jsx', 'typescript', 'typescriptreact', 'javascriptreact', 'javascript', 'typescript.tsx'] }

" Interact with Tmux using :VimuxRunCommand and :VimuxRunLastCommand
Plug 'benmills/vimux'

" Restore FocusGained and FocusLost events in tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" Git wrapper (:Gcommit, :Gstatus, :Gblame)
Plug 'tpope/vim-fugitive'

" Syntax highlighting and more for nginx.conf files
Plug 'chr4/nginx.vim', {'for': ['nginx', 'conf']}

" Parinfer infers the ending parenthesis automatically!
" Read more: https://shaunlebron.github.io/parinfer/
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release', 'for': 'clojure'}

" Edit files in hex mode with :Hexmode or `vi -b`
Plug 'fidian/hexmode'

" Rust Language Support
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Defines a text object for indentation levels.
" ai = an indent with line above
" ii = inner indent, no line above
" aI = an indent with lines above and below
Plug 'michaeljsmith/vim-indent-object'

" Visually select larger, enclosing regions of text.
" + = expand, _ = shrink.
Plug 'terryma/vim-expand-region'

" Multiple Cursors with <C-n>
" Read more: https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" Search for documentation in Dash.app using :Dash
" Read more with :help dash
Plug 'rizzatti/dash.vim'

" Track your coding time with WakaTime
Plug 'wakatime/vim-wakatime'

" End Ruby blocks with end
Plug 'tpope/vim-endwise'

" Go Language Support
" Auto Gofmt, :GoDoc, :GoRun, :GoLint, :GoTest, :GoDebugStart
" Plug 'fatih/vim-go', {'for': 'go'}

" Add file icons to other plugins (e.g. NERDTree, Airline)
" Always load this as the very last one!
Plug 'ryanoasis/vim-devicons'

call plug#end()
