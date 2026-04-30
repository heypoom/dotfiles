set -l mise_shims "$HOME/.local/share/mise/shims"

if test -d "$mise_shims"
  fish_add_path --global --move --path "$mise_shims"
end

