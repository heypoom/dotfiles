#!/usr/bin/env zsh

NEXT_SPACE=$(($(yabai -m query --spaces | jq length) + 1))
sketchybar --set $NAME icon="$NEXT_SPACE"

mouse_clicked() {
	yabai -m space --create
	sketchybar --trigger windows_on_spaces --trigger space_change
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
