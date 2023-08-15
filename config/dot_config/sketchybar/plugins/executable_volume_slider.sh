source "$HOME/.config/sketchybar/config.sh"

volume_change() {
  sketchybar --animate tanh 30 --set volume label.padding_right=5

  sketchybar --set $NAME slider.percentage=$INFO \
             --animate tanh 30 --set $NAME slider.width=$SLIDER_WIDTH 

  sleep 2

  # Check wether the volume was changed another time while sleeping
  FINAL_PERCENTAGE=$(sketchybar --query $NAME | jq -r ".slider.percentage")

  if [ "$FINAL_PERCENTAGE" -eq "$INFO" ]; then
    sketchybar --animate tanh 30 --set $NAME slider.width=0
		sketchybar --animate tanh 30 --set volume label.padding_right=0
  fi
}

mouse_entered() {
  sketchybar --set $NAME slider.knob.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME slider.knob.drawing=off
}

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE"
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") mouse_entered
  ;;
  "mouse.exited") mouse_exited
  ;;
esac
