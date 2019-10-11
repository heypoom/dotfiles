function add_universal_path
    set -U fish_user_paths $fish_user_paths $argv
end

function add_path
    set -gx PATH $argv $PATH
end

set ASDF_DIR $HOME/.asdf

# Activate asdf
# if test -e $ASDF_DIR/asdf.fish
#   source $ASDF_DIR/asdf.fish
# end

add_path $HOME/Scripts

add_path /usr/local/opt/llvm/bin
add_path /usr/local/opt/coreutils/libexec/gnubin

add_path $GEM_HOME/bin

add_path /usr/local/bin /usr/bin /usr/local/sbin /usr/libexec

add_path $ANDROID_HOME/tools
add_path $ANDROID_HOME/platform-tools

add_path $HOME/.fastlane/bin

add_path $HOME/.cargo/bin
add_path $HOME/lib/gcloud/bin
add_path $HOME/.config/yarn/global/node_modules/.bin

add_path $HOME/.pyenv/bin
add_path $HOME/.poetry/bin
add_path $HOME/lib/flutter/bin
add_path /usr/local/opt/dart@2/bin
add_path $HOME/Library/Python/3.6/bin

add_path $GOPATH/bin
add_path $HOME/bin $HOME/.local/bin

# add_path $HOME/.platformio/penv/bin

add_path $HOME/lib/emsdk/emscripten/1.37.34/bin

add_path /usr/local/opt/m4/bin

add_path $HOME/.stack/programs/x86_64-osx/ghc-8.6.4/bin

add_path $ASDF_DIR
add_path $ASDF_DIR/bin
add_path $ASDF_DIR/shims

# Use gnu manuals too
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman/ /usr/share/man $MANPATH
