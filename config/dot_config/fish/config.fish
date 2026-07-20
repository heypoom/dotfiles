if test -d /opt/homebrew/share/fish/vendor_completions.d
  contains -- /opt/homebrew/share/fish/vendor_completions.d $fish_complete_path
  or set -g fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
end
