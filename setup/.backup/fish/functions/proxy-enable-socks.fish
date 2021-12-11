# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.ccm5Zf/proxy-enable-socks.fish @ line 1
function proxy-enable-socks
	set adapter "Wi-Fi"
	set host argv[1]
	set port argv[2]

	printf "Proxying SOCKS5 to %s:%s" host port

	networksetup -setsocksfirewallproxy $adapter $host $port
	networksetup -setsocksfirewallproxystate $adapter on
end
