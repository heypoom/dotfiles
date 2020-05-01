# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.QDfdMu/gcap.fish @ line 2
function gcap
	if test (count $argv) -lt 1
		echo "Please provide a commit message!"
		return
	end

	git add --all
  git commit -v -m $argv[1]
  git push
end
