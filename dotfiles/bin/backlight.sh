#!/bin/bash
set -e
backlight_name=$1
file="/sys/class/backlight/$backlight_name/brightness"
current=$(cat "$file")
new="$current"
if [ "$2" = "-inc" ]
then
    new=$(( current + $3 ))
fi
if [ "$2" = "-dec" ]
then
    new=$(( current - $3 ))
fi
echo "$new" | tee "$file"
