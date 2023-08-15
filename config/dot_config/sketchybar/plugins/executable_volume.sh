#!/usr/bin/env zsh

WIDTH=100

detail_on() {
  sketchybar --animate tanh 30 --set volume_slider slider.width=$WIDTH
  sketchybar --set $NAME label.padding_right=5
}

detail_off() {
  sketchybar --animate tanh 30 --set volume_slider slider.width=0
  sketchybar --set $NAME label.padding_right=0
}

mouse_clicked() {
	INITIAL_WIDTH=$(sketchybar --query volume_slider | jq -r ".slider.width")

	if [ "$INITIAL_WIDTH" -eq "0" ]; then
		detail_on
	else
		detail_off
	fi
}

update() {
	case ${INFO} in
		0)
				ICON=""
				ICON_PADDING_RIGHT=6
				;;
		[0-9])
				ICON=""
				ICON_PADDING_RIGHT=12
				;;
		*)
				ICON=""
				ICON_PADDING_RIGHT=6
				;;
	esac

	sketchybar --set $NAME icon="$ICON" icon.padding_right="$ICON_PADDING_RIGHT" label="$INFO%"
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
