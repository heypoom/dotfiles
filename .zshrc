# --- Loading Indicators and Performance Logging --

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"

# Millisec Utility
sec() {
  gdate +%s%3N
}

# Globals for the Shell Loading Indicator
START_TIME=`sec`
PREV_TIME=`sec`
PREV_MSG="Booting up shell"

# Do you want to show performance information on shell startup?
# SHOW_PERF_INFO=false

li_start() {
  revolver -s 'bouncingBall' start $GREEN"Booting up shell. Please Wait..."
}

li_mark() {
  TIME=$[`sec` - $PREV_TIME]

  revolver update $GREEN"$1... (prev: $YELLOW$TIME$GREEN ms)"

  if ([ $SHOW_PERF_INFO ]) {
    echo $GREEN"[+] $PREV_MSG done in $YELLOW$TIME$GREEN ms."
  }

  PREV_TIME=`sec`
  PREV_MSG=$1
}

li_stop() {
  if ([ $SHOW_PERF_INFO ]) {
    echo $GREEN"[+] $PREV_MSG done in $YELLOW$TIME$GREEN ms."
  }

  revolver stop

  TIME=$[`sec` - $START_TIME]

  echo $GREEN"[+] Shell Initialization Took $YELLOW$TIME$GREEN ms."
}

li_start

# --- Lazy Loading Module ---

# Globals for Lazy Loading
LAZY_NAME=""
LAZY_START_TIME=""

# Start Lazy Loading
lazy_start() {
  LAZY_NAME=$1
  LAZY_START_TIME=`sec`

  revolver -s 'bouncingBall' start $GREEN"Lazy Loading $YELLOW$1$GREEN..."
}

# Stop Lazy Loading
lazy_stop() {
  TIME=$[`sec` - $LAZY_START_TIME]

  revolver stop

  echo $GREEN"[+] Lazy Loaded $YELLOW$LAZY_NAME$GREEN in $YELLOW$TIME$GREEN ms." `tput sgr0`
}

# Act as a stub to another shell function/command. When first run, it will load the actual function/command then execute it.
# E.g. This made my zsh load 0.8 seconds faster by loading `nvm` when "nvm", "npm" or "node" is used for the first time
# $1: space separated list of alias to release after the first load
# $2: file to source
# $3: name of the command to run after it's loaded
# $4+: argv to be passed to $3

function lazy_load() {
  local lazy_name=$1
  local load_func=${2}
  local lazy_func="lazy_${load_func}"

  shift
  shift

  for i in ${@}; do
      alias ${i}="${lazy_func} ${i}"
  done

  eval "
  function ${lazy_func}() {
    lazy_start '$lazy_name'
    unset -f ${lazy_func}
    lazy_load_clean $@
    eval ${load_func}
    unset -f ${load_func}
    lazy_stop
    eval \$@
  }
  "
}

function lazy_load_clean() {
  for i in ${@}; do
    unalias ${i}
  done
}

# --- Environment Configuration ---

# Default User for hiding the username segment.
export DEFAULT_USER=phoomparin

# _ and - will be interchangeable
export HYPHEN_INSENSITIVE="true"

# Paths to the Manual Pages
export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Path to your SSH Private Key
export SSH_KEY_PATH="~/.ssh/rsa_id"

li_mark "Retrieving Hostname"

# $HOST on macOS changes with dhcp. Use ComputerName if possible.
# export SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || export SHORT_HOST=${HOST/.*/}

# Remove lag on vi-mode
export KEYTIMEOUT=1

# Important: Allow changing dir without typing cd
setopt autocd

