#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar top -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar_top.log & disown
polybar bottom -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar_bottom.log & disown

echo "Bars launched..."
