set -gx OMF_PATH "$HOME/.local/share/omf"

if test -d $OMF_PATH
    source $OMF_PATH/init.fish
end
