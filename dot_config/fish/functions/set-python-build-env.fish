# Defined in /var/folders/53/f2kch9hd5rxbkzjr4p9cg90w0000gn/T//fish.kHTVgs/set-python-build-env.fish @ line 2
function set-python-build-env
	set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
	set -gx KEEP_BUILD_PATH trueunction

	set -gx CFLAGS "-I/usr/local/opt/openssl/include -I/usr/local/opt/readline/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"

	set -gx SDKROOT "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
	set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
	set -gx LDFLAGS "-L/usr/local/opt/openssl/lib -L/usr/local/opt/readline/lib"
end
