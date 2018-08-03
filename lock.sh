#!/bin/bash

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop


function main {
  local image="/tmp/screen.png"
  local externalmon='false'

  if ! [[ -e "$image" ]]; then
    unset image
  fi

  xrandr -q | grep -q "HDMI-1 connected" && externalmon='true'

  $externalmon && xrandr --output HDMI-1 --brightness 0

  i3lock -n -u -e ${image:+-t -i $image}

  $externalmon && xrandr --output HDMI-1 --brightness 1
}

main "$@"

rm /tmp/screen.png
