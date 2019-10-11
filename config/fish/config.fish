# Enable vi key bindings
fish_vi_key_bindings

function virtualfish
  eval (python3 -m virtualfish)
end

# if type -q kitty
#   kitty + complete setup fish | source
# end

# Path for pkgconfig
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig"

# Define Java's SDK Path
set -gx JAVA_HOME (asdf where java)

# iTerm Integration
if test "$TERM_PROGRAM" = iTerm.app
	set -gx iterm2_hostname "phoomparin.local"
	set -gx ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX true

  test -e {$HOME}/.iterm2_shell_integration.fish && source {$HOME}/.iterm2_shell_integration.fish
end

revolver stop
