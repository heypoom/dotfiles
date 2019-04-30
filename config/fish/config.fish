# Enable vi key bindings
fish_vi_key_bindings

# Python Environment Manager
# pyenv init - | source

# Golang Environment Manager
# goenv init - | source

# Google Cloud
# if test ~/lib/gcloud/path.fish.inc
#     source ~/lib/gcloud/path.fish.inc
# end

function virtualfish
  eval (python3 -m virtualfish)
end

if type -q kitty
  kitty + complete setup fish | source
end

# Path for pkgconfig
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig"

revolver stop
