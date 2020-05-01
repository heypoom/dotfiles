# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.6ik5at/ip-camera-view.fish @ line 2
function ip-camera-view
	adb forward tcp:8080 tcp:8080

	'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' --app='http://localhost:8080/video' --window-size='1920,1080'
end
