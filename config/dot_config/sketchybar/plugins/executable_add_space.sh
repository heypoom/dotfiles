#!/usr/bin/env zsh

sketchybar --set $NAME

mouse_clicked() {
	sketchybar --trigger windows_on_spaces --trigger space_change
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
