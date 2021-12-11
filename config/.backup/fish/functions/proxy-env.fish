function proxy-env
  # Configure HTTP_PROXY environment variables
  set proxyinfo (networksetup -getwebproxy "Wi-Fi")
  set HOST (printf "%s\n" $proxyinfo | rg -i "Server" | awk '{print $2}')
  set PORT (printf "%s\n" $proxyinfo | rg -i "Port" | awk '{print $2}')
  set -gx HTTP_PROXY "http://$HOST:$PORT"

  # Configure HTTPS_PROXY environment variables
  set proxyinfo (networksetup -getsecurewebproxy "Wi-Fi")
  set HOST (printf "%s\n" $proxyinfo | rg -i "Server" | awk '{print $2}')
  set PORT (printf "%s\n" $proxyinfo | rg -i "Port" | awk '{print $2}')
  set -gx HTTPS_PROXY "https://$HOST:$PORT"
end
