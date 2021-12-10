# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.nBKgnV/commits-spark.fish @ line 1
function commits-spark
	git log --author="$argv" --format=format:%ad --date=short | uniq -c | awk '{print $1}' | spark | lolcat
end
