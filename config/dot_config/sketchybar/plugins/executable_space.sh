#!/bin/bash

source "$HOME/.config/sketchybar/config.sh"

update() {
	bg_color=$BG

  if [ "$SELECTED" = "true" ]
	then
    bg_color=$ACTIVE_BG
  fi

  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
  											 background.color=$bg_color
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