# Install Docker Completion
function install_docker_completion() {
  COMPLETION=~/.zsh/completion
  mkdir -p $COMPLETION
  cp /Applications/Docker.app/Contents/Resources/etc/*.zsh-completion $COMPLETION
  mv $COMPLETION/docker.zsh-completion $COMPLETION/_docker
  mv $COMPLETION/docker-compose.zsh-completion $COMPLETION/_docker-compose
  mv $COMPLETION/docker-machine.zsh-completion $COMPLETION/_docker-machine
}

# Always use en_US and UTF-8 for everything.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Prefer Neovim as the default editor.
export EDITOR='nvim'
export VISUAL='nvim'

# Also Use Neovim as the React editor
export REACT_EDITOR=nvim
export REACT_EDITOR_CMD=/usr/local/bin/nvim

# Path for pkgconfig
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# Configure Shell Completion Path
fpath=(~/.zsh/completion $ZGEN_HOME/mfaerevaag/wd-master/wd.sh $fpath)

# --- Powerlevel9K Theming ---
li_mark "Customizing Powerlevel9K Theme"

# Powerlevel9k theme configuration
POWERLEVEL9K_MODE="nerdfont-complete"

# Terminal Segment
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

# Prompt Elements.
# battery_joined ram_joined load
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time time_joined background_jobs_joined)

# Vi-mode Stylings

POWERLEVEL9K_VI_INSERT_MODE_STRING="\uf040"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="\ue7c5"

POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='none'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='none'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='none'

# Version Control Styling
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-remotebranch git-stash git-tagname)
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="red"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"

# Directory Styling
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='none'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"

# Root Indicator Styling
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"

# Return Status Styling
POWERLEVEL9K_OK_ICON='\uf42e'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='none'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_STATUS_OK_BACKGROUND='none'
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_VERBOSE=true

# Time Styling
POWERLEVEL9K_TIME_BACKGROUND='none'
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

# Execution Time Styling
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='none'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1

# Background Jobs Styling
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='none'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='blue'
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

# Directory Truncation
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=''
POWERLEVEL9K_SHORTEN_DIR_LENGTH=9
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

# Show Git Commit Hash
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHOW_CHANGESET=true

# OS Icon
POWERLEVEL9K_OS_ICON_BACKGROUND='none'
POWERLEVEL9K_OS_ICON_FOREGROUND="249"

# Version Control Icons
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'

# Ram Styling
POWERLEVEL9K_RAM_BACKGROUND='none'
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_RAM_FOREGROUND="white"

# CPU Load Styling
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND='none'
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND='none'
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND='none'
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="white"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"

# Battery Indicator Styling
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='none'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="white"
POWERLEVEL9K_BATTERY_CHARGED_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='none'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="white"
POWERLEVEL9K_BATTERY_CHARGING_VISUAL_IDENTIFIER_COLOR="blue"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='none'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="white"
POWERLEVEL9K_BATTERY_DISCONNECTED_VISUAL_IDENTIFIER_COLOR="white"
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='none'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="red"
POWERLEVEL9K_BATTERY_LOW_VISUAL_IDENTIFIER_COLOR="red"

# --- Plugin Management ---
li_mark "Enabling ZGen Plugin Manager"

# Enable ZGen Plugin Manager.
export ZGEN_HOME="$HOME/.zgen"

source "$ZGEN_HOME/zgen.zsh"

# Configure Plugins to be saved to ZGen
configure_plugins() {
  # oh-my-zsh plugins
  # zgen oh-my-zsh
  # zgen oh-my-zsh plugins/git
  # zgen oh-my-zsh plugins/vi-mode

  # Emoji Selection
  zgen load "b4b4r07/emoji-cli"

  # Warp Drive (wd)
  # , as:command, use:"wd.sh", hook-load:"wd() { . $zgen load_REPOS/mfaerevaag/wd/wd.sh }"
  # zgen load 'mfaerevaag/wd'

  # macOS Specific Command
  zgen load "unixorn/tumult.plugin.zsh"

  # Simple Calculator
  # zgen load "arzzen/calc.plugin.zsh"

  # Go `up` the directory tree
  zgen load "peterhurford/up.zsh"

  # Alias Tips
  zgen load "djui/alias-tips"

  # Awesome Plugins for Syntax Highlighting, Autosuggestions, and Shell Completions
  zgen load "zsh-users/zsh-syntax-highlighting"
  zgen load "zsh-users/zsh-autosuggestions"
  zgen load "zsh-users/zsh-completions"
  zgen load "zsh-users/zsh-history-substring-search"
    
  # Load the powerlevel9k theme
  zgen load bhilburn/powerlevel9k powerlevel9k

  # generate the init script from plugins above
  zgen save
}

# Manually Rebuild ZGen Init Script
zgen_rebuild() {
  configure_plugins
  zgen update
}

# if the init scipt doesn't exist
if ! zgen saved; then
  configure_plugins
fi

# Fuzzy Finder, History Menu and Emoji Menu (CTRL+S)
li_mark "Loading FZF Fuzzy Finder"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vi Mode: Allow Yank-Paste with the system clipboard                                                            11:
li_mark "Enabling Clipboard in vi-mode"

[[ -n $DISPLAY ]] && {
  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | pbcopy
  }

  zle_cut_widgets=(
    vi-backward-delete-char
    vi-change
    vi-change-eol
    vi-change-whole-line
    vi-delete
    vi-delete-char
    vi-kill-eol
    vi-substitute
    vi-yank
    vi-yank-eol
  )

  for widget in $zle_cut_widgets
  do
    zle -N $widget cutbuffer
  done

  function putbuffer() {
    zle copy-region-as-kill "$(pbpaste)"
    zle .$WIDGET
  }

  zle_put_widgets=(
    vi-put-after
    vi-put-before
  )

  for widget in $zle_put_widgets
  do
    zle -N $widget putbuffer
  done
}

li_mark "Configuring History Substring Search"

# History Substring Search

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(none)
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=(none)

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Activate hub's aliases.
li_mark "Activating hub aliases for git"

init_hub() {
  eval $(hub alias -s)
}

lazy_load "Hub for GitHub" init_hub hub

# Activate thefuck aliases

init_thefuck() {
  eval $(thefuck --alias)
}

lazy_load "The Fuck" init_thefuck fuck

# --- Lazy Aliases ---

li_mark "Configuring Lazy Aliases"

# Julia Aliases
alias julia='exec /Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia'

# Use GNU Date instead of the macOS binary
alias date=gdate

# Cat with syntax highlighting.
alias cats="highlight -O ansi"
alias ccat="highlight -O ansi"

# Beautiful git commit tree.
alias gitl="git log --oneline --graph --color --all --decorate | emojify"

# Quick git commit!
alias gitc="echo git add -A && git commit -m '$1'"

# Remove unreferenced blobs from git repo
alias git-gc-all='git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"'

# Delete local branch that get squash-merged to master
alias git-delete-squashed='git checkout -q master && git remote prune origin && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done; git prune'

# Clean Up Docker Volume
alias cleanup-docker-volume='docker volume ls -qf dangling=true | xargs docker volume rm'

# Lazy alias for clear.
alias c="clear && tmux clear-history"

# Lazy alias for thefuck
alias f="fuck"

# Lazy alias for REPLs.
alias n="node"
alias p="python3"

# Alias for mmake.
alias m="mmake"
alias make="mmake"

# Lazy alias for tmux
alias t="tmux"

# Lazy alias for `docker-compose up`
alias u="docker-compose up"

# Lazy alias for sudo.
alias s="sudo"
alias elevate="sudo -s"

# Lazy alias for kubectl
alias k="kubectl"

# Alias exa to ls.
alias l="exa -lagh --git"
alias ls="exa"
alias la="exa -baghHliS --git"
alias tree="exa --tree"

# Lazy Alias for Atom Beta
alias a="atom-beta ."

# Alias v, vi and vim to neovim.
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"
alias svi="nvim"
alias vis="sudo nvim"

# Aliases for JavaScript Developemnt
alias deps="cat package.json | jq .dependencies"
alias devdeps="cat package.json | jq .devDependencies"
alias scripts="cat package.json | jq .scripts"
alias yarnglobal="cd $HOME/.config/yarn/global"
alias webpackexpose="sudo ./node_modules/.bin/webpack-dev-server --config ./tools/webpack.config.dev.js --hot --progress --inline --host 0.0.0.0 --port 80"

# Lazy alias to Notes
alias notes="wd notes && ls"

# TODO.md Viewer
alias todo="nvim ~/TODO.md"
alias purpose="nvim ~/TODO.md"
alias goals="nvim ~/TODO.md"
alias hope="nvim ~/TODO.md"

# IDEAS.md Viewer
alias ideas="nvim ~/Notes/IDEAS.md"
alias projects="nvim ~/Notes/IDEAS.md"

# Start JetBrains Licensing Server (Sorry...)
alias ils="docker run --name ils -d -p 1027:1027 phoomparin/ils:latest"

# --- Small Utilities ---

# Generate .gitignore file
gi() {
  curl -L -s https://www.gitignore.io/api/$@ ;
}

# Simple utility to get the unicode codepoint of a character.
codepoint() {
  echo -n $1 | iconv -f UTF-8 -t UTF-32BE | xxd -p | sed -E 's/^0+/0x/' | xargs printf '\\U%04X\n'
}

# -----

li_mark "Configuring Environment Variables"

# Defines Rust's Source Path for Racer Autocompletion
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Configure Go's Version Manager (GVM)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Define Java's SDK Path
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home"

# Define Android's SDK Path
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Enable Gradle Daemon
export GRADLE_OPTS="-Dorg.gradle.daemon=true"

# Define Go's $GOPATH
export GOPATH="$HOME/Go"

# PATH Environment Variables for Local Binaries, Go Binaries and Android Platform Tools.
export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:/usr/local/bin:$PATH:$GOPATH/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.fastlane/bin"

# More PATHs for the Ruby Version Manager, Google Cloud SDK, Yarn's Global Node Modules and Rust's Cargo.
export PATH="$PATH:$HOME/lib/gcloud/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$HOME/Labs/flutter/bin"

# More PATHs for Luna Studio and Mix
export PATH="$PATH:$HOME/.mix/:$HOME/.local/bin:/Users/phoomparin/.local/bin/luna-studio"

# More PATHs for Local System Binaries and Library Executables
export PATH="/usr/bin:$PATH:/usr/local/sbin:/usr/libexec:$HOME/.rvm/bin:$HOME/lib/flutter/bin"

# prtcfg: Copies Prettier Config to Current Directory
alias prtcfg="cp ~/Labs/Common/React/.eslintrc.json ."

# duckscfg: Copies Ducks Helper to Current Directory
alias duckscfg="cp ~/Labs/Common/React/helper.js ."

li_mark "Enabling Workspace Management Commands"

# Workspace Management Commands
source "$HOME/Scripts/workspace.sh"

# Kubernetes Shell Autocompletion.
li_mark "Loading Kubernetes Completion"

init_kube() {
  if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
}

lazy_load "Kubernetes Completion" init_kube kubectl

# Google Cloud SDK's Shell Autocompletions.
li_mark "Loading Google Cloud Completion"

init_gcloud() {
  if [ -f "$HOME/lib/gcloud/path.zsh.inc" ]; then source "$HOME/lib/gcloud/path.zsh.inc"; fi
  if [ -f "$HOME/lib/gcloud/completion.zsh.inc" ]; then source "$HOME/lib/gcloud/completion.zsh.inc"; fi
}

lazy_load "Google Cloud Completion" init_gcloud gcloud

# Microsoft Azure CLI's Shell Autocompletions.
li_mark "Loading Azure Completion"

init_azure() {
  autoload bashcompinit && bashcompinit && source "$HOME/lib/azure-cli/az.completion"
}

lazy_load "Azure Completion" init_azure azure

li_mark "Activating iTerm Integration"

# Shell Integration for iTerm Terminal Emulator on macOS.
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

li_mark "Enabling Node version Manager"

# --- Lazy Load Node's Version Manager (NVM) ---

if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"

  init_nvm() {
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    . "$NVM_DIR"/nvm.sh
  }

  lazy_load "Node Version Manager" init_nvm nvm node npm yarn gulp grunt webpack truffle npx
fi

li_mark "Loading Kubectl Aliases"

# Alias for Kubernetes
source ~/.kubectl_aliases

# Lazy Load SDK Manager
if ([[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]) {
  export SDKMAN_DIR="$HOME/.sdkman"

  init_sdkman() {
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
  }

  lazy_load "SDK Manager" init_sdkman sdk
}

# Lazy Load Emscripten SDK
init_emsdk() {
  source "$HOME/lib/emsdk/emsdk_env.sh" > /dev/null
}

lazy_load "Emscripten SDK" init_emsdk emsdk emcc

# Lazy Load Vault Autocompletion
li_mark "Loading Vault Completion"

init_vault() {
  complete -o nospace -C /Users/phoomparin/bin/vault vault
}

lazy_load "Vault Completion" init_vault vault

# Lazy Load Ruby's Version Manager (RVM)
li_mark "Enabling Ruby Version Manager"

init_rvm() {
  source "$HOME/.rvm/scripts/rvm"
}

lazy_load "Ruby Version Manager" init_rvm irb rake rails

# Lazy Load DigitalOcean Completion
li_mark "Loading DigitalOcean Completion"

init_doctl() {
  source <(doctl completion zsh)
}

lazy_load "DigitalOcean CLI" init_doctl doctl

export EDITOR='nvim'
export VISUAL='nvim'

li_stop
