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

# Path for pkgconfig
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/libusb/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Define Java's SDK Path
set -gx JAVA_HOME "$HOME/.asdf/installs/java/openjdk-11.0.1"
set -gx JAVA8_HOME "$HOME/.asdf/installs/java/oracle-8.141"

# Set XCode build configuration (mainly for pyenv)
set -gx SDKROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk"
set -gx MACOSX_DEPLOYMENT_TARGET 10.15

# Set wasmer directory
set -gx WASMER_DIR "$HOME/.wasmer"
set -gx WASMER_CACHE_DIR "$WASMER_DIR/cache"

# Add GNU manuals to the MANPATH
set -gx MANPATH \
	/usr/local/opt/coreutils/libexec/gnuman/ \
	/usr/share/man \
	/usr/local/share/man \
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man \
	$MANPATH

# Use Neovim as man's pager.
set -gx MANPAGER "nvim -c 'set ft=man' -"

# Configure fzf to use fd as default command.
set -gx FZF_DEFAULT_COMMAND 'fd --type f --follow --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Configure the environment variables.
set -gx PATH \
  $WASMER_DIR/bin \
  $HOME/.config/yarn/global/node_modules/.bin \
  $HOME/.asdf/shims \
  $HOME/.asdf/bin \
  $GEM_HOME/bin \
  $HOME/.emacs.d/bin/ \
  /usr/libexec \
  $HOME/scripts \
  /usr/local/opt/llvm/bin \
  /usr/local/opt/coreutils/libexec/gnubin \
  /usr/local/opt/binutils/bin \
  $ANDROID_HOME/tools \
  $ANDROID_HOME/platform-tools \
  $HOME/.fastlane/bin \
  $HOME/.pub-cache/bin \
  $HOME/.cargo/bin \
  $HOME/.deno/bin \
  $HOME/lib/gcloud/bin \
  $HOME/.poetry/bin \
  $HOME/lib/flutter/bin \
  /usr/local/opt/dart@2/bin \
  $HOME/Library/Python/3.7/bin \
  $GOPATH/bin \
  $HOME/bin \
  $HOME/.local/bin \
  $HOME/.platformio/penv/bin \
  $HOME/lib/emsdk/emscripten/1.37.34/bin \
  $HOME/.stack/programs/x86_64-osx/ghc-8.6.4/bin \
  /usr/local/bin \
  /usr/bin \
  /usr/local/sbin \
  /bin \
  /usr/sbin \
  /sbin \
  /opt/X11/bin \
  $WASMER_DIR/wapm_packages/.bin \
  /usr/local/share/dotnet \
  $HOME/.dotnet/tools \
  /usr/local/MacGPG2/bin \
  /Applications/Wireshark.app/Contents/MacOS

