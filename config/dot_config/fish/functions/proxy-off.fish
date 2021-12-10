# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.CFG9fG/proxy-off.fish @ line 2
function proxy-off
  set adapter "Wi-Fi"

  networksetup -setwebproxystate $adapter off
  networksetup -setsecurewebproxystate $adapter off
  networksetup -setsocksfirewallproxystate $adapter off

  # Configure HTTP_PROXY and HTTPS_PROXY for shell
  set -e HTTP_PROXY
  set -e HTTPS_PROXY
end
