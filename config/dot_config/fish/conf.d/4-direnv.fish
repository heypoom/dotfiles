set -x DIRENV_BIN (which direnv)

if test -e "$DIRENV_BIN"
	function __direnv_export_eval --on-event fish_postexec;
		"$DIRENV_BIN" export fish | source;
	end
end

