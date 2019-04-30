alias eject "diskutil eject"
alias flushdns "dscacheutil -flushcache"
alias mywireless "system_profiler SPAirPortDataType | awk -F\": \" '/Current Wireless Network/{print $2}'"
alias open_dot 'dot -Tpng | open -f -a preview'
alias reveal 'open --reveal'
# alias top 'TERM=vt100 top'

# Quicklook and Spotlight
alias ql 'qlmanage -p'
alias quicklook 'qlmanage -p'
alias spotlighter 'mdfind -onlyin `pwd`'

# Clipboard manipulation
alias gpaste "pbpaste | perl -pe 's/\r\n|\r/\n/g'"
alias pbclean "pbpaste | perl -pe 's/\r\n|\r/\n/g' | pbcopy"
alias pbsort "pbpaste | sort | pbcopy"

# `wifi on` to turn wifi on, and `wifi off` to turn it off
alias wifi "networksetup -setairportpower (networksetup -listallhardwareports | grep -A 2 'Hardware Port: Wi-Fi' | grep 'Device:' | awk '{print $2}')"

# Show/hide hidden files in Finder
function show-dotfiles
    defaults write com.apple.Finder AppleShowAllFiles -bool true
    killall Finder
end

function hide-dotfiles
    defaults write com.apple.Finder AppleShowAllFiles -bool false
    killall Finder
end

# Hide/show all desktop icons for presenting
function show-desktop-icons
    defaults write com.apple.finder CreateDesktop -bool true
    killall Finder
end

function hide-desktop-icons
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder
end

# Mute the audio
function stfu
    osascript -e 'set volume output muted true'
end

if [ -x '/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke' ]
    alias stroke '/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
end

if [ -x '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' ]
    alias airport '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
end

# macOS has a habit of changing the way it does some of its non-posixy things
# every major rev or so. Add a helper to standardize detecting the rev
function macos-major-version
    sw_vers -productVersion | awk -F '.' '{print $1 "." $2}'
end

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf '/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Deal with some things macOS userland is missing

# Canonical hex dump; some systems have this symlinked
alias hd "hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback if it hasn't been
# been installed with brew/macports/fink
# alias md5sum (which md5)

# macOS has no `sha1sum`, so use `shasum` as a fallback if it hasn't been
# been installed with brew/macports/fink
# alias sha1sum (which shasum)

# Old-school OS9 and early Mac text files had a different line ending than
# *nix, deal with converting back and forth.
alias mac2unix "tr '\015' '\012'"
alias unix2mac "tr '\012' '\015'"

# Zap those damn .DS_Store files
function zap-ds-store
    if [ -d $1 ]
        find $1 -type f -name '.DS_Store' -delete -ls
    end
end

function mighty-mouse-battery
    ioreg -n "AppleBluetoothHIDMouse" | grep -i "batterypercent" | sed 's/[^[:digit:]]//g'
end

function manp
    man -t $argv | ps2pdf - - | open -f -a Preview
end
