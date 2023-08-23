#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5

case $INFO in
"Arc")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Code")
    ICON_PADDING_RIGHT=4
    ICON=󰨞
    ;;
"Emacs")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Things")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Obsidian")
    ICON_PADDING_RIGHT=4
    ICON=󰍔
    ;;
"System Settings")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"MongoDB Compass "*"."*"."*)
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Calendar")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Discord")
    ICON=󰙯
    ;;
"FaceTime")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Finder")
    ICON=
    ;;
"Music")
    ICON=󰎄
    ;;
"Keynote")
    ICON=󰐨
    ;;
"Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"IINA")
    ICON_PADDING_RIGHT=4
    ICON=󰕼
    ;;
"kitty")
    ICON=󰄛
    ;;
"Messages")
    ICON=󰍦
    ;;
"Notion")
    ICON_PADDING_RIGHT=6
    ICON=󰈄
    ;;
"Preview")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"PS Remote Play")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"TextEdit")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Transmission")
    ICON_PADDING_RIGHT=3
    ICON=󰶘
    ;;
*)
    ICON=󰘔
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
