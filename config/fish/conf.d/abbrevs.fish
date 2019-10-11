if not set -q abbrs_initialized
    set -U abbrs_initialized

    echo Setting abbreviations...

    abbr -a gdh 'git diff HEAD'
    abbr -a n node
    abbr -a fu fuck

    abbr -a h 'howdoi -c'
    abbr -a k kubectl
    abbr -a r ranger

    abbr -a p python3
    abbr -a py python3
    abbr -a py2 python2
    abbr -a py3 python3

    abbr -a m make

    abbr -a rb ruby

    abbr -a t tmux
    abbr -a ta 'tmux a -t'
    abbr -a tns 'tmux new -s'

    abbr -a mux tmuxinator

    abbr -a u docker-compose up

    abbr -a vi nvim
    abbr -a vim nvim
    abbr -a vis 'sudo nvim'

    abbr -a y yarn

    abbr -a l exa
    abbr -a ls exa
    abbr -a la "exa -lagh --git"

    echo 'Abbreviations Set!'
end
