# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.2nHuFH/proxy-config.fish @ line 2
function proxy-config
	set adapter "Wi-Fi"
	set host argv[1]
	set port argv[2]

	printf "Proxying to %s:%s" $host $port

	networksetup -setwebproxy $adapter $host $port
	networksetup -setwebproxystate $adapter on

	networksetup -setsecurewebproxy $adapter $host $port
  networksetup -setsecurewebproxystate $adapter on
end
