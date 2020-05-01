# Compilation flags
set -gx ARCHFLAGS '-arch x86_64'

# Always use en_US and UTF-8 for everything.
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8

# Prefer Neovim as the default editor.
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx FILTER fzf

# Also Use Neovim as the React editor
set -gx REACT_EDITOR nvim
set -gx REACT_EDITOR_CMD '/usr/local/bin/nvim'

# Define Android's SDK Path
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# Enable Gradle Daemon
set -gx GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Define Go's $GOPATH
set -gx GOPATH "$HOME/Go"

# Define PyEnv's Root
set -gx PYENV_ROOT "$HOME/.pyenv"

# Define Flutter's Root
set -gx FLUTTER_ROOT "$HOME/lib/flutter"

# Defines Rust's Source Path for Racer Autocompletion
# set -gx RUST_SRC_PATH "(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Set RubyGem's home and path
set -gx GEM_HOME "$HOME/.gem"
set -gx GEM_PATH "$HOME/.gem"

# Path for LDFLAGS
# set -gx CPPFLAGS "-I /usr/local/opt/binutils/include"
# set -gx LDFLAGS "-L /usr/local/opt/libffi/lib"
# set -gx LDFLAGS "-L /usr/local/opt/libffi/lib -L /usr/local/opt/binutils/lib"

# Enable Go Modules
set -gx GO111MODULE auto

# Configure Node Path
set -gx NODE_PATH "$HOME/.config/yarn/global/node_modules:/usr/local/lib/node_modules"

set -gx cabal_helper_libexecdir "$HOME/bin"
