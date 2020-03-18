# Defined in /var/folders/ld/wvhk0wnx49176rt_01d1c2rw0000gp/T//fish.9aP0A9/c.fish @ line 2
function c --description 'Clears the screen'
	clear

  # Do not clear history if tmux is down
  if tmux info > /dev/null 2>&1
    tmux clear-history
  end
end
