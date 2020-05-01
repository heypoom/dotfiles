# iTerm Integration
if test "$TERM_PROGRAM" = iTerm.app
	set -gx iterm2_hostname "phoomparin.local"
	set -gx ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX true

  test -e {$HOME}/.iterm2_shell_integration.fish && source {$HOME}/.iterm2_shell_integration.fish
end

