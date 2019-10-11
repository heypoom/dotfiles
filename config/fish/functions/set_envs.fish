echo Setting environment variables...

# Compilation flags
set -Ux ARCHFLAGS '-arch x86_64'

# Always use en_US and UTF-8 for everything.
set -Ux LC_ALL en_US.UTF-8
set -Ux LC_CTYPE en_US.UTF-8
set -Ux LANG en_US.UTF-8
set -Ux LANGUAGE en_US.UTF-8

# Prefer Neovim as the default editor.
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux FILTER fzf

# Also Use Neovim as the React editor
set -Ux REACT_EDITOR nvim
set -Ux REACT_EDITOR_CMD '/usr/local/bin/nvim'

# Define Android's SDK Path
set -Ux ANDROID_HOME "$HOME/Library/Android/sdk"

# Enable Gradle Daemon
set -Ux GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Define Go's $GOPATH
set -Ux GOPATH "$HOME/Go"

# Define PyEnv's Root
set -Ux PYENV_ROOT "$HOME/.pyenv"

# Define Flutter's Root
set -Ux FLUTTER_ROOT "$HOME/lib/flutter"

# Defines Rust's Source Path for Racer Autocompletion
set -Ux RUST_SRC_PATH "(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Set RubyGem's home and path
set -Ux GEM_HOME "$HOME/.gem"
set -Ux GEM_PATH "$HOME/.gem"

# Path for LDFLAGS
set -Ux CPPFLAGS "-I /usr/local/opt/binutils/include"
set -Ux LDFLAGS "-L /usr/local/opt/libffi/lib"
# set -Ux LDFLAGS "-L /usr/local/opt/libffi/lib -L /usr/local/opt/binutils/lib"

# Enable Go Modules
set -Ux GO111MODULE auto

# Configure Node Path
set -Ux NODE_PATH "$HOME/.config/yarn/global/node_modules:/usr/local/lib/node_modules"

set -Ux cabal_helper_libexecdir "$HOME/bin"

set -Ux BAT_THEME "Dracula"
