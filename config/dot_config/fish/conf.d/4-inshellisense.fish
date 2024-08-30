# ---------------- inshellisense shell plugin ----------------
if test -z "$ISTERM" && status --is-interactive
  if status --is-login
    is -s fish --login ; kill %self
  else
    is -s fish ; kill %self
  end
end

