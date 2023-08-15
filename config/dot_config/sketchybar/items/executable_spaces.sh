#!/usr/bin/env zsh

source "$HOME/.config/sketchybar/config.sh"

count=$(yabai -m query --spaces | jq length)

for ((i = 1; i <= 10; i++))
do
	space="space.$i"

	sketchybar --add space $space left \
	           --set $space associated_space=$i \
							icon="$i" \
							icon.padding_left=10 \
							icon.padding_right=5 \
							icon.color=$WHITE \
							icon.highlight_color=$BG \
							background.color=$BG \
							icon.font="$FONT_FACE:Bold:14.0" \
							script="$PLUGIN_SHARED_DIR/space.sh" \
	           --subscribe $space space_change mouse.clicked
done

sketchybar --add item add_space left \
    --set add_space \
    background.color=0xee232639 \
    icon.padding_left=10 \
    icon.padding_right=5 \
		icon.font="$FONT_FACE:Bold:14.0" \
    script="$PLUGIN_SHARED_DIR/add_space.sh" \
    --subscribe add_space space_change mouse.clicked
