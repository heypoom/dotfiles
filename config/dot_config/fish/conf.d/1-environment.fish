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

# Fish
set -gx MISE_EXPERIMENTAL 1
set -gx MISE_FISH_AUTO_ACTIVATE 0

# Also Use Neovim as the React editor
set -gx REACT_EDITOR nvim
set -gx REACT_EDITOR_CMD nvim

# Define Android's SDK Path
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# Enable Gradle Daemon
set -gx GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Define Go's $GOPATH
set -gx GOPATH "$HOME/Go"

# Define PyEnv's Root
set -gx PYENV_ROOT "$HOME/.pyenv"

# Define Flutter's Root
set -gx FLUTTER_ROOT "$HOME/flutter"

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
set -gx PKG_CONFIG_PATH "/opt/homebrew/lib/pkgconfig:/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/libusb/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Set XCode build configuration (Rust, PyEnv and many build tools depend on this!)
# set -gx SDKROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.1.sdk"
set -gx SDKROOT "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

# Set macOS deployment target to 10.15
set -gx MACOSX_DEPLOYMENT_TARGET 10.15

# Set wasmer directory
set -gx WASMER_DIR "$HOME/.wasmer"
set -gx WASMER_CACHE_DIR "$WASMER_DIR/cache"

# Prevent ranger from loading default configuration.
set -gx RANGER_LOAD_DEFAULT_RC FALSE

# Add GNU manuals to the MANPATH
set -gx MANPATH \
	/usr/local/opt/coreutils/libexec/gnuman/ \
	/usr/share/man \
	/usr/local/share/man \
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man \
	$MANPATH

# Use Neovim as man's pager.
set -gx MANPAGER "nvim +Man!"

# Configure fzf to use fd as default command.
set -gx FZF_DEFAULT_COMMAND 'fd --type f --follow --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Wasmer
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# SDK Home
set -gx WASMTIME_HOME "$HOME/.wasmtime"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx BUN_INSTALL "$HOME/.bun"
set -gx CONDA_HOME "/opt/homebrew/anaconda3"

# Configure the environment variables.
# TODO: add RTX paths
set -gx PATH \
  $HOME/.npm-global/bin \
  $WASMER_DIR/bin \
  $PNPM_HOME \
  $VOLTA_HOME/bin \
  $WASMTIME_HOME/bin \
  $HOME/.config/yarn/global/node_modules/.bin \
  $BUN_INSTALL/bin \
  $GEM_HOME/bin \
  $CONDA_HOME/bin \
  /usr/libexec \
  $HOME/scripts \
  $HOME/.nix-profile/bin \
  /nix/var/nix/profiles/default/bin \
  /opt/homebrew/bin \
  /usr/local/opt/llvm/bin \
  /usr/local/opt/coreutils/libexec/gnubin \
  /usr/local/opt/binutils/bin \
  /Library/TeX/texbin \
  /Library/TeX/Distributions/.DefaultTeX \
  /Library/Apple/usr/bin \
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
  $HOME/.fig/bin \
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
  /Applications/Wireshark.app/Contents/MacOS \
  $HOME/flutter/bin \
  $HOME/.elan/bin \
  $HOME/.emacs.d/bin \
  $HOME/.kit/bin \
  ~/Library/Android/sdk/build-tools/34.0.0 \
  $HOME/.kenv/bin \
  /opt/homebrew/opt/binutils/bin

# Populate the OpenAI API Key
set -gx OPENAI_KEY_FILE "$HOME/.openai.key"

if test -e $OPENAI_KEY_FILE
	set -gx OPENAI_API_KEY (cat $OPENAI_KEY_FILE | tr '\n' ' ')
end

# Set the enhancd command to ecd (https://github.com/b4b4r07/enhancd)
set -gx ENHANCD_COMMAND ecd

# Use sccache for Rust build caching.
set -gx RUSTC_WRAPPER sccache

# Disable homebrew env hints
set -gx HOMEBREW_NO_ENV_HINTS true

# Neovim default distribution (nvchad, lazyvim, kickstart, astronvim)
set -gx NVIM_APPNAME nvchad

