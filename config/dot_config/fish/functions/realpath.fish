# With no argument, resolve the current directory, as macOS's BSD realpath does.
# GNU realpath errors instead, which breaks to-fish's `to add <name>` on Linux.
function realpath --wraps realpath
    if test (count $argv) -eq 0
        command realpath .
    else
        command realpath $argv
    end
end
