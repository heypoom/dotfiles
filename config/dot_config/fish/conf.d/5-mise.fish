set -l mise_bin ""

if command -q mise
  set mise_bin mise
else if test -x "$HOME/.local/bin/mise"
  set mise_bin "$HOME/.local/bin/mise"
else if test -x "/opt/homebrew/bin/mise"
  set mise_bin "/opt/homebrew/bin/mise"
end

if test -n "$mise_bin"
  if status is-interactive
    $mise_bin activate fish | source
  else
    $mise_bin activate fish --shims | source
  end
end

