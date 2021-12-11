# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.V1NyFT/proxy-status.fish @ line 2
function proxy-status
	echo "== System HTTP =="
	networksetup -getwebproxy "Wi-Fi"
	echo

	echo "== System HTTPS =="
	networksetup -getsecurewebproxy "Wi-Fi"
	echo

	echo "=> Shell HTTP:" $HTTP_PROXY
	echo "=> Shell HTTPS:" $HTTPS_PROXY
end
