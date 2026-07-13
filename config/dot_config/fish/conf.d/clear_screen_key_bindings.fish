status is-interactive || exit

function _poom_clear_screen
    commandline -f clear-screen

    if set -q TMUX_PANE
        command tmux clear-history -t "$TMUX_PANE" 2>/dev/null
    end

    commandline -f repaint
end

function _poom_clear_screen_key_bindings --on-variable fish_key_bindings
    bind --mode insert ctrl-l _poom_clear_screen
    bind --mode default ctrl-l _poom_clear_screen
end

_poom_clear_screen_key_bindings
