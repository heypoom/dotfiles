function proxy-off
  networksetup -setwebproxystate "Wi-Fi" off
  networksetup -setsecurewebproxystate "Wi-Fi" off

  # Configure HTTP_PROXY and HTTPS_PROXY environment variables
  set -e HTTP_PROXY
  set -e HTTPS_PROXY
end
