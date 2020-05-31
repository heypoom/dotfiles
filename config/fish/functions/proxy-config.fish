# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.MKERIl/proxy-config.fish @ line 1
function proxy-config
	set adapter "Wi-Fi"
	set host argv[1]
	set port argv[2]

	printf "Proxying to %s:%s" host port

	networksetup -setwebproxy $adapter $host $port
	networksetup -setwebproxystate $adapter on

	networksetup -setsecurewebproxy $adapter $host $port
  networksetup -setsecurewebproxystate $adapter on
end
