#!/usr/bin/env bash
# ~/.config/bspwm/launch.sh

# Terminate already running bar instances
killall -q polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -q -c ~/.config/i3/config-polybar top &
polybar -q -c ~/.config/i3/config-polybar bottom &

notify-send "Welcome to i3-gaps"
